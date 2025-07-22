#!/bin/bash
python server.py \
    --config mmrotate/configs/redet/redet_re50_refpn_1x_dota_ms_rr_le90.py \
    --checkpoint model/redet_re50_fpn_1x_dota_ms_rr_le90-fc9217b5.pth \
    --images-dir /mnt/d/Proj/clr/Satellite/Satellite/Files/aerial \
    --device cuda:0 \
    --port 5555