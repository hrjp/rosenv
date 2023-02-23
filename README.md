[![naviton workflow](https://github.com/hrjp/rosenv/actions/workflows/naviton-image-build.yml/badge.svg)](https://hub.docker.com/repository/docker/hrjp/naviton)   

[![ros workflow](https://github.com/hrjp/rosenv/actions/workflows/ros-melodic-image-build.yml/badge.svg)](https://hub.docker.com/repository/docker/hrjp/ros)
[![ROS noetic image build](https://github.com/hrjp/rosenv/actions/workflows/ros-noetic-image-build.yml/badge.svg?branch=main)](https://hub.docker.com/repository/docker/hrjp/ros)   

[![ros2 workflow](https://github.com/hrjp/rosenv/actions/workflows/ros2-foxy-image-build.yml/badge.svg)](https://hub.docker.com/repository/docker/hrjp/ros2)
[![ros2 workflow](https://github.com/hrjp/rosenv/actions/workflows/ros2-galactic-image-build.yml/badge.svg)](https://hub.docker.com/repository/docker/hrjp/ros2)
[![ros2 workflow](https://github.com/hrjp/rosenv/actions/workflows/ros2-humble-image-build.yml/badge.svg)](https://hub.docker.com/repository/docker/hrjp/ros2)   

[![Ubuntu20.04 image build](https://github.com/hrjp/rosenv/actions/workflows/ubuntu-20-image-build.yml/badge.svg)](https://hub.docker.com/repository/docker/hrjp/ubuntu)   

[![YOLOX noetic image build](https://github.com/hrjp/rosenv/actions/workflows/yolox-noetic-image-build.yml/badge.svg)](https://hub.docker.comUbuntu20.04/repository/docker/hrjp/yolox)   

[![SLAM melodic image build](https://github.com/hrjp/rosenv/actions/workflows/slam-melodic-build.yml/badge.svg)](https://github.com/hrjp/rosenv/actions/workflows/slam-melodic-build.yml)   

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

# ROS2 galactic
./rosenv/docker/ros2_galactic/run.bash

# ROS2 humble
./rosenv/docker/ros2_humble/run.bash

# naviton env
./rosenv/docker/naviton_melodic/run.bash

# Ubuntu 20.04
./rosenv/docker/ubuntu20/run.bash

# YOLO v5
./rosenv/docker/yolo5/run.bash

# YOLOX with ROS1 noetic
./rosenv/docker/ubuntu20/run.bash

# LeGO-LOAM and hdl_graph_slam with ROS1 melodic
./rosenv/docker/slam_melodic/run.bash
```

## container option

必要に応じて以下のオプションを指定する
| Option | Default | Details |
| :--- | :--- | :--- |
| -g | | GPUを使用する |
| -r | | コンテナからexitした際にコンテナを自動消去する | 
| -n CONTAINER_NAME | | コンテナの名前 |
| -s SHARE_FOLDER_PATH | | コンテナ内部と共有するディレクトリのパス<br>rosbagをやデータを外部と共有する際に使用<br>(ex.　shareフォルダを作ってから　/home/$USER/share ) |



### Option無しで実行 (GPU無し　コンテナ名=naviton_melodic 共有フォルダ無し)
```bash
./rosenv/docker/naviton_melodic/run.bash
```
### Optionの使用例 (GPU有り　コンテナ名=naviton　共有フォルダ=/home/$USER/share)

```bash:bash
./rosenv/docker/naviton_melodic/run.bash -g -n naviton -s /home/$USER/share
```

 ## コンテナ作成後
exitしてコンテナの外に出るとhomeディレクトリにCONTAINER_NAME.bash (CONTAINER_NAMEは自分で作成したコンテナの名前)が生成されている

```bash:bash
cd
./CONTAINER_NAME.bash
```
次回からは上記のスクリプトを実行すると自動でコンテナをスタートしてコンテナ内に入れる

---

# CI/CD Workflow
### Github repositories
* [rosenv](https://github.com/hrjp/rosenv)
* [navtion](https://github.com/hrjp/navtion)

### Dockerhub repositories

* [hrjp/ros](https://hub.docker.com/repository/docker/hrjp/ros)
* [hrjp/naviton](https://hub.docker.com/repository/docker/hrjp/naviton)


```mermaid
graph TD

  subgraph GitHub
    subgraph rosenv
      docker/ros_melodic/Dockerfile
      docker/naviton_melodic/Dockerfile
    end
    subgraph naviton 
      docker/main/Dockerfile
      docker/develop/Dockerfile
    end
  end
  subgraph dockerhub
    subgraph hrjp/ros
      hrjp/ros:melodic_cudagl
    end
    subgraph hrjp/naviton
      hrjp/naviton:melodic_cudagl
      hrjp/naviton:melodic_main
      hrjp/naviton:melodic_develop
    end
  end
  
  docker/ros_melodic/Dockerfile-->|Auto build and push at 11 P.M.|hrjp/ros:melodic_cudagl
  hrjp/ros:melodic_cudagl-->docker/naviton_melodic/Dockerfile
  docker/naviton_melodic/Dockerfile-->|Auto build and push at 1 A.M.|hrjp/naviton:melodic_cudagl
  hrjp/naviton:melodic_cudagl-->docker/main/Dockerfile
  hrjp/naviton:melodic_cudagl-->docker/develop/Dockerfile
  docker/main/Dockerfile-->|Auto docker build and push at 3 A.M.|hrjp/naviton:melodic_main
  docker/develop/Dockerfile-->|Auto docker build and push at 3 A.M.|hrjp/naviton:melodic_develop
  
  click docker/ros_melodic/Dockerfile https://github.com/hrjp/rosenv/blob/main/docker/ros_melodic/Dockerfile
  click docker/naviton_melodic/Dockerfile https://github.com/hrjp/rosenv/blob/main/docker/naviton_melodic/Dockerfile
  click docker/main/Dockerfile https://github.com/hrjp/naviton/blob/main/docker/main/Dockerfile
  click docker/develop/Dockerfile https://github.com/hrjp/naviton/blob/main/docker/develop/Dockerfile
  
  click hrjp/ros:melodic_cudagl https://hub.docker.com/repository/docker/hrjp/ros
  click hrjp/naviton:melodic_cudagl https://hub.docker.com/repository/docker/hrjp/naviton
  click hrjp/naviton:melodic_main https://hub.docker.com/repository/docker/hrjp/naviton
  click hrjp/naviton:melodic_develop https://hub.docker.com/repository/docker/hrjp/naviton
  
```

