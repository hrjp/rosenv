# Dockerfile for ros:melodic_gpu
This is for building a ros:melodic_gpu enviroment. 
  
1. ## Build Image
    To clone the current relesse:
    ```bash:bash
    git clone https://github.com/hrjp/rosenv
    ```
    build image:
    ```bash:bash
    docker build -t user/ros:melodic rosenv/docker/ros_melodic_gpu
    ```

2. ## Run a Docker container based on image
    To run a docker container based on user/image:
    ```bash:bash
        docker run -it --name ros_melodic_gpu -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY -e QT_X11_NO_MITSHM=1 user/ros:melodic_gpu /bin/bash 
    ```