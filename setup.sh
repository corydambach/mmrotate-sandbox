#!/bin/bash
set -e

conda deactivate 2>/dev/null || true

#conda remove --name openmmlab-clean --all -y
#conda create --name openmmlab-clean python=3.11 -y 
conda activate openmmlab-clean

conda install pytorch==2.0.1 torchvision==0.15.2 torchaudio==2.0.2 pytorch-cuda=11.8 -c pytorch -c nvidia -y
#pytorch                   2.0.1           py3.8_cuda11.8_cudnn8.7.0_0    pytorch
#torchvision               0.15.2               py38_cu118    pytorch
#torchaudio                2.0.2                py38_cu118    pytorch
#pytorch-cuda              11.8                 h7e8668a_6    pytorch

#more libs we need
#rtree                     1.2.0                    pypi_0    pypi

pip install -U openmim
mim install mmcv-full
mim install "mmdet<3.0.0"
pip install mmrotate

#alternative way to install things
#pip install mmcv-full==1.7.2 -f https://download.openmmlab.com/mmcv/dist/cu118/torch2.0.0/index.html
#pip install -U openmim
#pip install mmdet
#pip install mmrotate

#install scikit-learn
conda install scikit-learn -y
conda install rtree        -y
pip install "numpy<2"
pip install pyzmq
pip install shapely