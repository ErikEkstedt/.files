#!/bin/bash

Red='\033[0;31m'
Yellow='\033[1;33m'
NC='\033[0m' # No Color

printf ${Yellow}
echo

prg=fusuma
if ! [ -x "$(command -v $prg)" ]; then
	echo "Installing $prg" >&2
	echo Installation
	echo IMPORTANT: You must be a member of the input group to have permission to read the touchpad device:
	echo 'sudo gpasswd -a $USER input'
	printf ${NC}

	printf ${Yellow}
	echo YOU MUST LOG OUT AND BACK IN OR RESTART TO ASSIGN THIS GROUP!!
	echo "DID YO RESTART ETC? (y/n)"
	printf ${NC}

	read answer
	if [[ $answer == 'y' || $answer == 'Y'   ]]; then
		printf ${Yellow}
		echo 'You need libinput release 1.0 or later. Install libinput-tools:'
		echo 'sudo apt-get install libinput-tools'
		echo 'Installing Fusuma'
		printf ${NC}
		sudo apt-get install libinput-tools
		sudo apt-get install xdotool
		sudo gem install fusuma
	fi
else
	echo "$prg is already installed!" >&2
fi

echo 
echo "Linking config files:"
echo "$HOME/.files/fusuma/config.yml -> $HOME/.config/fusuma/config.yml"
ln -sf $HOME/.files/fusuma/config.yml $HOME/.config/fusuma/config.yml
