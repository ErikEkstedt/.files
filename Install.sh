#!/bin/bash

######################################################################
# Installers
# 1. Download dotfiles: https://github.com/ErikEkstedt/.files
# 2. Run ~/.files/Install.sh (this file)
######################################################################

miscDir=$HOME/.files/Installation/misc
DOTFiles=$HOME/.files

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
            ranger wget autoconf xdotool gcc build-essential
        ;;
    FreeBSD)
        # commands for FreeBSD go here
        ;;
esac

# Conda
prg="CONDA"
printSection $prg
echo "Do you wish to install $prg? (y/n)"
read answer
if [[ $answer == 'y' || $answer == 'Y'   ]]; then
	sh $miscDir/conda.sh
fi

# Node & npm
prg="NODE & NPM"
printSection $prg
echo "Do you wish to install $prg? (y/n)"
read answer
if [[ $answer == 'y' || $answer == 'Y'   ]]; then
	sh $miscDir/nodeNpm.sh
fi

# Nvim
prg="NEOVIM"
printSection $prg
echo "Do you wish to install $prg? (y/n)"
read answer
if [[ $answer == 'y' || $answer == 'Y'   ]]; then
	sh ~/.files/nvim/install.sh
fi

# fzf
prg="FZF"
printSection $prg
echo "Do you wish to install $prg? (y/n)"
read answer
if [[ $answer == 'y' || $answer == 'Y'   ]]; then
	sh $miscDir/fzf.sh
fi

# Ranger
prg="RANGER"
printSection $prg
echo "Do you wish to install $prg? (y/n)"
read answer
if [[ $answer == 'y' || $answer == 'Y'   ]]; then
	sh ~/.files/ranger/install.sh
fi

# Synergy
prg="SYNERGY"
printSection $prg
echo "Do you wish to install $prg? (y/n)"
read answer
if [[ $answer == 'y' || $answer == 'Y'   ]]; then
	sh $miscDir/synergy.sh
fi


# Set up Zsh
prg="ZSH"
printSection $prg
echo "Do you wish to install $prg? (y/n)"
read answer
if [[ $answer == 'y' || $answer == 'Y'   ]]; then
	sh ~/.files/zsh/install.sh
fi

# Nerdfonts
echo "Do you wish to install Fonts? (y/n)"
read answer
if [[ $answer == 'y' || $answer == 'Y'   ]]; then
	sh $DOTFiles/fonts/install.sh
fi

# Latex
prg=Latex
printSection $prg
echo "Do you wish to install $prg? (y/n)"
read answer
if [[ $answer == 'y' || $answer == 'Y'   ]]; then
	sh $miscDir/latex.sh
fi

# Misc Links
printSection "Miscellaneous links"
sh $miscDir/misc-links.sh
