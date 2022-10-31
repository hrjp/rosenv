# YOLOX ROS noetic enviroment


FROM hrjp/ros:melodic_cudagl

ENV ROS_DISTRO=melodic

RUN apt update && \
    apt install -y ros-melodic-geodesy ros-melodic-pcl-ros ros-melodic-nmea-msgs ros-melodic-libg2o
RUN git clone https://github.com/hrjp/rosenv &&\    
    ./rosenv/gtsam_install.bash 
RUN rm -rf /home/rosenv

RUN cd /home/catkin_ws/src &&\
    git clone https://github.com/koide3/ndt_omp.git -b melodic &&\
    git clone https://github.com/SMRT-AIST/fast_gicp.git --recursive &&\
    git clone https://github.com/hrjp/hdl_graph_slam.git &&\
    git clone https://github.com/hrjp/LeGO-LOAM.git &&\
    catkin build

RUN apt clean

WORKDIR /home/catkin_ws
