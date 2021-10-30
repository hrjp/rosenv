#!/bin/bash

CONTAINER_NAME=naviton_melodic
SHARE_FOLDER_PATH=""
SHARE_FOLDER_CMD=""
GPU_CMD=""
REMOVE_CMD=""

usage_exit() {
        echo " " 1>&2
        echo " -----------------------------------------------------------------------------" 1>&2
        echo " OPTIONS              | DETAILS " 1>&2
        echo " -----------------------------------------------------------------------------" 1>&2
        echo " -g                   | GPU enabled" 1>&2
        echo " -r                   | remove when exit the container" 1>&2
        echo " -n CONTAINER_NAME    | container name (default : naviton_melodic)" 1>&2
        echo " -s SHARE_FOLDER_PATH | directory path shared with the inside of the container" 1>&2
        echo " -----------------------------------------------------------------------------" 1>&2
        exit 1
}

while getopts grnsh OPT
do
    case $OPT in
        g )  GPU_CMD="--gpus all"
            ;;
        r )  REMOVE_CMD="--rm"
            ;;
        n )  CONTAINER_NAME=$OPTARG
            ;;
        s )  SHARE_FOLDER_PATH=$OPTARG
            SHARE_FOLDER_CMD="-v $SHARE_FOLDER_PATH:/home/share"
            ;;
        h ) usage_exit
            ;;
        \? ) usage_exit
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
            $GPU_CMD \
            $REMOVE_CMD \
            --net=host \
            --privileged \
            hrjp/naviton:melodic_gpu /bin/bash

