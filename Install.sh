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

case `uname` in
  Darwin)
    # commands for OS X go here

	# Terminal apps, important tools.
	printSection "HomeBrew"
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

	printSection "TERMINAL MISC"
	brew install git \ 
		wget \
		curl \ 
		tmux \ 
		zsh \ 
		zathura \
		ranger \ 
  ;;
  Linux)
    # commands for Linux go here
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

	if [[ $OS == "ubuntu" && $VERSION == "17.10" ]]; then
		# Add Kubuntu backports Plasma for ubuntu 17.10
		printSection "17.10 Backports kubuntu"
		echo "Adds kubuntu backports and updates system"
		sudo add-apt-repository ppa:kubuntu-ppa/backports
		sudo apt update -yyqq
		sudo apt full-upgrade
	fi

	# Terminal apps, important tools.
	printSection "TERMINAL MISC"
	sudo apt install -yyqq \
		git tmux xclip xsel zsh feh curl zathura \
		ranger wget autoconf xdotool gcc
  ;;
  FreeBSD)
    # commands for FreeBSD go here
  ;;
esac


# Nvim
printSection "NEOVIM"
sh ~/.files/nvim/install.sh

# fzf
printSection "FZF"
sh $miscDir/fzf.sh

# Node & npm
printSection "NODE & NPM"
sh $miscDir/nodeNpm.sh

# Set up Zsh
printSection "ZSH"
sh ~/.files/zsh/install.sh

# Ranger
printSection "RANGER"
sh ~/.files/ranger/install.sh

# Nerdfonts
printSection "NERDFONTS"
sh $miscDir/nerdfonts.sh

# Conda
printSection "CONDA"
sh $miscDir/conda.sh

# Synergy
printSection "SYNERGY"
sh $miscDir/synergy.sh

# Misc Links
printSection "Miscellaneous links"
sh $miscDir/misc-links.sh

# Latex
prg=Latex
printSection $prg
echo "Do you wish to install $prg? (y/n)"
read answer
if [[ $answer == 'y' || $answer == 'Y'   ]]; then
	sh $miscDir/latex.sh
fi
