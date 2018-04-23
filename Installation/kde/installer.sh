#!/bin/bash

# 1. Upgrade Plasma (for ubuntu 17.10 at least)
sudo add-apt-repository ppa:kubuntu-ppa/backports
sudo apt update -yyqq 
sudo apt full-upgrade

# 2. Terminal apps, important tools.
sudo apt install -yyqq \
	git tmux xclip xsel zsh feh curl zathura\
	ranger wget autoconf xdotool 

sudo apt-get install texlive-full -y
latexm
wakeonlan
unclutter

# 3. Set up Zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
sudo -u erik chsh -s $(which zsh)


# 4. Konsole



# 5. Yakuake





