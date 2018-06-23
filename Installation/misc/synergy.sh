#!/bin/bash
# Download and install synergy

echo "Install dependencies"
sudo apt-get install cmake make g++ xorg-dev libssl-dev libx11-dev libsodium-dev libgl1-mesa-glx libegl1-mesa libcurl3-dev

echo "Download synergy .deb file"
wget https://sourceforge.net/projects/synergy-stable-builds/files/v1.8.8-stable/synergy-v1.8.8-stable-Linux-i686.deb ~/Downloads -P ~/Downloads

echo "cd into ~/Downloads and install synergy"
cd ~/Downloads && sudo dpkg -i synergy-v1.8.8-stable-Linux-i686.deb -y
