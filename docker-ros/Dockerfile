FROM ubuntu:22.04

WORKDIR /root
ARG DEBIAN_FRONTEND=noninteractive

ENV TZ=Asia/Shanghai
ENV ROS_DISTRO=humble
ENV arch arm64
ENV DIST jammy
# arch=$(dpkg --print-architecture)
# dists=$(lsb_release -cs)

# === COPY repository key ===
COPY rosdistro/ros.key /usr/share/keyrings/ros-archive-keyring.gpg

# === BASIC TOOL AND REPOSITORY ===
RUN apt update && \
	apt install -y software-properties-common curl && \
	add-apt-repository universe


# COPY ros2-linux /root/ros2_${ROS_DISTRO}/ros2-linux
RUN mkdir -p /root/ros2_${ROS_DISTRO}/ && \
	cd /root/ros2_${ROS_DISTRO}/
	# curl -sSLO https://github.com/ros2/ros2/releases/download/release-humble-20220523/ros2-humble-20220523-linux-jammy-arm64.tar.bz2 && \
	# tar -jxvf ros2-humble-20220523-linux-jammy-arm64.tar.bz2

# === COPY ROS2 system ===
ADD ros2-${ROS_DISTRO}-20220523-linux-jammy-${arch}.tar.bz2 /root/ros2_${ROS_DISTRO}/

# === ROS2 REPOSITORY ===
RUN echo "deb [arch=${arch} signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu jammy main" > /etc/apt/sources.list.d/ros2.list

# RUN apt update
RUN apt update && apt install -y python3-rosdep

# COPY ./rosdistro/rosdep/sources.list.d/20-default.list /etc/ros/rosdep/sources.list.d/
COPY ./rosdistro /rosdistro

# /etc/ros/rosdep/sources.list.d/20-default.list
# /root/.ros/rosdep/sources.cache/index
# /rosdistro/rosdep/sources.list.d/20-default.list
# /rosdistro/scripts/sync-ros2-gbp-devel-branch.py
# /usr/lib/python3/dist-packages/rosdep2/rep3.py
# /usr/lib/python3/dist-packages/rosdep2/sources_list.py
# /usr/lib/python3/dist-packages/rosdistro/__init__.py
RUN sed -i "s@https://raw.githubusercontent.com/ros/rosdistro/master@file:///rosdistro@g" `grep raw.githubusercontent.com/ros/rosdistro/master -rIl /usr/lib/python3/dist-packages/` \
	&& sed -i "s@https://raw.githubusercontent.com/ros/rosdistro/master@file:///rosdistro@g" `grep raw.githubusercontent.com/ros/rosdistro/master -rIl /rosdistro/scripts/` \
	&& sed -i "s@https://raw.githubusercontent.com/ros/rosdistro/master@file:///rosdistro@g" `grep raw.githubusercontent.com/ros/rosdistro/master -rIl /rosdistro/rosdep/sources.list.d/` \
	&& sed -i "s@https://raw.githubusercontent.com/ros/rosdistro/master@file:///rosdistro@g" `grep raw.githubusercontent.com/ros/rosdistro/master -rIl /root/.ros/rosdep/sources.cache/` \
	&& sed -i "s@https://raw.githubusercontent.com/ros/rosdistro/master@file:///rosdistro@g" `grep raw.githubusercontent.com/ros/rosdistro/master -rIl /etc/ros/rosdep/sources.list.d/`
# RUN sed -i "s@https://raw.githubusercontent.com/ros/rosdistro/master@file:///rosdistro@g" `grep raw.githubusercontent.com/ros/rosdistro/master -rIl /`

RUN rosdep init && \
	rosdep update && \
	apt upgrade -y

RUN apt install -y libpython3-dev python3-pip


RUN sh -c 'echo "deb http://packages.osrfoundation.org/gazebo/ubuntu-stable `lsb_release -cs` main" > /etc/apt/sources.list.d/gazebo-stable.list' && \
	curl -o - http://packages.osrfoundation.org/gazebo.key | sudo apt-key add - && \
	apt update


RUN rosdep install -y --from-paths /root/ros2_${ROS_DISTRO}/ros2-linux/share --ignore-src -y --skip-keys "cyclonedds fastcdr fastrtps rti-connext-dds-6.0.1 urdfdom_headers"

# === CLEAN & ENV setup ===
# RUN . /root/ros2_${ROS_DISTRO}/ros2-linux/setup.bash
RUN echo "source ~/ros2_humble/ros2-linux/setup.bash" >> ~/.bashrc && \
	echo "export ROS_DOMAIN_ID=1" >> ~/.bashrc
