#!/bin/bash

sudo apt update
sudo apt-get update
sudo apt install git
sudo apt install -y python3-pip
sudo pip3 install tornado
sudo pip3 install simplejpeg
sudo pip3 install rospkg
sudo pip3 install psutil

if [ ! -d "/home/catkin_ws/src" ]; then
    echo
else
    cd /home/catkin_ws/src
    git clone https://github.com/dheera/rosboard
    cd ..
    catkin build
    source devel/setup.bash

fi

if [ ! -d "/home/ros1_ws/src" ]; then
    echo
else
    cd /home/catkin_ws/src
    git clone https://github.com/dheera/rosboard
    cd ..
    catkin build
    source devel/setup.bash
fi

if [ ! -d "/home/$USER/catkin_ws/src" ]; then
    echo
else
    cd /home/catkin_ws/src
    git clone https://github.com/dheera/rosboard
    cd ..
    catkin build
    source devel/setup.bash
fi

