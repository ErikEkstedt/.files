#!/bin/bash

######################################################################
# Installers
# 1. Download dotfiles: https://github.com/ErikEkstedt/.files
# 2. Run ~/.files/Install.sh (this file)
######################################################################

miscDir=./Installation/misc

# Colors
Red='\033[0;31m'
Yellow='\033[1;33m'
NC='\033[0m' # No Color

function printSection() {
	printf "${Yellow}"
	echo "-----------------------------------------------------"
	printf "$1"
	printf "${NC}\n\n"
}

# Check what type of config
dist=$(lsb_release -is)  # Ubuntu
release=$(lsb_release -rs)  # 17.10, 18.04
OS=$(awk '/DISTRIB_ID=/' /etc/*-release | sed 's/DISTRIB_ID=//' | tr '[:upper:]' '[:lower:]')
ARCH=$(uname -m | sed 's/x86_//;s/i[3-6]86/32/')
VERSION=$(awk '/DISTRIB_RELEASE=/' /etc/*-release | sed 's/DISTRIB_RELEASE=//' | sed 's/[.]0/./')

printSection "OS Information"
printf "${Yellow}Distribution:${NC} $dist\n"
printf "${Yellow}OS:${NC} $OS\n"
printf "${Yellow}version:${NC} $VERSION\n"
printf "${Yellow}ARCH:${NC} $ARCH\n"

# 1. Upgrade Plasma (for ubuntu 17.10 at least)
printSection "17.10 Backports kubuntu"
if [[ $OS == "ubuntu" && $VERSION == "17.10" ]]; then
	echo "Adds kubuntu backports and updates system"
	sudo add-apt-repository ppa:kubuntu-ppa/backports
	sudo apt update -yyqq
	sudo apt full-upgrade
fi

# Terminal apps, important tools.
printSection "TERMINAL MISC"
sudo apt install -yyqq \
	git tmux xclip xsel zsh feh curl zathura \
	ranger wget autoconf xdotool

# Nvim
printSection "NEOVIM"
sudo ~/.files/nvim/install.sh

# fzf
printSection "FZF"
sudo $miscDir/fzf.sh

# Node & npm
printSection "NODE & NPM"
sudo $miscDir/nodeNpm.sh

# Set up Zsh
printSection "ZSH"
sudo ~/.files/zsh/install.sh

# Ranger
printSection "RANGER"
sudo ~/.files/ranger/install.sh

# Nerdfonts
printSection "NERDFONTS"
sudo $miscDir/nerdfonts.sh

# Conda
printSection "CONDA"
sudo $miscDir/conda.sh

# Synergy
printSection "SYNERGY"
sudo $miscDir/synergy.sh

# Misc Links
printSection "Miscellaneous links"
sudo $miscDir/misc-links.sh

# Latex
prg=Latex
printSection $prg
echo "Do you wish to install $prg? (y/n)"
read answer
if [[ $answer == 'y' || $answer == 'Y'   ]]; then
	sudo $miscDir/latex.sh
fi
