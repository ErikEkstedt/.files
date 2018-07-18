#!/bin/bash

# https://askubuntu.com/questions/967332/how-can-i-install-cuda-9-on-ubuntu-17-10

# Dependencies
# sudo apt-get install g++ freeglut3-dev build-essential libx11-dev libxmu-dev libxi-dev libglu1-mesa libglu1-mesa-dev

# # Install correct gcc/g++ 
# sudo apt install gcc-6
# sudo apt install g++-6

# # Download (latest?) runfile (local) from Nvidia
# wget https://developer.nvidia.com/compute/cuda/9.0/Prod/local_installers/cuda_9.0.176_384.81_linux-run

# # Make the downloaded file executable and run it using sudo:
# chmod +x cuda_9.0.176_384.81_linux-run 
# sudo ./cuda_9.0.176_384.81_linux-run --override

echo "CUDA"
echo "Add repository and install drivers? (y/n)"
read answer
if [[ $answer == 'y' || $answer == 'Y'   ]]; then
	echo "add-apt-repository ppa:graphics-drivers/ppa"
	sudo add-apt-repository ppa:graphics-drivers/ppa
	echo "Update"
	sudo apt update
	echo "Installing ubuntu-drivers..."
	sudo ubuntu-drivers autoinstall
fi

echo "Reboot now? (y/n)"
read answer
if [[ $answer == 'y' || $answer == 'Y'   ]]; then
	sudo reboot
fi

echo "Install nvidia-cuda-toolkit gcc-6? (y/n)"
read answer
if [[ $answer == 'y' || $answer == 'Y'   ]]; then
	sudo apt install nvidia-cuda-toolkit gcc-6
	echo "\n\n\n\n\nNVCC:"
	nvcc --version
fi
