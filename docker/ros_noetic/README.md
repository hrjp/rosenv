# Dockerfile for ros:melodic
This is for building a ros:noetic enviroment. 
  
1. ## Build Image
    To clone the current relesse:
    ```bash:bash
    git clone https://github.com/hrjp/rosenv
    ```
    build image:
    ```bash:bash
    docker build -t user/ros:noetic rosenv/docker/ros_noetic
    ```

2. ## Run a Docker container based on image
    To run a docker container based on user/image:
    ```bash:bash
        docker run -it --name ros_noetic -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY -e QT_X11_NO_MITSHM=1 user/ros:melodic /bin/bash 
    ```