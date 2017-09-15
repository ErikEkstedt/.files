#!/bin/sh
#
#
#       Todo:
#           Anaconda
#           tensorflow/pytorch...
#       

# Require sudo right
if [[ $UID != 0 ]]; then
    echo "Please run this script with sudo :"
    echo "sudo $0 $*"
    exit 1
fi
# Upgrading
echo Upgrading (apt-get update/upgrade/dist-upgrade)
apt-get update
apt-get upgrade
apt-get dist-upgrade

# notify-send
add-apt-repository ppa:leolik/leolik 
apt-get update
apt-get upgrade
apt-get install libnotify-bin
pkill notify-osd

add-apt-repository ppa:nilarimogard/webupd8
apt update
apt-get install notifyosdconfig

# Install needed programs
echo Installing programs (git/tmuc and the like)
apt-get install git tmux xclip zsh feh curl unclutter vim-gtk udiskie zathura xfce4-terminal ranger -y
echo Done!

#############################################################################
echo Installing i3 and i3-gaps...
# i3 (From https://i3wm.org/docs/repositories.html)
echo Installing i3...
apt-get install i3 -y

# i3-gaps
# Dependencies
# Ubuntu (>= 14.04 LTS, <= 16.04)
echo Installing i3-gaps dependencies...
apt-get install bxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev autoconf libxcb-xrm-dev

# extra dependency
add-apt-repository ppa:aguignard/ppa
apt-get update
apt-get install libxcb-xrm-dev

# Install (https://github.com/Airblader/i3/wiki/Compiling-&-Installing)
echo Download and make i3-gaps in ~/i3-gaps...
# I want to install to ~/i3-gaps
echo Creating directory...
mkdir -p ~/i3-gaps 
cd ~/i3-gaps

# clone the repository
echo Download i3-gaps...
git clone https://www.github.com/Airblader/i3 i3-gaps
cd i3-gaps

# compile & install
echo Compile and install i3-gaps...
autoreconf --force --install
rm -rf build/
mkdir -p build && cd build/

# Disabling sanitizers is important for release versions!
# The prefix and sysconfdir are, obviously, dependent on the distribution.
../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers
make
make install
echo Finished installing i3-gaps.

##########################################################################
echo Creating my deafault directory setup...
mkdir -p ~/com_sci
mkdir -p ~/Documents/latex
mkdir -p ~/Pictures/wallpaper
mkdir -p ~/git-clones
#################################################
# TODO 
# Get .files and configs and important stuff from github.

# Programs


# Anaconda 
# TODO ...............................................

# Machine Learning frameworks
apt-get install tensorflow





