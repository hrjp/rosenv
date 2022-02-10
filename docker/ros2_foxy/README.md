# Dockerfile for ROS2_GPUs
This is for building a GPUs based ROS2 enviroment.  
ROS2 distribution supports Dashing and Foxy.

1. ## Build Image
    To clone the current relesse:
    ```bash:bash
    $ git clone https://github.com/cycling-Ohnishi/Dockerfile.git
    ```
    To build the ROS-Foxy(default):
    ```bash:bash
    $ docker build -t my/ros:foxy_gpu Dockerfile/ros2/ROS2_GPU
    ```
    &nbsp;&nbsp;or  
    To build the ROS-dashing(option):
    ```bash:bash
    $ docker build -t my/ros:dashing_gpu \
                   --build-arg ros2_ver=dashing \
                   --build-arg ubuntu_ver=18.04 Dockerfile/ros2/ROS2_GPU
    ```

2. ## Run a Docker container based on image
    To run a docker container based on my/image:
    ```bash:bash
    $ docker run -it \
                 --name ROS_Foxy_GPU \
                 -v /tmp/.X11-unix:/tmp/.X11-unix \
                 -e DISPLAY=$DISPLAY \
                 -e QT_X11_NO_MITSHM=1 \
                 --gpus all \
                 my/ros:foxy_gpu /bin/bash
    ```
    &nbsp;&nbsp;or  
    To run a docker container based on my/image(in the case of Dashing):
    ```bash:bash
    $ docker run -it \
                 --name ROS_Dashing_GPU \
                 -v /tmp/.X11-unix:/tmp/.X11-unix \
                 -e DISPLAY=$DISPLAY \
                 -e QT_X11_NO_MITSHM=1 \
                 --gpus all \
                 my/ros:dashing_gpu /bin/bash
    ```