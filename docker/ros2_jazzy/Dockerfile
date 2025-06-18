
ARG ubuntu_ver=24.04
ARG BASE_IMAGE=ubuntu:$ubuntu_ver
FROM $BASE_IMAGE

ENV DEBIAN_FRONTEND=noninteractive

RUN touch /etc/apt/apt.conf.d/99fixbadproxy && \
    echo "Acquire::http::Pipeline-Depth 0; Acquire::http::No-Cache true; Acquire::BrokenProxy true;" >> /etc/apt/apt.conf.d/99fixbadproxy && \
	apt update && apt install -y locales && \
	locale-gen en_US en_US.UTF-8  && \
	update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8 && \
	export LANG=en_US.UTF-8

RUN apt update && apt install -y curl gnupg2 lsb-release tmux vim git wget python3-pip liburdfdom-tools lsb-release bash-completion nautilus software-properties-common && \
	echo "source /etc/bash_completion" >> /root/.bashrc &&\
	curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg && \
	echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | tee /etc/apt/sources.list.d/ros2.list > /dev/null && \
	apt update
	
	
ARG ros2_ver=jazzy
ENV ROS_DISTRO=$ros2_ver

RUN apt install -y ros-$ROS_DISTRO-desktop-full ros-$ROS_DISTRO-turtlesim ros-$ROS_DISTRO-ros-gz ros-$ROS_DISTRO-rqt-* \
	python3-rosdep python3-argcomplete python3-colcon-common-extensions && \
	apt install -y python3-vcstool && \
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
