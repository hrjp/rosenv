#!/bin/bash

CLONE_BRANCH="main"

if [ ! -d "/home/catkin_ws/src" ]; then
    echo
else
    cd /home/catkin_ws/src
fi

if [ ! -d "/home/ros1_ws/src" ]; then
    echo
else
    cd /home/ros1_ws/src
fi

if [ ! -d "/home/$USER/catkin_ws/src" ]; then
    echo
else
    cd /home/$USER/catkin_ws/src
fi

if [ ! -d "/home/$USER/ros1_ws/src" ]; then
    echo
else
    cd /home/$USER/ros1_ws/src
fi

if [ $# -lt 1 ]; then
    CLONE_BRANCH="main"
else
    CLONE_BRANCH="$1"
fi


git clone -b $CLONE_BRANCH https://github.com/hrjp/kcctcore
git clone -b $CLONE_BRANCH https://github.com/hrjp/kcctnavigation
git clone -b $CLONE_BRANCH https://github.com/hrjp/waypoint_tools
git clone -b $CLONE_BRANCH https://github.com/hrjp/kcctsim
git clone https://github.com/hrjp/kcctplugin
git clone https://github.com/hrjp/ira_laser_tools
git clone https://github.com/hrjp/LeGO-LOAM

cd ..
catkin build
source devel/setup.bash

echo Welcome to Naviton Platform 
echo Lets type this command
echo roslaunch kcctcore demo2d.launch
