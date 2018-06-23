#!/bin/bash
# Download and install synergy

echo "Download synergy .deb file"
wget https://sourceforge.net/projects/synergy-stable-builds/files/v1.8.8-stable/synergy-v1.8.8-stable-Linux-i686.deb ~/Downloads -P ~/Downloads -q

echo "cd into ~/Downloads and install synergy"
cd ~/Downloads && sudo dpkg -i synergy-v1.8.8-stable-Linux-i686.deb -y
