#!/usr/bin/env python3

import zmq
import json
import time
import argparse

def main():
    parser = argparse.ArgumentParser(description='zmq inference client')
    parser.add_argument('--img', required=True, help='image filename (relative to server images dir)')
    parser.add_argument('--patch-size', type=int, default=1024, help='patch size (default: 1024)')
    parser.add_argument('--step-size', type=int, default=824, help='step size (default: 824)')
    parser.add_argument('--img-ratios', type=float, nargs='+', default=[1.0], help='image ratios (default: [1.0])')
    parser.add_argument('--merge-iou-thr', type=float, default=0.1, help='merge iou threshold (default: 0.1)')
    parser.add_argument('--out-file', help='output file path')
    parser.add_argument('--host', default='localhost', help='server host (default: localhost)')
    parser.add_argument('--port', type=int, default=5555, help='server port (default: 5555)')
    parser.add_argument('--quiet', action='store_true', help='suppress progress output')
    
    args = parser.parse_args()
    
    # connect to server
    context = zmq.Context()
    socket = context.socket(zmq.DEALER)
    socket.connect(f"tcp://{args.host}:{args.port}")
    
    try:
        # prepare job arguments
        job_args = {
            'img': args.img,
            'patch_sizes': [args.patch_size],
            'patch_steps': [args.step_size],
            'img_ratios': args.img_ratios,
            'merge_iou_thr': args.merge_iou_thr
        }
        
        if args.out_file:
            job_args['out_file'] = args.out_file
        
        # enqueue job
        if not args.quiet:
            print(f"enqueueing {args.img}...")
            print(f"patch_size: {args.patch_size}, step_size: {args.step_size}")
        
        socket.send_string(json.dumps({
            'type': 'enqueue',
            'args': job_args
        }))
        
        response = json.loads(socket.recv_string())
        if response.get('status') != 'queued':
            print(f"error: {response}")
            return 1
            
        job_id = response['job_id']
        if not args.quiet:
            print(f"job {job_id} queued")
        
        # monitor progress
        while True:
            socket.send_string(json.dumps({
                'type': 'get_result',
                'job_id': job_id
            }))
            
            result = json.loads(socket.recv_string())
            
            if result['status'] == 'success':
                if args.quiet:
                    print(result['vehicle_count'])
                else:
                    print(f"done! found {result['vehicle_count']} vehicles")
                    if result.get('out_file'):
                        print(f"saved to: {result['out_file']}")
                return 0
                
            elif result['status'] == 'error':
                print(f"error: {result['error']}")
                return 1
                
            elif result['status'] == 'running' and not args.quiet:
                stage = result['job_status']['stage']
                progress = result['job_status']['progress'] * 100
                print(f"{stage} ({progress:.0f}%)")
            
            time.sleep(1)
    
    except KeyboardInterrupt:
        print("\ninterrupted")
        return 1
    except Exception as e:
        print(f"error: {e}")
        return 1
    finally:
        socket.close()
        context.term()

if __name__ == '__main__':
    exit(main())
    