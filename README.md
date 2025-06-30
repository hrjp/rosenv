[![ros workflow](https://github.com/hrjp/rosenv/actions/workflows/ros-melodic-image-build.yml/badge.svg)](https://hub.docker.com/repository/docker/hrjp/ros)
[![ros workflow](https://github.com/hrjp/rosenv/actions/workflows/ros-noetic-image-build.yml/badge.svg?branch=main)](https://hub.docker.com/repository/docker/hrjp/ros)   

[![ros2 workflow](https://github.com/hrjp/rosenv/actions/workflows/ros2-foxy-image-build.yml/badge.svg)](https://hub.docker.com/repository/docker/hrjp/ros2)
[![ros2 workflow](https://github.com/hrjp/rosenv/actions/workflows/ros2-humble-image-build.yml/badge.svg)](https://hub.docker.com/repository/docker/hrjp/ros2)
[![ROS2 jazzy image build](https://github.com/hrjp/rosenv/actions/workflows/ros2-jazzy-image-build.yml/badge.svg)](https://github.com/hrjp/rosenv/actions/workflows/ros2-jazzy-image-build.yml)

![license](https://img.shields.io/github/license/hrjp/rosenv)
![size](https://img.shields.io/github/repo-size/hrjp/rosenv)
![commit](https://img.shields.io/github/last-commit/hrjp/rosenv/main)

# rosenv
ROS environment construction   
ROS1/ROS2向けのDocker Image
* GPU,CUDA対応
* Ethernet,USB接続のセンサー等も使用可能
* bashスクリプトが自動生成されるのでコマンド1行でコンテナに入れる

---

# Setup

## 1. git clone
```bash
git clone https://github.com/hrjp/rosenv
```
## 2. make container
```bash
# ROS1 melodic
./rosenv/docker/ros_melodic/run.bash

# ROS1 noetic
./rosenv/docker/ros_noetic/run.bash

# ROS2 foxy
./rosenv/docker/ros2_foxy/run.bash

# ROS2 humble
./rosenv/docker/ros2_humble/run.bash

# ROS2 jazzy
./rosenv/docker/ros2_jazzy/run.bash
```

## container option

必要に応じて以下のオプションを指定する
| Option | Default | Details |
| :--- | :--- | :--- |
| -g | | GPUを使用する |
| -r | | コンテナからexitした際にコンテナを自動消去する | 
| -w | | --net-host をつけないで実行する(コンテナ外とネットワークを分離する) |
| -n CONTAINER_NAME | | コンテナの名前 |
| -s SHARE_FOLDER_PATH | | コンテナ内部と共有するディレクトリのパス<br>rosbagをやデータを外部と共有する際に使用<br>(ex.　shareフォルダを作ってから　/home/$USER/share ) |
| -c CUDA_VERSION | | CUDAバージョンを指定して使用する |
| -h | | このヘルプメッセージを表示する |



### Option無しで実行 (GPU無し　コンテナ名=ros2_jazzy 共有フォルダ無し)
```bash
./rosenv/docker/ros2_jazzy/run.bash
```
### Optionの使用例 (GPU有り　コンテナ名=naviton　共有フォルダ=/home/$USER/share)

```bash:bash
./rosenv/docker/ros2_jazzy/run.bash -g -n naviton -s /home/$USER/share
```

 ## コンテナ作成後
exitしてコンテナの外に出るとhomeディレクトリにCONTAINER_NAME.bash (CONTAINER_NAMEは自分で作成したコンテナの名前)が生成されている

```bash:bash
cd
./CONTAINER_NAME.bash
```
次回からは上記のスクリプトを実行すると自動でコンテナをスタートしてコンテナ内に入れる

## old version
--> https://github.com/hrjp/rosenv/tree/v1.0