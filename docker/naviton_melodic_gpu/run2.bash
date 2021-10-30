#!/bin/bash
CONTAINER_NAME=$1
SHARE_FOLDER_PATH=$2
SHARE_FOLDER_CMD="-v $SHARE_FOLDER_PATH:/home/share"
GPU_CMD="--gpus all"
REMOVE_CMD="--rm"

if [ $# -ne 1 ]; then
  echo "CONTAINER_NAME=naviton_melodic  SHARE_FOLDER_CMD is disabled " 1>&2
  #0
  CONTAINER_NAME=naviton_melodic
  SHARE_FOLDER_CMD=""

else
if [ $# -ne 2 ]; then
  echo "CONTAINER_NAME=$CONTAINER_NAME  SHARE_FOLDER_CMD is disabled " 1>&2
  #1
  SHARE_FOLDER_CMD=""

else
#2
echo "CONTAINER_NAME=$CONTAINER_NAME  SHARE_FOLDER_CMD=$SHARE_FOLDER_PATH " 1>&2
fi
fi

usage_exit() {
        echo "Usage: $0 [-a] [-d dir] item ..." 1>&2
        exit 1
}

while getopts ad:h OPT
do
    case $OPT in
        g)  GPU_CMD=""
            ;;
        r)  REMOVE_CMD=""
            ;;
        \?) usage_exit
            ;;
    esac
done



cd
touch $CONTAINER_NAME.bash
sudo chmod 777 $CONTAINER_NAME.bash
echo -e "xhost + \n docker start $CONTAINER_NAME \n docker exec -it $CONTAINER_NAME /bin/bash" >>$CONTAINER_NAME.bash


docker run -it --name $CONTAINER_NAME \
            -v /dev:/dev \
            -v /tmp/.X11-unix:/tmp/.X11-unix \
            $SHARE_FOLDER_CMD \
            -e DISPLAY=$DISPLAY \
            -e QT_X11_NO_MITSHM=1 \
            --gpus all \
            --net=host \
            --privileged \
            hrjp/naviton:melodic_gpu /bin/bash

