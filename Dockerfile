ARG ROS_DISTRO

FROM ros:${ROS_DISTRO}-ros-core

RUN apt-get update && apt-get install -y --no-install-recommends \
    python3-colcon-common-extensions \
    ros-humble-rosbag2 \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /colcon_ws/src

COPY ./bag_recorder bag_recorder

WORKDIR /colcon_ws

RUN . /opt/ros/${ROS_DISTRO}/setup.sh && colcon build --symlink-install

WORKDIR /

COPY ros_entrypoint.sh .

RUN echo 'alias build="colcon build --symlink-install  --event-handlers console_direct+"' >> ~/.bashrc
RUN echo 'alias run="ros2 run bag_recorder bag_recorder"' >> ~/.bashrc
