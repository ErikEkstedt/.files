#/bin/bash


url=https://github.com/sharkdp/bat/releases/download/v0.9.0/bat-musl_0.9.0_amd64.deb
target=/tmp/bat.deb

echo "Download bat (v 0.9.0)"
wget $url -O $target 

echo "dpkg install"
sudo dpkg -i $target 

echo "Removing $target"
rm $target
