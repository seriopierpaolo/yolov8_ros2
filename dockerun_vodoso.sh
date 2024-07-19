#!/bin/bash
DOCKER_DEFAULT_ARGS=()
DOCKER_DEFAULT_ARGS+=("-it")
DOCKER_DEFAULT_ARGS+=("-e DISPLAY")
DOCKER_DEFAULT_ARGS+=("-v $XAUTH:$XAUTH")
DOCKER_DEFAULT_ARGS+=("-e XAUTHORITY=$XAUTH")
DOCKER_DEFAULT_ARGS+=("--privileged")
DOCKER_DEFAULT_ARGS+=("-e TERM=xterm-256color")
DOCKER_DEFAULT_ARGS+=("-e ROS_DOMAIN_ID=${ROS_DOMAIN_ID}")
DOCKER_DEFAULT_ARGS+=("-e CYCLONEDDS_URI=file:///home/cyclonedds.xml")
DOCKER_DEFAULT_ARGS+=("--env="QT_X11_NO_MITSHM=1"")
DOCKER_DEFAULT_ARGS+=("--env="NVIDIA_VISIBLE_DEVICES=all"")
DOCKER_DEFAULT_ARGS+=("--env="NVIDIA_DRIVER_CAPABILITIES=all"")
DOCKER_DEFAULT_ARGS+=("--env="DISPLAY=$DISPLAY"")
DOCKER_DEFAULT_ARGS+=("-v /tmp/.X11-unix:/tmp/.X11-unix")
DOCKER_DEFAULT_ARGS+=("-v $HOME/cyclonedds.xml:/home/cyclonedds.xml")
DOCKER_DEFAULT_ARGS+=("-v /home/pierpaolo/workspace/vodoso/:/opt/ros_ws/src/vodoso/")
DOCKER_DEFAULT_ARGS+=("--network host")
DOCKER_DEFAULT_ARGS+=("--gpus all")
DOCKER_DEFAULT_ARGS+=("--runtime nvidia")
DOCKER_DEFAULT_ARGS+=("--device=/")
DOCKER_DEFAULT_ARGS+=("--group-add video")
docker run ${DOCKER_DEFAULT_ARGS[@]} --name vodoso vodoso_humble  bash ;