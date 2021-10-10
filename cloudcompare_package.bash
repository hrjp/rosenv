#!/bin/bash

sudo apt -y update
sudo apt -y install git cmake cmake-curses-gui cmake-gui curl wget p7zip-full
sudo apt -y install build-essential gcc g++ make libtool texinfo dpkg-dev pkg-config

sudo apt -y update
sudo apt -y install qtbase5-dev qtdeclarative5-dev qt5-default qttools5-dev libqt5widgets5 libqwt-qt5-dev libqt5svg5-dev
cd /tmp
rm -f master.zip
sudo rm -rf CloudCompare-master
git clone --recursive https://github.com/CloudCompare/CloudCompare
cd CloudCompare
rm -rf build
mkdir build
cd build
cmake ..
cmake --build .
sudo make install