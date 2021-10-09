#!/bin/bash

mkdir gtsam
wget -O ~/gtsam/gtsam.zip https://github.com/borglab/gtsam/archive/4.0.0-alpha2.zip
cd ~/gtsam/ && unzip gtsam.zip -d ~/gtsam/
cd ~/gtsam/gtsam-4.0.0-alpha2/
mkdir build && cd build
cmake ..
sudo make install
