
ARG ubuntu_ver=24.04
ARG BASE_IMAGE=ubuntu:$ubuntu_ver
FROM $BASE_IMAGE

ENV DEBIAN_FRONTEND=noninteractive


#RUN locale  ## check for UTF-8  https://hub.docker.com/r/nvidia/opengl
RUN touch /etc/apt/apt.conf.d/99fixbadproxy && \
    echo "Acquire::http::Pipeline-Depth 0; Acquire::http::No-Cache true; Acquire::BrokenProxy true;" >> /etc/apt/apt.conf.d/99fixbadproxy && \
	apt update && apt install -y locales && \
	locale-gen en_US en_US.UTF-8  && \
	update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8 && \
	export LANG=en_US.UTF-8
#RUN locale  ## verify settingsRUN apt update

RUN apt update && apt install -y curl gnupg2 lsb-release tmux vim git wget python3-pip && \
	curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | apt-key add - && \
	sh -c 'echo "deb [arch=$(dpkg --print-architecture)] http://packages.ros.org/ros2/ubuntu $(lsb_release -cs) main" > /etc/apt/sources.list.d/ros2-latest.list' && \
	apt update
	
	
ARG ros2_ver=foxy
ENV ROS_DISTRO=$ros2_ver

#Indtall ROS2(Foxy etc..) and Install Tool for ROS2 and setup script の自動実行 and Install turtlesim and gazebo and Install ros2_example and turtulebot3_gazebo(waffle or burger)
RUN apt install -y ros-$ROS_DISTRO-desktop ros-$ROS_DISTRO-turtlesim ros-$ROS_DISTRO-gazebo-ros-pkgs \
	python3-rosdep python3-argcomplete python3-colcon-common-extensions && \
	echo "ros installed" && \
    rosdep init && \
    rosdep update && \
	mkdir -p /home/colcon_ws/src && cd /home/colcon_ws && \
	/bin/bash -c "source /opt/ros/$ROS_DISTRO/setup.bash; colcon build --symlink-install" && \
	echo "source /opt/ros/$ROS_DISTRO/setup.bash" >> ~/.bashrc && \
	echo "source /home/colcon_ws/install/setup.bash" >> ~/.bashrc && \
	echo "source /home/colcon_ws/install/local_setup.bash" >> ~/.bashrc && \
	apt update && \
    apt clean && \
    rm -rf /var/lib/apt/lists/* && \
    echo "succesfully"
	
WORKDIR /home/colcon_ws


	
#apt install ros-melodic-joint-state-publisher-gui
#vcs import src < turtlebot3.repos
#git clone -b ros2 https://github.com/ROBOTIS-GIT/turtlebot3_simulations.git && \
#git clone -b foxy https://github.com/ros2/examples && \


#docker run -it --rm -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY -e QT_X11_NO_MITSHM=1 --gpus all nvidia/opengl:1.2-glvnd-runtime-ubuntu20.04 /bin/bash

#RUN apt install -y python3 python3-pip vim
#RUN pip3 install torch torchvision jupyterlab matplotlib
#WORKDIR /work

#COPY train.py /work/

#ENV LIBRARY_PATH /usr/local/cuda/lib64/stubs
