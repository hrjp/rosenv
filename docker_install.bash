#!/bin/bash
sudo apt update
sudo apt install -y curl
curl https://get.docker.com | sh \
  && sudo systemctl --now enable docker
sudo gpasswd -a $USER docker