#######################################################################################################################################################################################
###  Install ROS1(melodic) on ubuntu18.04 ###
#
## build
# $ docker build -t my/ros-gpu:melodic .
#
## run
# $ docker run -it --name ROS_Melodic_GPU  -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY -e QT_X11_NO_MITSHM=1 --gpus all my/ros-gpu:melodic /bin/bash
#
#######################################################################################################################################################################################



#FROM ubuntu:18.04

#FROM nvidia/opengl:1.2-glvnd-runtime-ubuntu18.04

FROM nvidia/cudagl:11.4.0-devel-ubuntu18.04

ENV ROS_DISTRO=melodic
ENV DEBIAN_FRONTEND=noninteractive

### ROS1 Install ###
RUN touch /etc/apt/apt.conf.d/99fixbadproxy && \
    echo "Acquire::http::Pipeline-Depth 0; Acquire::http::No-Cache true; Acquire::BrokenProxy true;" >> /etc/apt/apt.conf.d/99fixbadproxy && \
    apt update && \
    apt install -y git tmux vim liburdfdom-tools lsb-release curl gnupg2

RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list' && \
    apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654

RUN apt update && \
    apt install -y ros-$ROS_DISTRO-desktop-full ros-$ROS_DISTRO-rosserial ros-$ROS_DISTRO-rosserial-arduino python-rosdep python-catkin-tools && \
    echo "ros installed" && \
    rosdep init && \
    rosdep update && \
    mkdir -p /home/catkin_ws/src && \
    cd /home/catkin_ws && \
    ls src && \
    /bin/bash -c "source /opt/ros/$ROS_DISTRO/setup.bash; catkin build" && \
    echo "source /opt/ros/$ROS_DISTRO/setup.bash" >> /root/.bashrc && \
    echo "source /home/catkin_ws/devel/setup.bash" >> /root/.bashrc && \
    apt update && \
    apt clean && \
    rm -rf /var/lib/apt/lists/* && \
    echo "succesfully"

RUN apt update && \
    apt-get install -y git curl wget nautilus && \
    apt install nvidia-cuda-toolkit
RUN git clone https://github.com/hrjp/rosenv
RUN ./rosenv/package_install.bash && \
    ./rosenv/gazebo_update.bash && \
    ./rosenv/gtsam_install.bash 
RUN rm -rf /home/rosenv && \
    echo "source export DISPLAY=:0" >> /root/.bashrc
    

WORKDIR /home/catkin_ws



### apt install package detail ###
# liburdfdom-tools //command{$ check_urdf [file_path]}:simple check for urdf_file

### apt available ros-package detail ###
# ros-melodic-joint-state-publisher-gui //for move arm(joint) on rviz 
# ros-melodic-turtlesim ros-melodic-effort-controllers ros-melodic-joint-trajectory-controller ros-melodic-joint-state-publisher-gui

### Before execute commands, following execute two comands###
## ROS1
#source /opt/ros/$ROS_DISTRO/setup.bash
#source ~/ros1_ws/devel/setup.bash

#RUN rm -rf /var/lib/apt/lists/*


## docker build option: --build-arg ros1_ver=noetic and --build-arg ubuntu_ver=20.04
# $ docker build -t my/ros-gpu:noetic --build-arg ros1_ver=noetic --build-arg ubuntu_ver=20.04 .
