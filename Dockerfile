# Use the ROS2 Humble base image
FROM ros:humble-perception-jammy

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Install necessary dependencies
RUN apt-get update && apt-get install -y \
    python3-pip \
    python3-colcon-common-extensions \
    python3-rosdep \
    python3-vcstool \ 
    python3.10-venv \  
    wget \
    git \
    vim \
    libopencv-dev \
    && rm -rf /var/lib/apt/lists/*



# Upgrade pip
RUN pip install --upgrade pip

# Install additional Python dependencies
RUN pip install \
    Cython \
    opencv-python \
    torch \
    torchvision \
    numpy \
    pyrealsense2

# Set up the workspace
WORKDIR /opt/ros_ws
RUN mkdir -p src

# Initialize rosdep if not already initialized
RUN if [ ! -f /etc/ros/rosdep/sources.list.d/20-default.list ]; then rosdep init; fi
RUN rosdep update

# Install ROS2 dependencies
RUN rosdep install --from-paths src --ignore-src -r -y


# Set entrypoint
ENTRYPOINT ["/bin/bash", "-c"]

