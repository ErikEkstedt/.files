#!/bin/bash
#
#       Todo:
#           Anaconda
#           tensorflow/pytorch...
#       ML:
#           pip tensorflow torch
#
# Require sudo right

if [[ $UID != 0 ]]; then
    echo "Please run this script with sudo :"
    echo "sudo $0 $*"
    exit 1
fi

# Upgrading
echo Upgrading "(apt-get update/upgrade/dist-upgrade)"
apt-get update
apt-get upgrade -y
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
echo Cloning Latex files...
cd ~/Documents
git clone https://github.com/ErikEkstedt/LatexDocs.git

echo "########################################################"
echo
echo Cloning Robot Project...
cd; mkdir com_sci; cd com_sci
git clone https://github.com/ErikEkstedt/Robot.git

echo "########################################################"
echo 

############################################################################

echo "########################################################"
echo Installing i3 and i3-gaps...
# Perahps add dependency installation for i3
# i3 (From https://i3wm.org/docs/repositories.html)
echo Installing i3...
apt-get install i3 -y

# i3-gaps
# Dependencies
# Ubuntu (>= 14.04 LTS, <= 16.04)

echo "########################################################"
echo
echo
echo
echo Installing i3-gaps dependencies...
apt-get install libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev autoconf libxcb-xrm-dev -y

# extra dependency
add-apt-repository ppa:aguignard/ppa -y
apt-get update
apt-get install libxcb-xrm-dev -y

# Install (https://github.com/Airblader/i3/wiki/Compiling-&-Installing)
echo Download and make i3-gaps in ~/i3-gaps...
echo Download i3-gaps...
cd ~
git clone https://www.github.com/Airblader/i3 i3-gaps
cd i3-gaps

echo "########################################################"
echo
echo
echo
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

echo "########################################################"
echo
echo
echo
echo Downloading Anaconda
cd ~
wget https://repo.continuum.io/archive/Anaconda3-4.4.0-Linux-x86_64.sh
chmod +x Anaconda3-4.4.0-Linux-x86_64.sh
sudo -u erik bash -c './Anaconda3-4.4.0-Linux-x86_64.sh'

pip install setuptools

echo Setting new shell to Zsh
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
chsh -s `which zsh`

# setting background image later implemented by i3
cp ~/.files/Wallpaper.png ~/.config/wall.png

echo "########################################################"
echo
echo "########################################################"
echo
echo "########################################################"
echo
echo "########################################################"
echo
echo RESTART COMPUTER "(in 10 seconds)"
sudo shutdown -r 10


