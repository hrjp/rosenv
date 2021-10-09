# Dockerfile for ROS_Melodic
This is for building a ROS_Melodic enviroment. 
  
1. ## Build Image
    To clone the current relesse:
    ```bash:bash
    $ git clone https://github.com/cycling-Ohnishi/Dockerfile.git
    ```
    ROS-Melodic:
    ```bash:bash
    $ docker build -t my/ros:melodic Dockerfile/ros1/ROS_Melodic
    ```

2. ## Run a Docker container based on image
    To run a docker container based on my/image:
    ```bash:bash
    $ docker run -it \
                 --name ROS_Melodic \
                 -v /tmp/.X11-unix:/tmp/.X11-unix \
                 -e DISPLAY=$DISPLAY \
                 -e QT_X11_NO_MITSHM=1 \
                 my/ros:melodic /bin/bash 
    ```