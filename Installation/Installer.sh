#!/bin/bash
# Require sudo right
if [[ $UID != 0 ]]; then
    echo "Please run this script with sudo :"
    echo "sudo $0 $*"
    exit 1
fi

# Upgrading
echo Upgrading "(apt-get update/upgrade/dist-upgrade)"
echo "########################################################"
echo "########################################################"
echo "########################################################"
apt-get update
echo "########################################################"
echo "########################################################"
echo "########################################################"
apt-get upgrade -y
echo "########################################################"
echo "########################################################"
echo "########################################################"
apt-get dist-upgrade -y

# notify-send, working version (otherwise the -t flag did not do anything)
add-apt-repository ppa:leolik/leolik -y
apt-get update
apt-get upgrade -y
apt-get install libnotify-bin -y
pkill notify-osd

# (some extra functions recommended in solition to the above.
add-apt-repository ppa:nilarimogard/webupd8 -y
apt update
apt-get install notifyosdconfig -y

# Install needed programs
echo "########################################################"
echo "########################################################"
echo "########################################################"
echo "########################################################"
echo
echo Installing programs "(git/tmux and the like...)"
apt-get install git tmux xclip zsh feh curl unclutter vim-gtk udiskie zathura rxvt-unicode-256color ranger wget curl autoconf gnome-session-bin python-pip latexmk -y

echo Done!
echo "########################################################"
echo 

echo Installing chrome...
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
dpkg -i --force-depends google-chrome-stable_current_amd64.deb
apt-get install -f -y
echo "########################################################"
echo Done!

echo "########################################################"
echo 
echo Cloning Git Repositories
echo Cloning .files...
cd  
git clone https://github.com/ErikEkstedt/.files.git

echo "########################################################"
echo
echo Cloning Robot Project...
cd; mkdir com_sci; cd com_sci
git clone https://github.com/ErikEkstedt/Robot.git

echo "########################################################"
echo

############################################################################
echo "########################################################"
echo "########################################################"
echo "########################################################"
echo "########################################################"
echo "########################################################"
echo Installing i3 and i3-gaps...
# Perahps add dependency installation for i3
# i3 (From https://i3wm.org/docs/repositories.html)
echo Installing i3...
apt-get install i3 -y

echo "################################################################"
echo Done with i3.
echo Restarting...
echo "########################################################"
echo sleep 3 sec
shutdown -r 0


