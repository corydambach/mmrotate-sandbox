python demo/huge_image_demo.py demo/skyfi-superhigh-texas.png \
    redet_re50_refpn_1x_dota_ms_rr_le90.py \
    redet_re50_fpn_1x_dota_ms_rr_le90-fc9217b5.pth --patch_sizes=640 --patch_steps=480

python demo/huge_image_demo.py demo/skyfi-superhigh-texas.png \
    oriented_rcnn_r50_fpn_1x_dota_le90.py \
    oriented_rcnn_r50_fpn_1x_dota_le90-6d2b2ce0.pth \
    --patch_sizes=640 --patch_steps=480

python ../../demo/huge_image_demo.py ../../demo/skyfi-superhigh-texas.png \
    redet_re50_refpn_1x_dota_ms_rr_le90.py \
    redet_re50_fpn_1x_dota_ms_rr_le90-fc9217b5.pth --patch_sizes=640 --patch_steps=480