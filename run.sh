docker run -it \
--net=host \
--pid=host \
--ipc=host  \
--rm --workdir /colcon_ws  --volume /home/${USER}/bags:/bags --volume $(pwd)/bag_recorder:/colcon_ws/src/bag_recorder ghcr.io/rosblox/ros-bag-recorder:humble


