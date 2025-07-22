
#!/usr/bin/env python3
"""
Example client for the ZeroMQ inference server.
Demonstrates how to enqueue jobs, check status, and get results.
"""

import zmq
import json
import time

def create_client(host="localhost", port=5555):
    """Create ZeroMQ client connection"""
    context = zmq.Context()
    socket = context.socket(zmq.DEALER)
    socket.connect(f"tcp://{host}:{port}")
    return socket, context

def send_message(socket, message):
    """Send message and receive response"""
    socket.send_string(json.dumps(message))
    response = json.loads(socket.recv_string())
    return response

def enqueue_job(socket, job_args):
    """Enqueue an inference job"""
    message = {
        'type': 'enqueue',
        'args': job_args
    }
    return send_message(socket, message)

def get_queue_status(socket):
    """Get current queue status"""
    message = {'type': 'queue_status'}
    return send_message(socket, message)

def get_result(socket, job_id):
    """Get result for a specific job"""
    message = {
        'type': 'get_result',
        'job_id': job_id
    }
    return send_message(socket, message)

def monitor_job(socket, job_id, check_interval=2):
    """Monitor a job until completion"""
    print(f"monitoring job {job_id}...")
    
    while True:
        result = get_result(socket, job_id)
        
        if result['status'] == 'success':
            print(f"job completed! found {result['vehicle_count']} vehicles")
            if result['out_file']:
                print(f"results saved to: {result['out_file']}")
            break
        elif result['status'] == 'error':
            print(f"job failed: {result['error']}")
            break
        elif result['status'] == 'running':
            job_status = result['job_status']
            print(f"{job_status['stage']} ({job_status['progress']:.1%}) - {job_status['message']}")
        elif result['status'] == 'queued':
            print("job is queued...")
        else:
            print(f"unknown status: {result}")
        
        time.sleep(check_interval)

def main():
    """Example usage"""
    socket, context = create_client()
    
    try:
        # Example job parameters (now only need image and optional params)
        job_args = {
            'img': 'dota_demo.jpg',  # relative to server's images directory
            'patch_sizes': [1024],
            'patch_steps': [824],
            'img_ratios': [1.0],
            'merge_iou_thr': 0.1,
            'out_file': 'vehicle_detections.npy'
        }
        
        # Enqueue job
        print("enqueueing inference job...")
        response = enqueue_job(socket, job_args)
        print(f"job enqueued: {response}")
        
        job_id = response['job_id']
        
        # Check queue status
        print("\nchecking queue status...")
        status = get_queue_status(socket)
        print(f"queue length: {len(status['queue'])}")
        print(f"active jobs: {len(status['active'])}")
        print(f"completed jobs: {status['completed_count']}")
        
        # Monitor job progress
        print(f"\nmonitoring job {job_id}...")
        monitor_job(socket, job_id)
        
        # Get final result
        print("\nfinal result:")
        final_result = get_result(socket, job_id)
        print(json.dumps(final_result, indent=2))
        
    except KeyboardInterrupt:
        print("\nclient interrupted")
    finally:
        socket.close()
        context.term()

if __name__ == '__main__':
    main()