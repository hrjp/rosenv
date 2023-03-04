# ROS Melodic enviroment

ARG BASE_IMAGE=hrjp/ubuntu:18_cudagl
FROM $BASE_IMAGE

ENV ROS_DISTRO=melodic
ENV DEBIAN_FRONTEND=noninteractive

### ROS1 Install ###
RUN touch /etc/apt/apt.conf.d/99fixbadproxy && \
    echo "Acquire::http::Pipeline-Depth 0; Acquire::http::No-Cache true; Acquire::BrokenProxy true;" >> /etc/apt/apt.conf.d/99fixbadproxy && \ 
    apt update && \
    apt install -y git tmux vim liburdfdom-tools lsb-release curl wget gnupg2 bash-completion nautilus && \
    echo "source /etc/bash_completion" >> /root/.bashrc

RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list' && \
    apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654

RUN apt update && \
    apt install -y ros-$ROS_DISTRO-desktop-full ros-$ROS_DISTRO-rosserial ros-$ROS_DISTRO-rosserial-arduino python-rosdep python-catkin-tools && \
    echo "ros installed" 

RUN rosdep init && \
    rosdep update && \
    mkdir -p /home/catkin_ws/src && \
    cd /home/catkin_ws && \
    ls src && \
    /bin/bash -c "source /opt/ros/$ROS_DISTRO/setup.bash; catkin build" && \
    echo "source /opt/ros/$ROS_DISTRO/setup.bash" >> /root/.bashrc && \
    echo "source /home/catkin_ws/devel/setup.bash" >> /root/.bashrc && \
    apt update && \
    apt install python3-vcstool && \
    apt clean && \
    rm -rf /var/lib/apt/lists/* && \
    echo "succesfully"

WORKDIR /home/catkin_ws
