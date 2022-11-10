docker run -it --rm --workdir /colcon_ws  --volume $(pwd)/bags:/bags --volume $(pwd)/bag_recorder:/colcon_ws/src/bag_recorder ghcr.io/rosblox/ros-bag-recorder:humble
