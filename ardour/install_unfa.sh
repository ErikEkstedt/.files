#!/bin/bash

# 1. go to website for instructions
#    https://kxstudio.linuxaudio.org/Repositories

# This is instructions from website

# Install required dependencies if needed
sudo apt-get install apt-transport-https software-properties-common wget

# Download package file
kxstudio=https://launchpad.net/~kxstudio-debian/
kxstudio+=+archive/kxstudio/+files/
kxstudio+=kxstudio-repos-gcc5_9.5.1~kxstudio3_all.deb
wget $kxstudio

# Install it
sudo dpkg -i kxstudio-repos_9.5.1~kxstudio3_all.deb

# delete Ä deb
rm *.deb

# If you're using a system newer or equal to Debian 9 (Stretch) or Ubuntu 16.04
# (Xenial) you'll also need to enable GCC5 packages.  You can do so by
# installing this deb file - kxstudio-repos-gcc5.deb, or manually by running
# this: 

# Install required dependencies if needed
sudo apt-get install libglibmm-2.4-1v5
# Download package file
wget https://launchpad.net/~kxstudio-debian/+archive/kxstudio/+files/kxstudio-repos-gcc5_9.5.1~kxstudio3_all.deb
# Install it
sudo dpkg -i kxstudio-repos-gcc5_9.5.1~kxstudio3_all.deb

sudo apt install ardour

# limited memory size
sudo -i 
ulimit -l unlimited
logout

sudo apt install zynaddsubfx

