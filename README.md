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

