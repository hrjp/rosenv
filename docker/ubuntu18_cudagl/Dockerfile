# ROS Melodic enviroment


FROM nvidia/cudagl:11.4.0-devel-ubuntu18.04

ENV DEBIAN_FRONTEND=noninteractive

RUN \
    # Update nvidia GPG key
    rm /etc/apt/sources.list.d/cuda.list && \
    apt-key del 7fa2af80 && \
    apt-get update && apt-get install -y --no-install-recommends wget && \
    wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-keyring_1.0-1_all.deb && \
    dpkg -i cuda-keyring_1.0-1_all.deb && \
    apt install -y nvidia-cuda-toolkit  && \
    apt clean