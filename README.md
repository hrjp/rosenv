[![naviton workflow](https://github.com/hrjp/rosenv/actions/workflows/naviton-image-build.yml/badge.svg)](https://hub.docker.com/repository/docker/hrjp/naviton)
[![ros workflow](https://github.com/hrjp/rosenv/actions/workflows/ros-image-build.yml/badge.svg)](https://hub.docker.com/repository/docker/hrjp/ros)
[![ros2 workflow](https://github.com/hrjp/rosenv/actions/workflows/ros2-image-build.yml/badge.svg)](https://hub.docker.com/repository/docker/hrjp/ros2)   

![license](https://img.shields.io/github/license/hrjp/rosenv)
![size](https://img.shields.io/github/repo-size/hrjp/rosenv)
![commit](https://img.shields.io/github/last-commit/hrjp/rosenv/main)

# rosenv
ROS environment construction 

---
# CI/CD Workflow
### Github repositories
* [rosenv](https://github.com/hrjp/rosenv)
* [navtion](https://github.com/hrjp/navtion)

### Dockerhub repositories

* [hrjp/ros:melodic_cudagl](https://hub.docker.com/layers/194399415/hrjp/ros/melodic_cudagl/images/sha256-8f0648cf2c840fefeaeb9fb624497386ecb6f9b4792b77727953477ab3a038b0?context=repo)
* [hrjp/naviton:melodic_cudagl](https://hub.docker.com/layers/176446667/hrjp/naviton/melodic_cudagl/images/sha256-811f43a5f24c163e3523d76d6611c4becf3b7f1bccda090f922b35c50f095456?context=repo)
* [hrjp/naviton:melodic_main](https://hub.docker.com/layers/180881379/hrjp/naviton/melodic_main/images/sha256-df03b10e23c2cc1cf7252e9a9df5b2ef979120269faf4ba0923217672fa6293b?context=repo)
* [hrjp/naviton:melodic_develop](https://hub.docker.com/layers/180800620/hrjp/naviton/melodic_develop/images/sha256-937945f451e4bcd5dc3ebcf7016aa0d1335ae6dbd512fbb680c3ae56bb150ef9?context=repo)

```mermaid
graph TB
  subgraph rosenv
  hrjp/ros:melodic_cudagl-->hrjp/naviton:melodic_cudagl
  end
  subgraph naviton
  hrjp/naviton:melodic_cudagl-->hrjp/naviton:melodic_main
  hrjp/naviton:melodic_cudagl-->hrjp/naviton:melodic_develop
  end
  hrjp/ros:melodic_cudagl-->|Auto docker build and push at 11 P.M.|hrjp/ros:melodic_cudagl
  hrjp/naviton:melodic_cudagl-->|Auto docker build and push at 1 A.M.|hrjp/naviton:melodic_cudagl
  hrjp/naviton:melodic_main-->|Auto docker build and push at 3 A.M.|hrjp/naviton:melodic_main
  hrjp/naviton:melodic_develop-->|Auto docker build and push at 3 A.M.|hrjp/naviton:melodic_develop
  click hrjp/ros:melodic_cudagl https://hub.docker.com/layers/194399415/hrjp/ros/melodic_cudagl/images/sha256-8f0648cf2c840fefeaeb9fb624497386ecb6f9b4792b77727953477ab3a038b0?context=repo
  click hrjp/naviton:melodic_cudagl https://hub.docker.com/layers/176446667/hrjp/naviton/melodic_cudagl/images/sha256-811f43a5f24c163e3523d76d6611c4becf3b7f1bccda090f922b35c50f095456?context=repo
  click hrjp/naviton:melodic_main https://hub.docker.com/layers/180881379/hrjp/naviton/melodic_main/images/sha256-df03b10e23c2cc1cf7252e9a9df5b2ef979120269faf4ba0923217672fa6293b?context=repo
  click hrjp/naviton:melodic_develop https://hub.docker.com/layers/180800620/hrjp/naviton/melodic_develop/images/sha256-937945f451e4bcd5dc3ebcf7016aa0d1335ae6dbd512fbb680c3ae56bb150ef9?context=repo
  click rosenv https://github.com/hrjp/rosenv
  click naviton https://github.com/hrjp/naviton
  
```



---

# Setup

```bash
git clone https://github.com/hrjp/rosenv
cd rosenv
```
ROS melodic install
```bash
./melodic_install.bash
```
Package install
```bash
./package_install.bash
```

