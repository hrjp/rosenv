

FROM hrjp/ros:melodic_cudagl

RUN git clone https://github.com/hrjp/rosenv
RUN ./rosenv/package_install.bash && \
    ./rosenv/gazebo_update.bash && \
    ./rosenv/gtsam_install.bash 
RUN rm -rf /home/rosenv
    

WORKDIR /home/catkin_ws
