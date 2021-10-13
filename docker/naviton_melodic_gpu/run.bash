#!/bin/bash

if [ $# -ne 2 ]; then
  echo "指定された引数は2個です。" 1>&2
  echo "コンテナの名前　コンテナ内部と共有するフォルダのパス　の順に指定してください" 1>&2
  exit 1
fi

CONTAINER_NAME=$1
SHARE_FOLDER_PATH=$2

sudo echo""

docker run -it --name $CONTAINER_NAME \
            -v /dev:/dev \
            -v /tmp/.X11-unix:/tmp/.X11-unix \
            -v $SHARE_FOLDER_PATH:/home/share \
            -e DISPLAY=$DISPLAY \
            -e QT_X11_NO_MITSHM=1 \
            --gpus all \
            --net=host \
            --privileged \
            hrjp/naviton:melodic_gpu /bin/bash

cd
touch $CONTAINER_NAME.bash
sudo chmod 777 $CONTAINER_NAME.bash
echo -e "#!/bin/bash \n xhost + \n docker start $CONTAINER_NAME \n docker exec -it $CONTAINER_NAME /bin/bash" >>$CONTAINER_NAME.bash
