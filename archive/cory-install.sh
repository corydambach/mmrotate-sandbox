  236  conda remove --name openmmlab --all -y
  237  conda create --name openmmlab python=3.8 -y
  238  conda activate openmmlab
  239  conda install pytorch==1.13.1 torchvision==0.14.1 torchaudio==0.13.1 pytorch-cuda=11.7 -c pytorch -c nvidia -y
  240  pip install -U openmim
  241  mim install mmcv-full
  242  mim install mmdet\<3.0.0
  243  pip install mmrotate
  244  mim download mmrotate --config oriented_rcnn_r50_fpn_1x_dota_le90 --dest .
  245  python demo/image_demo.py demo/demo.jpg oriented_rcnn_r50_fpn_1x_dota_le90.py oriented_rcnn_r50_fpn_1x_dota_le90-6d2b2ce0.pth --out-file result.jpg
  246  cd mmrotate
  247  ls
  248  pip uninstall mmrotate
  249  git clone https://github.com/open-mmlab/mmrotate.git
  250  cd mmrotate
  251  pip install -v -e .
  252  ls
  253  cd ..
  254  ls
  255  mv oriented_rcnn_r50_fpn_1x_dota_le90 ./mmrotate/
  256  mv oriented_rcnn_r50_fpn_1x_dota_le90.pth ./mmrotate/
  257  ls
  258  mv oriented_rcnn_r50_fpn_1x_dota_le90.py mmrotate/
  259  mv oriented_rcnn_r50_fpn_1x_dota_le90-6d2b2ce0.pth mmrotate/
  260  ls
  261  ls -al
  262  cd mmrotate
  263  python demo/image_demo.py demo/demo.jpg oriented_rcnn_r50_fpn_1x_dota_le90.py oriented_rcnn_r50_fpn_1x_dota_le90-6d2b2ce0.pth --out-file result.jpg
  264  \ldconfig -p | grep cuda
  265  whereis
  266  whereis libcudnn_cnn_infer.so.8.
  267  whereis libcudnn_cnn_infer
  268  python demo/image_demo.py demo/demo.jpg oriented_rcnn_r50_fpn_1x_dota_le90.py oriented_rcnn_r50_fpn_1x_dota_le90-6d2b2ce0.pth --out-file result.jpg
  269  env
  270  env | grep LD_
  271  whereis libcuda
  272  whereis libcuda.so
  273  LD_LIBRARY_PATH=/usr/lib/wsl/lib/
  274  export LD_LIBRARY_PATH
  275  env | grep LD_
  276  python demo/image_demo.py demo/demo.jpg oriented_rcnn_r50_fpn_1x_dota_le90.py oriented_rcnn_r50_fpn_1x_dota_le90-6d2b2ce0.pth --out-file result.jpg
  277  history 30
  278  history 50