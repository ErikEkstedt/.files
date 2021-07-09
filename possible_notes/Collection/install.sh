#!/bin/bash


echo "Install Obs-studio? (y/n)"
read answer
if [[ $answer == 'y' || $answer == 'Y'   ]]; then
	# Install OBS-studio
	case Linux in
		Darwin)
			# commands for OS X go here
			echo "Go to this website"
			echo "https://github.com/obsproject/obs-studio/releases"
			;;
		Linux)
			# commands for Linux go here
			sudo add-apt-repository ppa:obsproject/obs-studio
			sudo apt update
			sudo apt install obs-studio
			;;
	esac
fi
