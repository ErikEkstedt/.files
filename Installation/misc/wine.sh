#!/bin/bash

# Installing wine
# https://wiki.winehq.org/Ubuntu

# If your system is 64 bit, enable 32 bit architecture (if you haven't already):
sudo dpkg --add-architecture i386

# For Ubuntu versions prior to 18.10:
# Add the repository:

wget -nc https://dl.winehq.org/wine-builds/Release.key
sudo apt-key add Release.key
sudo apt-add-repository https://dl.winehq.org/wine-builds/ubuntu/

# Update and install
sudo apt-get update
sudo apt-get install --install-recommends winehq-stable
