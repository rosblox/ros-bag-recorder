ARG ROS_DISTRO=humble

FROM ros:${ROS_DISTRO}-ros-core

RUN apt-get update && apt-get install -y --no-install-recommends \
    ros-humble-rosbag2 \
    ros-humble-rosbag2-compression \
    ros-humble-rosbag2-storage-mcap \
    ros-humble-rosbag2-transport \
    ros-humble-rosbridge-msgs \
    build-essential \
    ros-humble-control-msgs \
    ros-humble-tf2-msgs \
    && rm -rf /var/lib/apt/lists/*

COPY ros_entrypoint.sh .

RUN echo 'source /opt/ros/humble/setup.bash; echo UID: $UID; echo ROS_DOMAIN_ID: $ROS_DOMAIN_ID; cd /bags; ros2 bag record -s mcap --max-bag-size 1000000000 -a' >> /run.sh && chmod +x /run.sh
RUN echo 'alias run="su - ros --whitelist-environment=\"ROS_DOMAIN_ID\" /run.sh"' >> /etc/bash.bashrc
