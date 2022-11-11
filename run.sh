docker run -it --net=host --ipc=host --pid=host --rm --workdir /colcon_ws  --volume $(pwd)/bags:/bags --volume $(pwd)/bag_recorder:/colcon_ws/src/bag_recorder ghcr.io/rosblox/ros-bag-recorder:humble
