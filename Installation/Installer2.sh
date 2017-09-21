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
echo "########################################################"
echo
echo Installing pywal
sudo ~/.files/Installation/install_scripts/pywal_install

echo "########################################################"
echo
echo Installing vim plugins and color.
sudo ~/.files/Installation/install_scripts/Vim_plugin_install


echo "########################################################"
echo
echo
echo
echo Create links for config files...
cd ~/.files/Installation
./Link_maker



