#FROM nvidia/opengl:1.2-glvnd-runtime-ubuntu20.04
FROM ubuntu:focal

RUN touch /etc/apt/apt.conf.d/99fixbadproxy && \
    echo "Acquire::http::Pipeline-Depth 0; Acquire::http::No-Cache true; Acquire::BrokenProxy true;" >> /etc/apt/apt.conf.d/99fixbadproxy && \
    apt update && \
    apt install -y git tmux vim liburdfdom-tools curl wget gnupg2 bash-completion nautilus pip && \
    echo "source /etc/bash_completion" >> /root/.bashrc &&\
    apt clean && \
    rm -rf /var/lib/apt/lists/* 

WORKDIR /home

# lsb-release 

