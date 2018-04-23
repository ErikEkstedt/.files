#!/bin/bash

# 1. Upgrade Plasma (for ubuntu 17.10 at least)
echo "Adds kubuntu backports and updates system"
sudo add-apt-repository ppa:kubuntu-ppa/backports
sudo apt update -yyqq 
sudo apt full-upgrade

# 2. Terminal apps, important tools.
echo "Installing terminal tools"
sudo apt install -yyqq \
	git tmux xclip xsel zsh feh curl zathura\
	ranger wget autoconf xdotool 

# 3. Set up Zsh
echo "Set up zsh"
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
sudo -u erik chsh -s $(which zsh)


# 4. Node & npm
#	Node install/upgrade (exists on ubuntu)
#   Also installs npm
#   https://www.sitepoint.com/beginners-guide-node-package-manager/
echo "Node & npm"
curl -sL https://deb.nodesource.com/setup_9.x | sudo -E bash -
sudo apt-get install -y nodejs

# update npm
npm install npm@latest -g

# change global modules directory and reinstall npm there
cd ~ && mkdir .node_modules_global
npm config set prefix=$HOME/.node_modules_global
npm install npm --global


# Spaceship theme for zsh
npm install -g spaceship-zsh-theme

# 5. Nerdfonts

echo "Cloing nerdfonts repo and installing fonts"
echo "Notice: This step takes some time..."
cd ~ && git clone --depth 1 https://github.com/ryanoasis/nerd-fonts.git
cd nerd-fonts && ./install.sh



