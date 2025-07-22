#!/usr/bin/env python3
"""
ZeroMQ-based inference server for huge image detection.
Supports multiple message types: enqueue, queue_status, get_result

Usage:
    python zmq_inference_server.py --config config.py --checkpoint model.pth --images-dir /path/to/images

Client example:
    import zmq, json
    context = zmq.Context()
    socket = context.socket(zmq.DEALER)
    socket.connect("tcp://localhost:5555")
    
    # Enqueue job
    socket.send_string(json.dumps({
        'type': 'enqueue',
        'args': {
            'img': 'dota_demo.jpg',  # relative to images-dir
            'patch_sizes': [1024],
            'patch_steps': [824],
            'img_ratios': [1.0],
            'merge_iou_thr': 0.1,
            'out_file': 'results.npy'
        }
    }))
"""

import zmq
import json
import threading
import time
import numpy as np
import os
from collections import deque
from dataclasses import dataclass, asdict
from typing import Optional

# MMRotate imports
from mmdet.apis import init_detector
from mmrotate.apis import inference_detector_by_patches
import mmcv

# Global configuration
SERVER_CONFIG = {
    'model': None,
    'config_path': None,
    'checkpoint_path': None,
    'images_dir': None,
    'device': 'cuda:0'
}

@dataclass
class JobStatus:
    id: str
    stage: str  # "queued", "loading_model", "running_inference", "processing_results", "complete", "error"
    progress: float  # 0.0 to 1.0
    started_at: Optional[float] = None
    message: str = ""

# Global state
job_queue = deque()
active_jobs = {}  # job_id -> JobStatus
completed_jobs = {}  # job_id -> result

def update_job_status(job_id, stage, progress=None, message=""):
    """Update the status of an active job"""
    if job_id in active_jobs:
        active_jobs[job_id].stage = stage
        if progress is not None:
            active_jobs[job_id].progress = progress
        active_jobs[job_id].message = message
        print(f"job {job_id}: {stage} ({progress:.1%} if progress else 'N/A') - {message}")

def process_results(img, result, out_file=None, **kwargs):
    """Process detection results and save to file
    
    Args:
        img (str or Tensor): The image to be displayed.
        result (Tensor or tuple): The results to draw over `img`
            bbox_result or (bbox_result, segm_result).
        out_file (str or None): The filename to write the image.
            Default: None.
    Returns:
        img (torch.Tensor): Only if not `show` or `out_file`
    """
    img = mmcv.imread(img)
    img = img.copy()
    if isinstance(result, tuple):
        bbox_result, segm_result = result
        if isinstance(segm_result, tuple):
            segm_result = segm_result[0]
    else:
        bbox_result, segm_result = result, None
    
    bboxes = np.vstack(bbox_result)
    labels = [
        np.full(bbox.shape[0], i, dtype=np.int32)
        for i, bbox in enumerate(bbox_result)
    ]
    labels = np.concatenate(labels)
    
    # Filter for small vehicles (class 4) and large vehicles (class 5)
    mask = (labels == 4) | (labels == 5)
    labels = labels[mask]
    bboxes = bboxes[mask]
    
    print(f"detected {len(bboxes)} vehicles.")
    
    if out_file is not None:
        reshaped = labels.reshape(-1, 1)
        concat = np.concatenate((bboxes, reshaped), axis=1)
        np.save(out_file, concat)
    
    return len(bboxes)

def validate_args(args):
    """Validate inference arguments"""
    required = ['img']
    for req in required:
        if req not in args:
            raise ValueError(f"missing required argument: {req}")
    
    # Validate image path
    img_path = os.path.join(SERVER_CONFIG['images_dir'], args['img'])
    if not os.path.exists(img_path):
        raise ValueError(f"image not found: {img_path}")
    
    # Set image to full path
    args['img'] = img_path
    
    # Set defaults
    args.setdefault('patch_sizes', [1024])
    args.setdefault('patch_steps', [824])
    args.setdefault('img_ratios', [1.0])
    args.setdefault('merge_iou_thr', 0.1)
    args.setdefault('out_file', None)
    
    return args

def run_inference_job(job):
    """Run inference on a single job"""
    job_id = job['id']
    args = job['args']
    
    try:
        # Validate arguments
        args = validate_args(args)
        
        # Use pre-loaded model
        update_job_status(job_id, "running_inference", 0.3, "running patch-based inference...")
        result = inference_detector_by_patches(
            SERVER_CONFIG['model'],
            args['img'],
            args['patch_sizes'],
            args['patch_steps'],
            args['img_ratios'],
            args['merge_iou_thr'],
            bs=args['batch_size']
        )
        
        # Stage 3: Process results
        update_job_status(job_id, "processing_results", 0.8, "processing detections...")
        vehicle_count = process_results(args['img'], result, out_file=args['out_file'])
        
        # Complete
        update_job_status(job_id, "complete", 1.0, f"found {vehicle_count} vehicles")
        completed_jobs[job_id] = {
            "status": "success", 
            "vehicle_count": vehicle_count,
            "out_file": args['out_file'],
            "completed_at": time.time()
        }
        
    except Exception as e:
        error_msg = f"error: {str(e)}"
        print(f"job {job_id} failed: {error_msg}")
        update_job_status(job_id, "error", 1.0, error_msg)
        completed_jobs[job_id] = {
            "status": "error", 
            "error": str(e),
            "completed_at": time.time()
        }
    
    finally:
        # Remove from active jobs
        if job_id in active_jobs:
            del active_jobs[job_id]

