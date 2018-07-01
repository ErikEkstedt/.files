#!/bin/bash

prg=tmux
if ! [ -x "$(command -v $prg)" ]; then
	echo "Installing tmux"
	sudo apt install tmuc
else
	echo "Tmux already installed"
fi

echo 
echo "Linking Tmux config file"
printf "ln -sf $HOME/.files/tmux/tmux.conf $HOME/.tmux.conf"
ln -sf $HOME/.files/tmux/tmux.conf $HOME/.tmux.conf
