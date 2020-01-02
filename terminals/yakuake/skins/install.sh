#!/bin/bash



prg=yakuake
if ! [ -x "$(command -v $prg)" ]; then
	echo "Installing $prg"
	sudo apt install yakuake
else
	echo "$prg already installed"
fi


echo "link skin and config file"
mkdir -p ~/.local/share/yakuake
ln -sf ~/.files/terminals/yakuake/skins ~/.local/share/yakuake/

# TODO
# Automatically set onepixel as
# skin.
# Write to or link
# ~/.config/yakuakerc

