ARG ROS_DISTRO

FROM ros:${ROS_DISTRO}-ros-core

RUN chmod 1777 /tmp

RUN apt-get update && apt-get install -y --no-install-recommends \
    python3-colcon-common-extensions \
    ros-humble-rosbag2 \
    ros-humble-rosbridge-msgs \
    build-essential \
    ros-humble-control-msgs \
    ros-humble-tf2-msgs \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /colcon_ws/src

COPY bag_recorder bag_recorder
COPY vortex/ros-vortex/DynamixelSDK/dynamixel_sdk_custom_interfaces dynamixel_sdk_custom_interfaces
COPY vortex/ros-vortex/vortex_interfaces vortex_interfaces
COPY px4_msgs px4_msgs
COPY zed-ros2-interfaces zed-ros2-interfaces

WORKDIR /colcon_ws

RUN . /opt/ros/${ROS_DISTRO}/setup.sh && colcon build --symlink-install --event-handlers console_direct+

WORKDIR /

COPY ros_entrypoint.sh .

RUN echo 'alias build="colcon build --symlink-install  --event-handlers console_direct+"' >> ~/.bashrc
RUN echo 'alias run="ros2 run bag_recorder bag_recorder"' >> ~/.bashrc
