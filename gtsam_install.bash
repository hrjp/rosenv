#!/bin/bash
sudo apt update
sudo apt-get install -y git curl wget

if [ ! -d "/home/$USER" ]; then
    cd /home
else
    cd /home/$USER
fi

mkdir gtsam
cd gtsam
wget -O gtsam.zip https://github.com/borglab/gtsam/archive/4.1.1.zip
unzip gtsam.zip -d .
cd gtsam-4.1.1/
mkdir build && cd build
cmake ..
sudo make install