#!/bin/bash

mkdir gtsam
cd gtsam
wget -O gtsam.zip https://github.com/borglab/gtsam/archive/4.0.0-alpha2.zip
unzip gtsam.zip -d .
cd gtsam-4.0.0-alpha2/
mkdir build && cd build
cmake ..
sudo make install
