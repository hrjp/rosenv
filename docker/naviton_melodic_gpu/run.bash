#!/bin/bash

if [ $# -ne 2 ]; then
  echo "指定された引数は$#個です。" 1>&2
  echo "実行するには3個の引数が必要です。" 1>&2
  exit 1
fi

CONTAINAR_NAME=$1
SHARE_FOLDER_PATH=$2

docker run -it --name $CONTAINAR_NAME \
            -v /dev:/dev \
            -v /tmp/.X11-unix:/tmp/.X11-unix \
            -v $SHARE_FOLDER_PATH:/home/share \
            -e DISPLAY=$DISPLAY \
            -e QT_X11_NO_MITSHM=1 \
            --gpus all \
            --net=host \
            --privileged \
            hrjp/naviton:melodic_gpu /bin/bash

