# ROS Melodic enviroment

ARG ubuntu_ver=18.04
ARG BASE_IMAGE=ubuntu:$ubuntu_ver
FROM $BASE_IMAGE

ENV ROS_DISTRO=melodic
ENV DEBIAN_FRONTEND=noninteractive

### ROS1 Install ###
RUN touch /etc/apt/apt.conf.d/99fixbadproxy && \
    echo "Acquire::http::Pipeline-Depth 0; Acquire::http::No-Cache true; Acquire::BrokenProxy true;" >> /etc/apt/apt.conf.d/99fixbadproxy && \ 
    apt update && \
    apt install -y git tmux vim liburdfdom-tools lsb-release curl wget gnupg2 bash-completion nautilus && \
    echo "source /etc/bash_completion" >> /root/.bashrc && \
    curl -fsSL https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/3bf863cc.pub | apt-key add -

RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list' && \
    curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | apt-key add -
RUN apt update && \
    apt install -y ros-$ROS_DISTRO-desktop-full ros-$ROS_DISTRO-rosserial ros-$ROS_DISTRO-rosserial-arduino python-rosdep python-catkin-tools && \
    echo "ros installed" 

RUN rosdep init && \
    rosdep update --include-eol-distros && \
    mkdir -p /home/catkin_ws/src && \
    cd /home/catkin_ws && \
    ls src && \
    /bin/bash -c "source /opt/ros/$ROS_DISTRO/setup.bash; catkin build" && \
    echo "source /opt/ros/$ROS_DISTRO/setup.bash" >> /root/.bashrc && \
    echo "source /home/catkin_ws/devel/setup.bash" >> /root/.bashrc && \
    apt update && \
    apt install -y python3-vcstool && \
    apt clean && \
    rm -rf /var/lib/apt/lists/* && \
    echo "succesfully"

WORKDIR /home/catkin_ws
