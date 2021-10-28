#!/bin/bash

sudo apt update
sudo apt-get update
sudo apt install git
sudo apt install -y python3-pip
sudo pip3 install tornado
sudo pip3 install simplejpeg
sudo pip3 install rospkg

if [-d "/home/catkin_ws/src" ]; then
    cd /home/catkin_ws/src
    git clone https://github.com/dheera/rosboard
fi
if [-d "/home/ros1_ws/src" ]; then
    cd /home/catkin_ws/src
    git clone https://github.com/dheera/rosboard
fi
if [-d "/home/$USER/catkin_ws/src" ]; then
    cd /home/catkin_ws/src
    git clone https://github.com/dheera/rosboard
fi
cd ..
catkin build
source devel/setup.bash
