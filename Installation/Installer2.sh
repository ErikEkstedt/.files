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

echo "########################################################"
echo "########################################################"
echo "########################################################"
echo "########################################################"
echo "########################################################"
echo
echo
echo
echo Compile and install i3-gaps...
cd i3-gaps
autoreconf --force --install
rm -rf build/
mkdir -p build && cd build/

# Disabling sanitizers is important for release versions!
# The prefix and sysconfdir are, obviously, dependent on the distribution.
../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers
make
make install
echo "########################################################"
echo Finished installing i3-gaps.
echo "########################################################"
echo
echo "########################################################"
echo "########################################################"
echo "########################################################"
echo RESTART COMPUTER "(in 10 seconds)"
sleep 10
sudo shutdown -r 0


