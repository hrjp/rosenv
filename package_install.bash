#!/bin/bash
export ROS_VER=melodic
sudo apt update
sudo apt-get install -y ros-$ROS_VER-velodyne
sudo apt-get install -y ros-$ROS_VER-joy
sudo apt-get install -y ros-$ROS_VER-joystick-drivers
sudo apt-get install -y ros-$ROS_VER-jsk-visualization
sudo apt-get install -y ros-$ROS_VER-image-proc
sudo apt-get install -y ros-$ROS_VER-realsense2-camera
sudo apt-get install -y ros-$ROS_VER-move-base
sudo apt-get install -y ros-$ROS_VER-gmapping
sudo apt-get install -y ros-$ROS_VER-amcl
sudo apt-get install -y ros-$ROS_VER-mcl-3dl
sudo apt-get install -y ros-$ROS_VER-urg-node
sudo apt-get install -y ros-$ROS_VER-turtlesim
sudo apt-get install -y ros-$ROS_VER-rosserial-arduino
sudo apt-get install -y ros-$ROS_VER-rosserial
sudo apt-get install -y ros-$ROS_VER-map-server
sudo apt-get install -y ros-$ROS_VER-diff-drive-controller
sudo apt-get install -y ros-$ROS_VER-ros-control
sudo apt-get install -y ros-$ROS_VER-ros-controllers
sudo apt-get install -y ros-$ROS_VER-gazebo-ros-control
sudo apt-get install -y ros-$ROS_VER-uvc-camera 
sudo apt-get install -y ros-$ROS_VER-joint-state-publisher-gui
sudo apt-get install -y python-numpy
sudo apt-get install -y python-scipy
sudo apt-get install -y python-matplotlib
sudo apt-get install -y ipython ipython-notebook
sudo apt-get install -y python-pandas
sudo apt-get install -y python-sympy
sudo apt-get install -y python-nose