#!/bin/bash

IMAGE_NAME=yolov5:naviton_ros2
CONTAINER_NAME=yolov5_naviton
SHARE_FOLDER_PATH=""
SHARE_FOLDER_CMD=""
GPU_CMD=""


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

while getopts grn:s:h OPT
do
    case $OPT in
        g )  GPU_CMD="--gpus all"
            echo " Using nvidia GPUs" 1>&2
            ;;
        r )  REMOVE_CMD="--rm"
            echo " Remove when exit this container" 1>&2
            ;;
        n)  CONTAINER_NAME=$OPTARG
            echo " CONTAINER_NAME = $OPTARG " 1>&2
            ;;
        s )  SHARE_FOLDER_PATH=$OPTARG
            SHARE_FOLDER_CMD="-v $SHARE_FOLDER_PATH:/home/share"
            echo " SHARE_FOLDER_PATH = $SHARE_FOLDER_PATH " 1>&2
            ;;
        h ) usage_exit
            ;;
        \? ) usage_exit
            ;;
    esac
done



if [ -z $REMOVE_CMD ]; then
    cd
    if [ ! -f $CONTAINER_NAME.bash ]; then
        touch $CONTAINER_NAME.bash
        sudo chmod 777 $CONTAINER_NAME.bash
        echo -e "xhost + \n docker start $CONTAINER_NAME \n docker exec -it $CONTAINER_NAME /bin/bash" >>$CONTAINER_NAME.bash
    fi
fi

xhost +

docker run -it --name $CONTAINER_NAME \
            -v /dev:/dev \
            -v /tmp/.X11-unix:/tmp/.X11-unix \
            -v $HOME/.Xauthority:/root/.Xauthority:rw \
            $SHARE_FOLDER_CMD \
            -e DISPLAY=$DISPLAY \
            -e QT_X11_NO_MITSHM=1 \
            $GPU_CMD \
            $REMOVE_CMD \
            --net=host \
            --privileged \
            --group-add $(getent group audio | cut -d: -f3) \
            -e PULSE_SERVER=unix:${XDG_RUNTIME_DIR}/pulse/native \
            -v ${XDG_RUNTIME_DIR}/pulse/native/:${XDG_RUNTIME_DIR}/pulse/native \
            -v ${HOME}/.config/pulse/cookie:/root/.config/pulse/cookie \
            $IMAGE_NAME /bin/bash

