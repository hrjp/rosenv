#!/bin/bash


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

git clone https://github.com/koide3/ndt_omp
git clone https://github.com/SMRT-AIST/fast_gicp --recursive
git clone https://github.com/koide3/hdl_localization
git clone https://github.com/koide3/hdl_global_localization
git clone https://github.com/koide3/hdl_people_tracking

cd ..
catkin build -DBUILD_VGICP_CUDA=ON
source devel/setup.bash
