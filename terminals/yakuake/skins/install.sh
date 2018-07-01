#!/bin/bash



prg=yakuake
if ! [ -x "$(command -v $prg)" ]; then
	echo "Installing $prg"
	sudo apt install yakuake
else
	echo "$prg already installed"
fi


echo "link skin and config file"
ln -sf ~/.files/terminals/yakuake/skins ~/.local/share/yakuake/


