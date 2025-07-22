#!/bin/bash

# simple test client using curl-like approach with netcat
# requires: jq for json parsing

echo "testing zmq server..."

# create simple python one-liner for zmq test
python3 -c "
import zmq, json, time

socket = zmq.Context().socket(zmq.DEALER)
socket.connect('tcp://localhost:5555')

# enqueue job
print('enqueueing job...')
socket.send_string(json.dumps({
    'type': 'enqueue', 
    'args': {'img': 'test.jpg', 'out_file': 'results.npy'}
}))

job_id = json.loads(socket.recv_string())['job_id']
print(f'job {job_id} queued')

# monitor
while True:
    socket.send_string(json.dumps({'type': 'get_result', 'job_id': job_id}))
    result = json.loads(socket.recv_string())
    
    if result['status'] == 'success':
        print(f'done! found {result[\"vehicle_count\"]} vehicles')
        break
    elif result['status'] == 'error':
        print(f'error: {result[\"error\"]}')
        break
    elif result['status'] == 'running':
        stage = result['job_status']['stage']
        progress = result['job_status']['progress'] * 100
        print(f'{stage} ({progress:.0f}%)')
    
    time.sleep(1)
"