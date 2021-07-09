#!/bin/bash

case Darwin in
	Darwin)
		echo "Brew Tap & Install ChunkWM? (y/n)"
		read answer
		if [[ $answer == 'y' || $answer == 'Y'   ]]; then
			# Clone tap
			brew tap crisidev/homebrew-chunkwm

			# Install latest stable version
			brew install chunkwm

			# Install skhd
			brew install koekeishiya/formulae/skhd
		fi

		echo "Linking chunkwmrc and skhdrc file"
		echo "~/.files/chunkwm/chunkwmrc -> ~/.chunkwmrc"
		ln -sf ~/.files/chunkwm/chunkwmrc ~/.chunkwmrc

		echo "~/.files/chunkwm/skhd/skhdrc -> ~/.skhdrc"
		ln -sh ~/.files/chunkwm/skhd/skhdrc ~/.skhdrc
		;;
	Linux)
		# commands for Linux go here
		;;
esac
