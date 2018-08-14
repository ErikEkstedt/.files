#!/bin/bash

prg=fusuma
if ! [ -x "$(command -v $prg)" ]; then
	echo "1. Grant permission to read the touchpad device"
	echo "IMPORTANT: You MUST be a member of the INPUT group to read touchpad by Fusuma."
	echo "-> sudo gpasswd -a $USER input? (y/n)"
	read answer
	if [[ $answer == 'y' || $answer == 'Y'   ]]; then
		sudo gpasswd -a $USER input
		echo "Then, You MUST LOGOUT/LOGIN or REBOOT to assign this group."

		echo "Restart now? (y/n)"
		read answer
		if [[ $answer == 'y' || $answer == 'Y'   ]]; then
			sudo reboot
		fi
	fi

	echo "2. Install libinput-tools. You need libinput release 1.0 or later."
	echo "Install libinput-tools? (y/n)"
	read answer
	if [[ $answer == 'y' || $answer == 'Y'   ]]; then
		sudo apt-get install libinput-tools
	fi

	echo "3. Install Fusuma? (y/n)"
	read answer
	if [[ $answer == 'y' || $answer == 'Y'   ]]; then
		sudo gem install fusuma
	fi

else
	echo "$prg is already installed!" >&2
fi

echo "Link configs? (y/n)"
read answer
if [[ $answer == 'y' || $answer == 'Y'   ]]; then
	echo "Linking config files:"
	echo "$HOME/.files/fusuma/config.yml -> $HOME/.config/fusuma/config.yml"
	mkdir -p $HOME/.config/fusuma
	ln -sf $HOME/.files/fusuma/config.yml $HOME/.config/fusuma/config.yml
fi
