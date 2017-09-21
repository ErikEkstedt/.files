#!/bin/bash
# Require sudo right
if [[ $UID != 0 ]]; then
    echo "Please run this script with sudo :"
    echo "sudo $0 $*"
    exit 1
fi
echo "########################################################"
echo "########################################################"
echo "########################################################"
echo "########################################################"
echo "########################################################"
echo
echo Installing vim plugins and color.
sudo ~/.files/Installation/install_scripts/Vim_plugin_install


echo "########################################################"
echo
echo Setting new shell to Zsh
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
chsh -s `which zsh`

# setting background image later implemented by i3
cp ~/.files/Wallpaper.png ~/.config/wall.png
# Upgrading
echo Upgrading "(apt-get update/upgrade/dist-upgrade)"
apt-get update
apt-get upgrade -y
apt-get dist-upgrade -y

echo "########################################################"
echo
echo
echo Downloading Anaconda
cd ~
wget https://repo.continuum.io/archive/Anaconda3-4.4.0-Linux-x86_64.sh
chmod +x Anaconda3-4.4.0-Linux-x86_64.sh
sudo -u erik bash -c './Anaconda3-4.4.0-Linux-x86_64.sh'


echo "########################################################"
echo
echo Installing pywal
sudo ~/.files/Installation/install_scripts/pywal_install

echo "########################################################"
echo "########################################################"
echo "########################################################"
echo "########################################################"
echo "########################################################"
echo Restart in 10 sec
sleep 10
shutdown -r 0