def worker():
    """Background worker thread to process jobs"""
    print("worker thread started")
    while True:
        if job_queue:
            job = job_queue.popleft()
            job_id = job['id']
            
            print(f"starting job {job_id}")
            
            # Move to active jobs
            active_jobs[job_id] = JobStatus(
                id=job_id, 
                stage="starting", 
                progress=0.0, 
                started_at=time.time(),
                message="job starting..."
            )
            
            # Run inference
            run_inference_job(job)
        else:
            time.sleep(0.1)

def start_server(config_path, checkpoint_path, images_dir, device='cuda:0', port=5555):
    """Start the ZeroMQ server"""
    
    # Initialize model once at startup
    print(f"loading model from {checkpoint_path}")
    print(f"using config: {config_path}")
    print(f"images directory: {images_dir}")
    
    if not os.path.exists(config_path):
        raise FileNotFoundError(f"config file not found: {config_path}")
    if not os.path.exists(checkpoint_path):
        raise FileNotFoundError(f"checkpoint file not found: {checkpoint_path}")
    if not os.path.exists(images_dir):
        raise FileNotFoundError(f"images directory not found: {images_dir}")
    
    # Load model
    model = init_detector(config_path, checkpoint_path, device=device)
    
    # Store in global config
    SERVER_CONFIG['model'] = model
    SERVER_CONFIG['config_path'] = config_path
    SERVER_CONFIG['checkpoint_path'] = checkpoint_path
    SERVER_CONFIG['images_dir'] = images_dir
    SERVER_CONFIG['device'] = device
    
    print("model loaded successfully")
    
    context = zmq.Context()
    socket = context.socket(zmq.ROUTER)
    socket.bind(f"tcp://*:{port}")
    
    print(f"zeromq inference server started on port {port}")
    print("supported message types: enqueue, queue_status, get_result")
    print(f"image files should be placed in: {images_dir}")
    
    # Start worker thread
    threading.Thread(target=worker, daemon=True).start()
    
    try:
        while True:
            # Receive message
            parts = socket.recv_multipart()
            if len(parts) == 2:
                client_id, message = parts
            elif len(parts) == 3:
                client_id, _, message = parts
            else:
                print(f"unexpected message format: {len(parts)} parts")
                continue
            
            try:
                msg = json.loads(message)
                msg_type = msg.get('type', 'unknown')
                
                if msg_type == 'enqueue':
                    # Add job to queue
                    job_id = f"job_{int(time.time() * 1000)}_{len(job_queue)}"
                    job_queue.append({'id': job_id, 'args': msg['args']})
                    
                    response = {
                        'status': 'queued', 
                        'job_id': job_id, 
                        'queue_position': len(job_queue),
                        'timestamp': time.time()
                    }
                    print(f"enqueued job {job_id}, queue position: {len(job_queue)}")
                    
                elif msg_type == 'queue_status':
                    # Return immediate status
                    response = {
                        'queue': [{'id': job['id'], 'status': 'queued'} for job in job_queue],
                        'active': {job_id: asdict(status) for job_id, status in active_jobs.items()},
                        'completed_count': len(completed_jobs),
                        'timestamp': time.time()
                    }
                    
                elif msg_type == 'get_result':
                    # Get result for specific job
                    job_id = msg.get('job_id')
                    if job_id in completed_jobs:
                        response = completed_jobs[job_id]
                    elif job_id in active_jobs:
                        response = {'status': 'running', 'job_status': asdict(active_jobs[job_id])}
                    elif any(job['id'] == job_id for job in job_queue):
                        response = {'status': 'queued'}
                    else:
                        response = {'status': 'not_found'}
                
                else:
                    response = {'error': f'unknown message type: {msg_type}'}
                
            except json.JSONDecodeError:
                response = {'error': 'invalid json'}
            except Exception as e:
                response = {'error': f'server error: {str(e)}'}
            
            # Send response
            if len(parts) == 2:
                socket.send_multipart([client_id, json.dumps(response).encode()])
            else:
                socket.send_multipart([client_id, b'', json.dumps(response).encode()])
            
    except KeyboardInterrupt:
        print("\nshutting down server...")
    finally:
        socket.close()
        context.term()

if __name__ == '__main__':
    import argparse
    
    parser = argparse.ArgumentParser(description='zeromq inference server')
    parser.add_argument('--config', required=True, help='path to model config file')
    parser.add_argument('--checkpoint', required=True, help='path to model checkpoint file')
    parser.add_argument('--images-dir', required=True, help='directory containing image files')
    parser.add_argument('--device', default='cuda:0', help='device used for inference')
    parser.add_argument('--port', type=int, default=5555, help='port to bind to')
    args = parser.parse_args()
    
    start_server(args.config, args.checkpoint, args.images_dir, args.device, args.port)