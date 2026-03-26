#!/bin/bash

IMAGE_NAME=hrjp/ros2:jazzy
CONTAINER_NAME=ros2_jazzy
SHARE_FOLDER_PATH=""
SHARE_FOLDER_CMD=""
GPU_CMD=""
REMOVE_CMD=""
CONTAINER_NAME_CMD="--name $CONTAINER_NAME"
NETHOST_CMD="--net=host"
USER_CMD=""
EXEC_USER_CMD=""
XAUTHORITY_PATH="/root/.Xauthority"
XAUTHORITY_ENV_CMD=""

usage_exit() {
        echo " " 1>&2
        echo " -----------------------------------------------------------------------------" 1>&2
        echo " OPTIONS              | DETAILS " 1>&2
        echo " -----------------------------------------------------------------------------" 1>&2
        echo " -g                   | GPU enabled" 1>&2
        echo " -r                   | remove when exit the container" 1>&2
        echo " -n CONTAINER_NAME    | container name (default : $CONTAINER_NAME )" 1>&2
        echo " -s SHARE_FOLDER_PATH | directory path shared with the inside of the container" 1>&2
        echo " -c CUDA_VERSION      | use CUDA version (default : none, options: 12.6.3, 12.8.1, 12.9.1)" 1>&2
        echo " -w                   | not using --net=host" 1>&2
        echo " -u                   | run as current user instead of root" 1>&2
        echo " -h                   | show this help message" 1>&2
        echo " -----------------------------------------------------------------------------" 1>&2
        exit 1
}

while getopts gruwn:s:c:h OPT
do
    case $OPT in
        g )  GPU_CMD="--gpus all"
            echo " Using nvidia GPUs" 1>&2
            ;;
        r )  REMOVE_CMD="--rm"
            CONTAINER_NAME_CMD=""
            echo " Remove when exit this container" 1>&2
            ;;
        w )  NETHOST_CMD=""
            echo " Not using --net=host" 1>&2
            ;;
        u )  USER_CMD="--user $(id -u):$(id -g)"
            EXEC_USER_CMD="--user $(id -u):$(id -g)"
            XAUTHORITY_PATH="/tmp/.Xauthority"
            XAUTHORITY_ENV_CMD="-e XAUTHORITY=/tmp/.Xauthority"
            echo " Running as current user" 1>&2
            ;;
        n)  CONTAINER_NAME=$OPTARG
            CONTAINER_NAME_CMD="--name $CONTAINER_NAME"
            echo " CONTAINER_NAME = $OPTARG " 1>&2
            ;;
        s )  SHARE_FOLDER_PATH=$OPTARG
            SHARE_FOLDER_CMD="-v $SHARE_FOLDER_PATH:/home/share"
            echo " SHARE_FOLDER_PATH = $SHARE_FOLDER_PATH " 1>&2
            ;;
        c )  IMAGE_NAME="${IMAGE_NAME}_cuda${OPTARG}"
            echo " Using CUDA image: $IMAGE_NAME" 1>&2
            ;;
        h ) usage_exit
            ;;
        \? ) usage_exit
            ;;
    esac
done



if [ -z "${REMOVE_CMD:-}" ]; then
    cd
    if [ ! -f "$CONTAINER_NAME.bash" ]; then
        touch "$CONTAINER_NAME.bash"
        sudo chmod 777 "$CONTAINER_NAME.bash"
        echo -e "xhost + \n docker start $CONTAINER_NAME \n docker exec -it ${EXEC_USER_CMD:+$EXEC_USER_CMD }$CONTAINER_NAME /bin/bash" >>"$CONTAINER_NAME.bash"
    fi
else
    CONTAINER_NAME=""
fi

xhost +

docker run -it  $CONTAINER_NAME_CMD\
            -v /dev:/dev \
            -v /tmp/.X11-unix:/tmp/.X11-unix \
            -v $HOME/.Xauthority:$XAUTHORITY_PATH:rw \
            $SHARE_FOLDER_CMD \
            -e DISPLAY=$DISPLAY \
            -e QT_X11_NO_MITSHM=1 \
            $XAUTHORITY_ENV_CMD \
            $USER_CMD \
            $GPU_CMD \
            $REMOVE_CMD \
            $NETHOST_CMD \
            --privileged \
            $IMAGE_NAME /bin/bash
