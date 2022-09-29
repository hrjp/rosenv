# YOLOX ROS noetic enviroment


FROM hrjp/ros:noetic_cudagl

ENV ROS_DISTRO=noetic

RUN apt update && \
    apt install -y python3-pip && \
    pip3 install torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cu116

RUN cd /home &&\
    git clone https://github.com/Megvii-BaseDetection/YOLOX && \
    cd YOLOX && \
    pip3 install -v -e .

RUN apt clean

WORKDIR /home/catkin_ws
