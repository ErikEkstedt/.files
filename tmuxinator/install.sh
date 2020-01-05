#!/bin/bash
# https://github.com/tmuxinator/tmuxinator 

prg=tmuxinator
if ! [ -x "$(command -v $prg)" ]; then
	echo "Installing $prg" >&2
	sudo gem install tmuxinator
else
	echo "$prg is already installed" >&2
fi

# Completion
# add the line below to zsrc
echo 
echo "For completion add the following line to zsrc:"
echo \> source ~/.files/tmuxinator/tmuxinator.zsh
echo 
