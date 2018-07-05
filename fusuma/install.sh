#!/bin/bash

prg=fusuma
if ! [ -x "$(command -v $prg)" ]; then
	echo "Installing $prg" >&2
else
	echo "$prg is already installed!" >&2
fi

echo 
echo "Linking config files:"
echo "$HOME/.files/fusuma/config.yml -> $HOME/.config/fusuma/config.yml"

ln -sf $HOME/.files/fusuma/config.yml $HOME/.config/fusuma/config.yml
