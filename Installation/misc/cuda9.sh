#!/bin/bash

# https://askubuntu.com/questions/967332/how-can-i-install-cuda-9-on-ubuntu-17-10

# Dependencies
sudo apt-get install g++ freeglut3-dev build-essential libx11-dev libxmu-dev libxi-dev libglu1-mesa libglu1-mesa-dev

# Install correct gcc/g++ 
sudo apt install gcc-6
sudo apt install g++-6

# Download (latest?) runfile (local) from Nvidia
wget https://developer.nvidia.com/compute/cuda/9.0/Prod/local_installers/cuda_9.0.176_384.81_linux-run

# Make the downloaded file executable and run it using sudo:
chmod +x cuda_9.0.176_384.81_linux-run 
sudo ./cuda_9.0.176_384.81_linux-run --override
