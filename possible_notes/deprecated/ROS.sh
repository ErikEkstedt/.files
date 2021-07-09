#!/bin/bash

# http://wiki.ros.org/kinetic/Installation/Ubuntu


# Setup your sources.list
# Setup your computer to accept software from packages.ros.org.
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'


# Set up your keys
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116


# Installation
sudo apt-get update
sudo apt-get install ros-kinetic-desktop-full -yy


#If you use zsh instead of bash you need to run the following commands to set up your shell:
echo "source /opt/ros/kinetic/setup.zsh" >> ~/.zshrc
source ~/.zshrc


# run
sudo rosdep init


# update (also asks (at least the first time))
rosdep update


# Installing dependencies for building ROS packages
# and install the tool: rosinstall.

sudo apt-get install python-rosinstall python-rosinstall-generator python-wstool build-essential -yy
