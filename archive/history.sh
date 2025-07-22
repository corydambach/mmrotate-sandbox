    1  wsl -l
    2  exit
    3  which
    4  exit
    5  nvidia
    6  wall
    7  watch
    8  sudo apt-key del 7fa2af80
    9  python
   10  ls
   11  cd proj
   12  cd 
   13  ls
   14  cd proj
   15  cd 
   16  cd proj
   17  ls
   18  cd pytorch-test/
   19  ls
   20  rm -rf venv
   21  sudo rm -rf venv
   22  ls
   23  ls -al
   24  man pytorch
   25  man python
   26  python
   27  lsb_release -a
   28  sudo vim /etc/inputrc
   29  exit
   30  sudo apt-update
   31  sudo apt update
   32  mkdir -p ~/miniconda3
   33  wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
   34  bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
   35  rm -rf ~/miniconda3/miniconda.sh
   36  conda env list
   37  logout
   38  env
   39  env | grep conda
   40  env | grep anaconda
   41  ~/miniconda3/bin/conda init bash
   42  ~/miniconda3/bin/conda init zsh
   43  ls -al
   44  rm -rf .zshrc 
   45  logout
   46  conda env create --name pytorch-test python=3.10
   47  conda create --name pytorch-test python=3.10
   48  conda activate pytorch-test
   49  conda install pytorch torchvision torchaudio pytorch-cuda=11.8 -c pytorch -c nvidia
   50  python 
   51  env
   52  env | grep cuda
   53  conda deactive pytorch-test
   54  conda deactivate pytorch-test
   55  conda deactivate
   56  conda remove --name mmcv --all -y
   57  conda remove --name pytorch-test --all -y
   58  cd proj
   59  mkdir arc
   60  ls
   61  whoami
   62  ls
   63  ls -al
   64  sudo su
   65  ls
   66  cd ..
   67  ls
   68  ls -al
   69  mkdir proj
   70  cd proj
   71  mkdir arc
   72  cd arc
   73  vim install.sh
   74  vim install.sh 
   75  chmod +x install.sh 
   76  ls
   77  ./install.sh 
   78  curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg   && curl -s -L https://nvidia.github.io/libnvidia-container/stable/deb/nvidia-container-toolkit.list |     sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' | \
   79  sudo su
   80  exit
   81  top
   82  who
   83  whoami
   84  exit
   85  ps
   86  ps -al
   87  kill -9 74787
   88  exit
   89  cd proj
   90  cd arc
   91  cd ARC
   92  ls
   93  nvidia-docker
   94  sudo nvidia-ctk runtime configure --runtime=docker
   95  sudo systemctl restart docker
   96  sudo rm /etc/docker/daemon.json 
   97  docker
   98  sudo nvidia-ctk runtime configure --runtime=docker
   99  sudo systemctl restart docker
  100  docker
  101  sudo apt-get update
  102  sudo apt-get install ca-certificates curl
  103  sudo install -m 0755 -d /etc/apt/keyrings
  104  sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
  105  sudo chmod a+r /etc/apt/keyrings/docker.asc
  106  echo   "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  107    $(. /etc/os-release && echo "$VERSION_CODENAME") stable" |   sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  108  sudo apt-get update
  109  sudo docker run hello-world
  110  docker list
  111  docker container ls
  112  docker ls
  113  sudo nvidia-ctk runtime configure --runtime=docker
  114  vim  /etc/docker/daemon.json
  115  sudo systemctl restart docker
  116  ls
  117  cd docker/
  118  nvidia-docker build Dockerfile 
  119  nvidia-docker
  120  nvcc
  121  docker build
  122  docker build Dockerfile
  123  sudo apt-key del 7fa2af80
  124  wget https://developer.download.nvidia.com/compute/cuda/repos/wsl-ubuntu/x86_64/cuda-wsl-ubuntu.pin
  125  sudo mv cuda-wsl-ubuntu.pin /etc/apt/preferences.d/cuda-repository-pin-600
  126  wget https://developer.download.nvidia.com/compute/cuda/12.4.0/local_installers/cuda-repo-wsl-ubuntu-12-4-local_12.4.0-1_amd64.deb
  127  sudo dpkg -i cuda-repo-wsl-ubuntu-12-4-local_12.4.0-1_amd64.deb
  128  sudo cp /var/cuda-repo-wsl-ubuntu-12-4-local/cuda-*-keyring.gpg /usr/share/keyrings/
  129  sudo apt-get update
  130  sudo apt-get -y install cuda-toolkit-12-4
  131  history 1000
  132  history 1000 > ~/distro-setup.txt
  133  cat ~/distro-setup.txt 
  134  nvidia-docker
  135  sudo docker run --rm --runtime=nvidia --gpus all ubuntu nvidia-smi
  136  docker build Dockerfile
  137  ls
  138  docker build .
  139  ls -al
  140  cd ..
  141  ls
  142  conda env list
  143  conda remove --name arc --all -y
  144  ls -al
  145  cd docker
  146  ls
  147  docker build Dockerfile
  148  docker build ./Dockerfile
  149  docker build ./
  150  sudo apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/3bf863cc.pub
  151  docker build ./
  152  sudo apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/3bf863cc.pub
  153  docker build ./
  154  sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/7fa2af80.pub
  155  docker build ./
  156  sudo apt-key list
  157  apt-get update
  158  sudo apt-get update
  159  docker build ./
  160  nano
  161  nano Dockerfile 
  162  nano
  163  docker build ./
  164  ls -al
  165  ls -h
  166  df -H
  167  du -
  168  docker build ./ --no-cache
  169  explorer .
  170  nano Dockerfile 
  171  docker build ./ --no-cache
  172  touch Dockerfile 
  173  nano Dockerfile 
  174  docker build ./ --no-cache
  175  nano Dockerfile 
  176  docker build ./ --no-cache
  177  sudo apt-key del 7fa2af80
  178  wget https://developer.download.nvidia.com/compute/cuda/repos/$distro/$arch/cuda-keyring_1.0-1_all.deb
  179  curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg   && curl -s -L https://nvidia.github.io/libnvidia-container/stable/deb/nvidia-container-toolkit.list |     sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' |     sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list
  180  sed -i -e '/experimental/ s/^#//g' /etc/apt/sources.list.d/nvidia-container-toolkit.list
  181  sudo sed -i -e '/experimental/ s/^#//g' /etc/apt/sources.list.d/nvidia-container-toolkit.list
  182  sudo apt-key del 7fa2af80
  183  history
  184  history > ~/debugging-cmd-history.txt
  185  history 1000 > ~/debugging-cmd-history.txt
  186  history
  187  ls -al
  188  docker build
  189  docker build .
  190  conda
  191  conda create --name openmmlab python=3.8 -y
  192  conda activate openmmlab
  193  conda install pytorch==1.8.0 torchvision==0.9.0 cudatoolkit=10.2 -c pytorch
  194  pip install -U openmim
  195  mim install mmcv-full
  196  mim install mmdet\<3.0.0
  197  git clone https://github.com/open-mmlab/mmrotate.git
  198  cd mmrotate
  199  pip install -v -e .
  200  cd ..
  201  ls -al
  202  cd ..
  203  cd docker
  204  mv mmrotate/ ~/proj/mmrotate
  205  cd ~/proj/mmrotate
  206  ls
  207  ls -al
  208  mim download mmrotate --config oriented_rcnn_r50_fpn_1x_dota_le90 --dest .
  209  cd ..
  210  mim download mmrotate --config oriented_rcnn_r50_fpn_1x_dota_le90 --dest .
  211  pip list
  212  ls -al
  213  conda list
  214  mv mmrotate/ ./arc/ARC/docker/mmrotate
  215  conda list
  216  mim download mmrotate --config oriented_rcnn_r50_fpn_1x_dota_le90 --dest .
  217  python demo/image_demo.py demo/demo.jpg oriented_rcnn_r50_fpn_1x_dota_le90.py oriented_rcnn_r50_fpn_1x_dota_le90-6d2b2ce0.pth --out-file result.jpg
  218  cd arc/ARC/docker
  219  ls
  220  cd mmrotate
  221  python demo/image_demo.py demo/demo.jpg oriented_rcnn_r50_fpn_1x_dota_le90.py oriented_rcnn_r50_fpn_1x_dota_le90-6d2b2ce0.pth --out-file result.jpg
  222  ls -al
  223  clear
  224  conda install pytorch==1.13.1 torchvision==0.14.1 torchaudio==0.13.1 pytorch-cuda=11.7 -c pytorch -c nvidia -y
  225  python demo/image_demo.py demo/demo.jpg oriented_rcnn_r50_fpn_1x_dota_le90.py oriented_rcnn_r50_fpn_1x_dota_le90-6d2b2ce0.pth --out-file result.jpg
  226  pip install -U openmim
  227  mim install mmcv-full
  228  mim install mmdet\<3.0.0pip install -U openmim
  229  mim install mmcv-full
  230  mim install mmdet\<3.0.0
  231  pip uninstall openmim
  232  pip install -U openmim
  233  mim install mmcv-full
  234  cd ..
  235  rm -rf mmrotate
  236  cd ~
  237  cd proj
  238  ls
  239  mkdir mmrotate
  240  cd mmrotate
  241  conda deactivate
  242  sudo apt-get bash-completion
  243  sudo apt-get install bash-completion
  244  conda remove --name openmmlab --all -y
  245  conda create --name openmmlab python=3.8 -y
  246  conda activate openmmlab
  247  conda install pytorch==1.13.1 torchvision==0.14.1 torchaudio==0.13.1 pytorch-cuda=11.7 -c pytorch -c nvidia -y
  248  pip install -U openmim
  249  mim install mmcv-full
  250  mim install mmdet\<3.0.0
  251  pip install mmrotate
  252  mim download mmrotate --config oriented_rcnn_r50_fpn_1x_dota_le90 --dest .
  253  python demo/image_demo.py demo/demo.jpg oriented_rcnn_r50_fpn_1x_dota_le90.py oriented_rcnn_r50_fpn_1x_dota_le90-6d2b2ce0.pth --out-file result.jpg
  254  cd mmrotate
  255  ls
  256  pip uninstall mmrotate
  257  git clone https://github.com/open-mmlab/mmrotate.git
  258  cd mmrotate
  259  pip install -v -e .
  260  ls
  261  cd ..
  262  ls
  263  mv oriented_rcnn_r50_fpn_1x_dota_le90 ./mmrotate/
  264  mv oriented_rcnn_r50_fpn_1x_dota_le90.pth ./mmrotate/
  265  ls
  266  mv oriented_rcnn_r50_fpn_1x_dota_le90.py mmrotate/
  267  mv oriented_rcnn_r50_fpn_1x_dota_le90-6d2b2ce0.pth mmrotate/
  268  ls
  269  ls -al
  270  cd mmrotate
  271  python demo/image_demo.py demo/demo.jpg oriented_rcnn_r50_fpn_1x_dota_le90.py oriented_rcnn_r50_fpn_1x_dota_le90-6d2b2ce0.pth --out-file result.jpg
  272  \ldconfig -p | grep cuda
  273  whereis
  274  whereis libcudnn_cnn_infer.so.8.
  275  whereis libcudnn_cnn_infer
  276  python demo/image_demo.py demo/demo.jpg oriented_rcnn_r50_fpn_1x_dota_le90.py oriented_rcnn_r50_fpn_1x_dota_le90-6d2b2ce0.pth --out-file result.jpg
  277  env
  278  env | grep LD_
  279  whereis libcuda
  280  whereis libcuda.so
  281  LD_LIBRARY_PATH=/usr/lib/wsl/lib/
  282  export LD_LIBRARY_PATH
  283  env | grep LD_
  284  python demo/image_demo.py demo/demo.jpg oriented_rcnn_r50_fpn_1x_dota_le90.py oriented_rcnn_r50_fpn_1x_dota_le90-6d2b2ce0.pth --out-file result.jpg
  285  history 30
  286  history 50
  287  python demo/huge_image_demo.py demo/SkyFi_SuperHigh_Texas_USA_2023-07-14_0829.png.jpg oriented_rcnn_r50_fpn_1x_dota_le90.py oriented_rcnn_r50_fpn_1x_dota_le90-6d2b2ce0.pth --out-file result.jpg
  288  python demo/huge_image_demo.py demo/SkyFi_SuperHigh_Texas_USA_2023-07-14_0829.png.jpg oriented_rcnn_r50_fpn_1x_dota_le90.py oriented_rcnn_r50_fpn_1x_dota_le90-6d2b2ce0.pth
  289  python demo/huge_image_demo.py demo/SkyFi_SuperHigh_Texas_USA_2023-07-14_0829.png oriented_rcnn_r50_fpn_1x_dota_le90.py oriented_rcnn_r50_fpn_1x_dota_le90-6d2b2ce0.pth
  290  python demo/huge_image_demo.py demo/SkyFi_SuperHigh_Texas_USA_2023-07-14_0829.png oriented_rcnn_r50_fpn_1x_dota_le90.py oriented_rcnn_r50_fpn_1x_dota_le90-6d2b2ce0.pth --score-thr=0.2
  291  nano ~/.bashrc
  292  clear
  293  ls -al
  294  ls
  295  ls -g
  296  ls -G
  297  ls
  298  python demo/huge_image_demo.py demo/SkyFi_SuperHigh_Texas_USA_2023-07-14_0829.png oriented_reppoints_r50_fpn_40e_dota_ms_le135.py oriented_reppoints_r50_fpn_40e_dota_ms_le135-bb0323fd.pth --score-thr=0.2
  299  ls -al
  300  python demo/huge_image_demo.py demo/SkyFi_SuperHigh_Texas_USA_2023-07-14_0829.png oriented_reppoints_r50_fpn_40e_dota_ms_le135.py oriented_reppoints_r50_fpn_40e_dota_ms_le135-bb0323fd.pth --score-thr=0.2
  301  python demo/huge_image_demo.py demo/SkyFi_SuperHigh_Texas_USA_2023-07-14_0829.png redet_re50_refpn_1x_dota_ms_rr_le90.py redet_re50_fpn_1x_dota_ms_rr_le90-fc9217b5.pth 
  302  ls redet_re50_refpn_1x_dota_le90.py
  303  ls redet_re50_refpn_1x_dota_le90
  304  ls redet_re50_refpn_1x_dota
  305  ls redet_re50_refpn_1
  306  python demo/huge_image_demo.py demo/SkyFi_SuperHigh_Texas_USA_2023-07-14_0829.png redet_re50_refpn_1x_dota_ms_rr_le90.py redet_re50_fpn_1x_dota_ms_rr_le90-fc9217b5.pth 
  307  python demo/image_demo.py demo/SkyFi_SuperHigh_Texas_USA_2023-07-14_0829.png redet_re50_refpn_1x_dota_ms_rr_le90.py redet_re50_fpn_1x_dota_ms_rr_le90-fc9217b5.pth 
  308  python demo/image_demo.py demo/SkyFi_SuperHigh_Texas_USA_2023-07-14_0829.png oriented_rcnn_r50_fpn_1x_dota_le90.py oriented_rcnn_r50_fpn_1x_dota_le90-6d2b2ce0.pth --score-thr=0.2
  309  python demo/huge_image_demo.py demo/SkyFi_SuperHigh_Texas_USA_2023-07-14_0829.png redet_re50_refpn_1x_dota_ms_rr_le90.py redet_re50_fpn_1x_dota_ms_rr_le90-fc9217b5.pth --patch_sizes=640 --patch_steps=480
  310  python demo/huge_image_demo.py demo/skyfi-superhigh-texas.png     redet_re50_refpn_1x_dota_le90.py     redet_re50_refpn_1x_dota_ms_rr_le90.py     --patch_sizes=640 --patch_steps=480
  311  clear
  312  python demo/huge_image_demo.py demo/skyfi-superhigh-texas.png     oriented_rcnn_r50_fpn_1x_dota_le90.py     oriented_rcnn_r50_fpn_1x_dota_le90-6d2b2ce0.pth     --patch_sizes=640 --patch_steps=480    
  313  python demo/huge_image_demo.py demo/skyfi-superhigh-texas.png     redet_re50_refpn_1x_dota_ms_rr_le90.py     redet_re50_fpn_1x_dota_ms_rr_le90-fc9217b5.pth --patch_sizes=640 --patch_steps=480
  314  cd ..
  315  ls
  316  cd mmrotate
  317  ls -al
  318  cd configs
  319  cd redet/
  320  ls
  321  python demo/huge_image_demo.py demo/skyfi-superhigh-texas.png     redet_re50_refpn_1x_dota_ms_rr_le90.py     redet_re50_fpn_1x_dota_ms_rr_le90-fc9217b5.pth --patch_sizes=640 --patch_steps=480
  322  python ../demo/huge_image_demo.py demo/skyfi-superhigh-texas.png     redet_re50_refpn_1x_dota_ms_rr_le90.py     redet_re50_fpn_1x_dota_ms_rr_le90-fc9217b5.pth --patch_sizes=640 --patch_steps=480
  323  python ../../demo/huge_image_demo.py demo/skyfi-superhigh-texas.png     redet_re50_refpn_1x_dota_ms_rr_le90.py     redet_re50_fpn_1x_dota_ms_rr_le90-fc9217b5.pth --patch_sizes=640 --patch_steps=480
  324  python ../../demo/huge_image_demo.py ../../demo/skyfi-superhigh-texas.png     redet_re50_refpn_1x_dota_ms_rr_le90.py     redet_re50_fpn_1x_dota_ms_rr_le90-fc9217b5.pth --patch_sizes=640 --patch_steps=480
  325  python ../../demo/huge_image_demo.py ../../demo/skyfi-superhigh-texas.png     redet_re50_refpn_1x_dota_ms_rr_le90.py     redet_re50_fpn_1x_dota_ms_rr_le90-fc9217b5.pth --patch_sizes=640 --patch_steps=480python ../../demo/huge_image_demo.py ../../demo/skyfi-superhigh-texas.png     redet_re50_refpn_1x_dota_ms_rr_le90.py \
  326  python ../../demo/huge_image_demo.py ../../demo/skyfi-superhigh-texas.png     redet_re50_refpn_1x_dota_ms_rr_le90.py     redet_re50_fpn_1x_dota_ms_rr_le90-fc9217b5.pth \    
  327  python ../../demo/huge_image_demo.py ../../demo/skyfi-superhigh-texas.png     redet_re50_refpn_1x_dota_ms_rr_le90.py     redet_re50_fpn_1x_dota_ms_rr_le90-fc9217b5.pth
  328  python ../../demo/huge_image_demo.py ../../demo/skyfi-superhigh-texas.png     redet_re50_refpn_1x_dota_ms_rr_le90.py     redet_re50_fpn_1x_dota_ms_rr_le90-fc9217b5.pth --out-file=out.jpg
  329  ls
  330  git co .
  331  git checkout .
  332  git st
  333  python ../../demo/huge_image_demo.py ../../demo/skyfi-superhigh-texas.png     redet_re50_refpn_1x_dota_ms_rr_le90.py     redet_re50_fpn_1x_dota_ms_rr_le90-fc9217b5.pth --out-file=out.jpg
  334  python ../../demo/huge_image_demo.py ../../demo/skyfi-superhigh-texas.png     redet_re50_refpn_1x_dota_ms_rr_le90.py     redet_re50_fpn_1x_dota_ms_rr_le90-fc9217b5.pth --out-file=out.jpg --score-thr=0.15
  335  cd ..
  336  cd mmrotate/
  337  ls
  338  mv mmrotate ../
  339  mv mmrotate ../a
  340  cd ..
  341  ls
  342  cd mmrotate
  343  ls
  344  mv cory-install.sh ../a
  345  ls
  346  cd ..
  347  rm -rf mmrotate/
  348  ls
  349  mv a mmrotate
  350  cd mmrotate
  351  ls
  352  ls -al
  353  cd ..
  354  ls
  355  /bin/python3 /home/cory/.vscode-server/extensions/ms-python.python-2024.2.1/pythonFiles/printEnvVariablesToFile.py /home/cory/.vscode-server/extensions/ms-python.python-2024.2.1/pythonFiles/deactivate/bash/envVars.txt
  356  env
  357  cd proj
  358  cd mmrotate
  359  pip list
  360  pip uninstall mmrotate
  361  cd mmrotate
  362  conda activate openmmlab
  363  pip setup.py develop -u
  364  pip ./setup.py develop -u
  365  ls
  366  cd ..
  367  ls
  368  cd mmrotate 
  369  pip install -v -e .
  370  cd ..
  371  ls
  372  pip ./setup.py develop -u
  373  pip setup.py develop -u
  374  ls
  375  pip install -v -e .
  376  env
  377  cat ~/.bashrc
  378  env
  379  ls
  380  conda deactivate
  381  cd ..
  382  conda create -n spatial-mmlab
  383  conda create -n spatial-mmlab python=3.8 -y
  384  conda activate spatial-mmlab
  385  conda install pytorch==1.13.1 torchvision==0.14.1 torchaudio==0.13.1 pytorch-cuda=11.7 -c pytorch -c nvidia -y
  386  pip install openmim
  387  mim install mmcv-full==1.6.1
  388  pip install -U openmim
  389  mim install mmcv-full==1.6.1
  390  conda install pytorch=1.7.0 torchvision torchaudio cudatoolkit=10.2 -c pytorch
  391  pip install openmim
  392  mim install mmcv-full==1.6.1
  393  mim install mmdet==2.25.1
  394  git clone https://github.com/open-mmlab/mmrotate.git
  395  mkdir spatial
  396  cd spatial/
  397  ls
  398  cd ..
  399  ls
  400  cd spatial
  401  git clone https://github.com/open-mmlab/mmrotate.git
  402  cd mmrotate/
  403  pip install -r requirements/build.txt
  404  pip install -v -e .
  405  cd ../
  406  git clone https://github.com/yuhongtian17/Spatial-Transform-Decoupling.git
  407  cp -r Spatial-Transform-Decoupling/mmrotate-main/* mmrotate/
  408  exit
  409  cd ..
  410  cd cory
  411  cd proj
  412  ls
  413  exit
  414  cd proj
  415  cd mkdir watermark
  416  cd watermar
  417  cd watermark
  418  ls
  419  mkdir watermark
  420  cd watermark/
  421  ls
  422  git clone https://github.com/bg1szd/watermark-removal
  423  cd watermark-removal/
  424  ls
  425  conda create --name watermark-removal python=3.7
  426  conda remove --name watermark-removal
  427  conda remove --name watermark-removal --all
  428  exit
  429  python /home/cory/.vscode-server/extensions/ms-python.python-2024.4.0/python_files/printEnvVariablesToFile.py /home/cory/.vscode-server/extensions/ms-python.python-2024.4.0/python_files/deactivate/bash/envVars.txt
  430  python /home/cory/.vscode-server/extensions/ms-python.python-2024.4.1/python_files/printEnvVariablesToFile.py /home/cory/.vscode-server/extensions/ms-python.python-2024.4.1/python_files/deactivate/bash/envVars.txt
  431  clear
  432  conda env list
  433  exit
  434  /bin/python3 /home/cory/.vscode-server/extensions/ms-python.python-2024.4.1/python_files/printEnvVariablesToFile.py /home/cory/.vscode-server/extensions/ms-python.python-2024.4.1/python_files/deactivate/bash/envVars.txt
  435  pip install jupyter
  436  history
  437  conda activate base
  438  conda list
  439  conda activate openmmlab
  440  conda list
  441  pip install ipywidgets
  442  pip uninstall ipywidgets
  443  conda install -c conda-forge ipywidgets
  444  /bin/python3 /home/cory/.vscode-server/extensions/ms-python.python-2024.4.1/python_files/printEnvVariablesToFile.py /home/cory/.vscode-server/extensions/ms-python.python-2024.4.1/python_files/deactivate/bash/envVars.txt
  445  exit
  446  cd Proj
  447  cd proj
  448  cd mmrotate/
  449  conda activate openmmlab
  450  conda list
  451  git st
  452  git status
  453  git checkout configs/redet/redet_re50_refpn_1x_dota_le90.py
  454  cd ..
  455  git clone https://github.com/THUDM/CogVLM/
  456  cd Cog
  457  cd CogVLM/
  458  ls
  459  cd ..
  460  mv CogVLM/ cogvlm
  461  ls
  462  cd cogvlm
  463  ls
  464  ls -al
  465  conda create --name cog-vlm
  466  python
  467  conda create --name cog-vlm python=3.10
  468  conda activate cog-vlm
  469  ls
  470  conda deactivate
  471  conda activate cog-vlm
  472  conda install pytorch torchvision torchaudio pytorch-cuda=11.8 -c pytorch -c nvidia
  473  ls -al
  474  ls
  475  pip install -r requirements.txt
  476  python -m spacy download en_core_web_sm
  477  python cli_demo_sat.py --from_pretrained cogagent-vqa --version chat_old --bf16  --stream_chat
  478  ls
  479  cd basic_demo/
  480  ls
  481  python cli_demo_sat.py --from_pretrained cogagent-vqa --version chat_old --bf16  --stream_chat
  482  python web_demo.py --from_pretrained cogagent-vqa --version chat_old --bf16
  483  pip install gradio
  484  python web_demo.py --from_pretrained cogagent-vqa --version chat_old --quant4
  485  python web_demo.py --from_pretrained cogagent-vqa --version chat_old --quant 4
  486  python web_demo.py --from_pretrained cogagent-vqa --version chat_old --bf16
  487  pip install bitsandbytes
  488  python web_demo.py --from_pretrained cogagent-vqa --version chat_old --bf16
  489  sudo apt-get install libaio-dev
  490  python web_demo.py --from_pretrained cogagent-vqa --version chat_old --bf16
  491  conda install pytorch==2.0.0 torchvision==0.15.0 torchaudio==2.0.0 -c pytorch
  492  conda install pytorch==2.0.0 torchvision==0.15.0 torchaudio==2.0.0 pytorch-cuda=11.8 -c pytorch -c nvidia
  493  cd ..
  494  explorer .
  495  open .
  496  conda install pytorch==2.0.0 torchvision==0.15.0 torchaudio==2.0.0 pytorch-cuda=11.8 -c pytorch -c nvidia
  497  python web_demo.py --from_pretrained cogagent-vqa --version chat_old --bf16
  498  ls
  499  cd basic_demo/
  500  python web_demo.py --from_pretrained cogagent-vqa --version chat_old --bf16
  501  conda deactivate
  502  conda remove --name cog-vlm --all -y
  503  history
  504  conda create --name cog-vlm python=3.10
  505  conda activate cog-vlm
  506  ls
  507  conda install pytorch==2.0.0 torchvision==0.15.0 torchaudio==2.0.0 pytorch-cuda=11.8 -c pytorch -c nvidiaconda install pytorch==1.13.1 torchvision==0.14.1 torchaudio==0.13.1 pytorch-cuda=11.7 -c pytorch -c nvidia
  508  conda install pytorch==1.13.1 torchvision==0.14.1 torchaudio==0.13.1 pytorch-cuda=11.7 -c pytorch -c nvidia
  509  python web_demo.py --from_pretrained cogagent-vqa --version chat_old --bf16
  510  pip install gradio
  511  python web_demo.py --from_pretrained cogagent-vqa --version chat_old --bf16
  512  cd ..
  513  pip install -r requirements.txt
  514  conda install pytorch==1.13.0 torchvision==0.14.0 torchaudio==0.13.0 pytorch-cuda=11.7 -c pytorch -c nvidia
  515  python -m spacy download en_core_web_sm
  516  python web_demo.py --from_pretrained cogagent-vqa --version chat_old --bf16
  517  cd basic_demo/
  518  python web_demo.py --from_pretrained cogagent-vqa --version chat_old --bf16
  519  pip install gradio
  520  pip install bitsandbytes
  521  python web_demo.py --from_pretrained cogagent-vqa --version chat_old --bf16
  522  cat ../requirements.txt 
  523  pip install -r requirements.txt
  524  cd ..
  525  pip install -r requirements.txt
  526  python web_demo.py --from_pretrained cogagent-vqa --version chat_old --bf16
  527  cd basic_demo/
  528  python web_demo.py --from_pretrained cogagent-vqa --version chat_old --bf16
  529  python web_demo.py --from_pretrained cogagent-vqa --version chat_old --bf16 --quant 4
  530  python web_demo.py --from_pretrained cogagent-vqa --version chat_old --quant 4
  531  python cli_demo_sat.py --from_pretrained cogagent-vqa --version chat_old --bf16  --stream_chat
  532  python cli_demo_sat.py --from_pretrained cogagent-vqa --version chat_old --fp16  --stream_chat
  533  python cli_demo_sat.py --from_pretrained cogagent-vqa --version chat_old --quant 8  --stream_chat
  534  pip install triton==1.0.0
  535  pip install triton==1
  536  pip install triton==1.0
  537  git clone https://github.com/NVIDIA/apex
  538  rm -rf apex/
  539  cd ..
  540  git clone https://github.com/NVIDIA/apex
  541  cd apex/
  542  pip install -v --disable-pip-version-check --no-build-isolation --no-cache-dir ./
  543  cd ..
  544  cd basic_demo/
  545  ls -al
  546  python cli_demo_sat.py --from_pretrained cogagent-vqa --version chat_old --quant 8 --stream_chat
  547  python cli_demo_sat.py --from_pretrained cogagent-vqa --version chat_old --quant 4 --stream_chat
  548  nvcc
  549  exit
  550  cd proj
  551  cd cogvlm/
  552  ls
  553  ls -al
  554  mkdir jaykuma
  555  cd jaykuma/
  556  ls
  557  ls -al
  558  ls
  559  find "$(pwd)" -name
  560  find "$(pwd)" -name .
  561  find "$(pwd)" -name *
  562  find "$(pwd)"
  563  ls 
  564  cd ..
  565  ls
  566  ls -al
  567  df
  568  df -uH
  569  du -H
  570  du -Hg
  571  du -HG
  572  du -uH
  573  du -fH
  574  du -H
  575  du -Hm
  576  du -Ht
  577  du -Hs
  578  du -Hu
  579  du
  580  df
  581  df -h
  582  df -h ./
  583  du -hd
  584  du -Hd
  585  du -H
  586  du -tH
  587  man du
  588  du -dH
  589  du -d1 H
  590  du -d1 -H
  591  man du
  592  du -H
  593  du -Hd1
  594  man du
  595  du -hd1
  596  ls
  597  ls -al
  598  cd ..
  599  ls
  600  rm -rf cogvlm/
  601  ls -al
  602  conda deactivate
  603  mkdir cog-vlm
  604  git clone https://github.com/THUDM/CogVLM cog-vlm
  605  cd cog-vlm/
  606  ls
  607  ls -al
  608  python --version
  609  conda activate
  610  conda env list
  611  conda remove --name cog-vlm --all y
  612  conda create --name cog python=3
  613  conda activate cog
  614  bash
  615  ls
  616  pip install -r requirements.txt
  617  pip3 install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118
  618  pip install -r requirements.txt
  619  pip uninstall -r requirements.txt
  620  pip install -r requirements.txt
  621  pip3 install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118
  622  pip install -r requirements.txt
  623  cond
  624  cd ..
  625  ls
  626  cd cog-vlm/
  627  conda deactivate
  628  conda remove --name cog --all
  629  conda create --name cog python=3.10
  630  conda activate cog
  631  pip3 install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118
  632  pip install -r requirements.txt
  633  pip install -r requirements.txtpython -m spacy download en_core_web_sm
  634  python -m spacy download en_core_web_sm
  635  cd basic_demo/
  636  python cli_demo_sat.py --from_pretrained cogagent-vqa --version chat_old --bf16  --stream_chat
  637  pip install bitsandbytespip install bitsandbytes
  638  pip install bitsandbytes
  639  python cli_demo_sat.py --from_pretrained cogagent-vqa --version chat_old --bf16  --stream_chat
  640  git pull
  641  git st
  642  git status
  643  ls
  644  cd ..
  645  ls
  646  cd cog-vlm
  647  ls
  648  cd ..
  649  ls
  650  cd cog-vlm/
  651  ls
  652  ls -al
  653  conda list
  654  python
  655  ls -al
  656  history 100
  657  python cli_demo_sat.py --from_pretrained cogagent-chat --version chat --bf16  --stream_chat
  658  cd basic_demo/
  659  python cli_demo_sat.py --from_pretrained cogagent-chat --version chat --bf16  --stream_chat
  660  sudo python cli_demo_sat.py --from_pretrained cogagent-chat --version chat --bf16  --stream_chat
  661  python cli_demo_sat.py --from_pretrained cogagent-chat --version chat --bf16  --stream_chat
  662  exit
  663  cd proj
  664  cd cog-vlm/
  665  ls
  666  conda activate cog
  667  ls
  668  ls -al
  669  python --version
  670  python cli_demo_sat.py --from_pretrained cogagent-chat --version chat --bf16  --stream_chat
  671  cd basic_demo/
  672  python cli_demo_sat.py --from_pretrained cogagent-chat --version chat --bf16  --stream_chat
  673  pip install gradio
  674  python cli_demo_sat.py --from_pretrained cogagent-chat --version chat --bf16  --stream_chat
  675  code
  676  git checkout .
  677  git checkout HEAD
  678  git status
  679  git checkout main
  680  git checkout master
  681  git checkout main
  682  git pull
  683  conda update
  684  conda update --all
  685  conda clean
  686  conda clean --help
  687  conda clean -t
  688  pip update filelock
  689  pip upgrade filelock
  690  pip install filelock
  691  pip uninstall filelock
  692  pip install filelock
  693  python cli_demo_sat.py --from_pretrained cogagent-chat --version chat --bf16  --stream_chat
  694  ls -al
  695  clear
  696  python cli_demo_sat.py --from_pretrained cogagent-vqa --version chat_old --bf16  --stream_chat
  697  python web_demo.py --from_pretrained cogagent-vqa --version chat_old --bf16
  698  python web_demo.py --from_pretrained cogagent-vqa --version chat_old --quant 4
  699  python web_demo.py --from_pretrained cogagent-vqa --version chat_old --quant 8
  700  python cli_demo_hf.py --from_pretrained THUDM/cogagent-vqa-hf --bf16
  701  python cli_demo_hf.py --from_pretrained THUDM/cogagent-vqa-hf --bf16 --quant 4
  702  exit
  703  conda activate cog
  704  cd proj
  705  cd cog-vlm/
  706  ls
  707  ls -al
  708  conda list
  709  python cli_demo_hf.py --from_pretrained THUDM/cogagent-vqa-hf --bf16 --quant 4
  710  cd basic_demo/
  711  python cli_demo_hf.py --from_pretrained THUDM/cogagent-vqa-hf --bf16 --quant 4
  712  python web_demo.py --from_pretrained cogagent-vqa --version chat_old --bf16
  713  python web_demo.py --from_pretrained cogagent-vqa-hf --version chat_old --bf16
  714  python web_demo.py --from_pretrained cogagent-vqa-hf --version chat_old --bf16 --quant 8
  715  code
  716  python web_demo.py --from_pretrained THUDM/cogagent-vqa-hf --version chat_old --bf16 --quant 8
  717  python hf_demo.py 
  718  python cli_demo_hf.py --from_pretrained THUDM/cogagent-vqa-hf --bf16 --quant 8
  719  python cli_demo_hf.py --from_pretrained THUDM/cogagent-vqa-hf --bf16 --quant 4
  720  python hf-web-demo.py --from_pretrained cogagent-vqa-hf --version chat_old --bf16 --quant 8
  721  python hf-web-demo.py --from_pretrained cogagent-vqa-hf --version chat_old --bf16 --quant 4
  722  python hf-web-demo.py --from_pretrained cogagent-vqa-hf --bf16 --quant 4
  723  python hf-web-demo.py --from_pretrained THUDM/cogagent-vqa-hf --bf16 --quant 4
  724  du
  725  df -h
  726  ls
  727  cd .cache
  728  ls 
  729  rm -rf huggingface/
  730  ls -al
  731  cd ..
  732  ls
  733  rm -rf .cache/
  734  ls -al
  735  cd proj
  736  cd cog-vlm/
  737  ls
  738  ls -al
  739  mkdir imgs
  740  cd imgs
  741  find
  742  find /
  743  history 1000 | grep find
  744  find "$(pwd)"
  745  git checkout web_demo.py
  746  git checkout ../basic_demo/web_demo.py
  747  cd /
  748  cd mnt
  749  ls
  750  cd d
  751  cd Proj
  752  ls
  753  cd train
  754  cd pose
  755  ls
  756  cd classifiers/
  757  cd pose
  758  ls
  759  cd pose-11
  760  ls
  761  /bin/python3 /home/cory/.vscode-server/extensions/ms-python.python-2024.4.1/python_files/printEnvVariablesToFile.py /home/cory/.vscode-server/extensions/ms-python.python-2024.4.1/python_files/deactivate/bash/envVars.txt
  762  conda activate cog
  763  pip install jupyter
  764  /bin/python3 /home/cory/.vscode-server/extensions/ms-python.python-2024.4.1/python_files/printEnvVariablesToFile.py /home/cory/.vscode-server/extensions/ms-python.python-2024.4.1/python_files/deactivate/bash/envVars.txt
  765  conda activate cog
  766  pip install ipywidgets widgetsnbextension pandas-profiling
  767  cd proj
  768  cd cog-vlm/
  769  ls -al
  770  cd basic_demo/
  771  ls
  772  ls -al
  773  sudo chown cory hf-demo-cogvlm.ipynb 
  774  ls
  775  ls -al
  776  exit
  777  /bin/python3 /home/cory/.vscode-server/extensions/ms-python.python-2024.4.1/python_files/printEnvVariablesToFile.py /home/cory/.vscode-server/extensions/ms-python.python-2024.4.1/python_files/deactivate/bash/envVars.txt
  778  git st
  779  git status
  780  git checkout cli_demo_hf.py
  781  git status
  782  git diffdir
  783  git diff
  784  cls
  785  clear
  786  /bin/python3 /home/cory/.vscode-server/extensions/ms-python.python-2024.4.1/python_files/printEnvVariablesToFile.py /home/cory/.vscode-server/extensions/ms-python.python-2024.4.1/python_files/deactivate/bash/envVars.txt
  787  python /home/cory/.vscode-server/extensions/ms-python.python-2024.4.1/python_files/printEnvVariablesToFile.py /home/cory/.vscode-server/extensions/ms-python.python-2024.4.1/python_files/deactivate/bash/envVars.txt
  788  cd proj
  789  git clone https://github.com/rickwierenga/CS229-Python/
  790  cd CS229-Python/
  791  python --version
  792  conda create --name cs229 python=3.12.1
  793  conda activate cs229
  794  pip install -r requirements.txt 
  795  pip install --upgrade pip
  796  pip install -r requirements.txt 
  797  pip install pkg-config
  798  exit
  799  /bin/python3 /home/cory/.vscode-server/extensions/ms-python.python-2024.6.0/python_files/printEnvVariablesToFile.py /home/cory/.vscode-server/extensions/ms-python.python-2024.6.0/python_files/deactivate/bash/envVars.txt
  800  python /home/cory/.vscode-server/extensions/ms-python.python-2024.4.1/python_files/printEnvVariablesToFile.py /home/cory/.vscode-server/extensions/ms-python.python-2024.4.1/python_files/deactivate/bash/envVars.txt
  801  /bin/python3 /home/cory/.vscode-server/extensions/ms-python.python-2024.6.0/python_files/printEnvVariablesToFile.py /home/cory/.vscode-server/extensions/ms-python.python-2024.6.0/python_files/deactivate/bash/envVars.txt
  802  exit
  803  ls
  804  ls -al
  805  cd proj
  806  df -h
  807  du -h
  808  cd cog-vlm/
  809  du -h
  810  /bin/python3 /home/cory/.vscode-server/extensions/ms-python.python-2024.6.0/python_files/printEnvVariablesToFile.py /home/cory/.vscode-server/extensions/ms-python.python-2024.6.0/python_files/deactivate/bash/envVars.txt
  811  /bin/python3 /home/cory/.vscode-server/extensions/ms-python.python-2024.8.0/python_files/printEnvVariablesToFile.py /home/cory/.vscode-server/extensions/ms-python.python-2024.8.0/python_files/deactivate/bash/envVars.txt
  812  /bin/python3 /home/cory/.vscode-server/extensions/ms-python.python-2025.6.1-linux-x64/python_files/printEnvVariablesToFile.py /home/cory/.vscode-server/extensions/ms-python.python-2025.6.1-linux-x64/python_files/deactivate/bash/envVars.txt
  813  git st
  814  git status
  815  git add ../..
  816  git st
  817  git status
  818  git reset *.png
  819  git st
  820  git status
  821  git reset **/*.png
  822  git st
  823  git status
  824  git reset ../../demo/skyfi-superhigh-texas.png
  825  git status
  826  git commit -m "saving"
  827  git status
  828  du
  829  df -H
  830  conda activate base
  831  conda deactivate
  832  conda activate base
  833  conda info
  834  conda clean --all
  835  onda 
  836  pip install mmcv==2.0.1 -f https://download.openmmlab.com/mmcv/dist/cu121/torch2.1.0/index.html
  837  ls -la /usr/lib/wsl/lib/libcuda*
  838  nvidia-smi  # Should show RTX 4090 with correct driver version
  839  python
  840  pip uninstall torch torchvision torchaudio
  841  conda install pytorch torchvision torchaudio pytorch-cuda=11.8 -c pytorch -c nvidia
  842  pip uninstall mmcv-full mmcv
  843  mim install mmcv-full
  844  pip install mmcv-full==1.7.2 -f https://download.openmmlab.com/mmcv/dist/cu118/torch2.0.0/index.html
  845  pip uninstall mmcv-full mmcv
  846  pip install mmcv==2.0.1 -f https://download.openmmlab.com/mmcv/dist/cu118/torch2.4.0/index.html
  847  conda install pytorch torchvision torchaudio pytorch-cuda=12.1 -c pytorch -c nvidia
  848  pip install mmcv==2.0.1 -f https://download.openmmlab.com/mmcv/dist/cu121/torch2.1.0/index.html
  849  conda install pytorch=2.0.1 torchvision torchaudio pytorch-cuda=11.8 -c pytorch -c nvidia
  850  pip install mmcv-full==1.7.2 -f https://download.openmmlab.com/mmcv/dist/cu118/torch2.0.0/index.html
  851  git st
  852  git status
  853  git add claude_inference*
  854  git st
  855  git status
  856  git commit "claude experiments"
  857  git commit -m "claude experiments"
  858  git st
  859  git status
  860  git add ../../**/*.py
  861  git add ../../**/*.json
  862  git add ../**/*.json
  863  git status
  864  git commit -m "json files"
  865  git push 
  866  git add ../**/*.npy
  867  git status
  868  git add ../**/*.py
  869  git status
  870  git add ../**/*.ipynb
  871  git status
  872  git add ../
  873  git status
  874  git add **/*.xml
  875  git add ../**/*.xml
  876  git status
  877  git add ../**/*.ipynb
  878  git status
  879  git add ../../**/*.ipynb
  880  git add ../*/*/*.ipynb
  881  git st
  882  git status
  883  git commit "some other things"
  884  git commit -m "some other things"
  885  git status
  886  git status
  887  git add **/*.py
  888  git add **/*.ippynb
  889  git add **/*.ipynb
  890  git status
  891  git commit -m "tmp"
  892  deactivate
  893  conda deactivate
  894  conda activate openmmlab
  895  conda install sklrean
  896  conda install sklearn
  897  conda install scikit-learn
  898  git co configs/redet/compare.ipynb
  899  git checkout configs/redet/compare.ipynb
  900  rm ./*
  901  ls image*
  902  ls
  903  cd out
  904  cd configs/redet/out/
  905  rm ./*.png
  906  conda list
  907  conda env list
  908  conda info --envs
  909  ls -la ~/anaconda3/envs/  # or ~/miniconda3/envs/
  910  # or
  911  stat ~/anaconda3/envs/your_env_name
  912  st
  913  stat ~/anaconda3/envs/spatial-mmlab
  914  ls -la ~/anaconda3/envs/
  915  ls -la ~/miniconda3/envs/
  916  history