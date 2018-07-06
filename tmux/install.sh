#!/bin/bash

prg=tmux
if ! [ -x "$(command -v $prg)" ]; then
	echo "Installing $prg"
	sudo apt install $prg
else
	echo "Tmux already installed"
fi

echo 
echo "Linking Tmux config file"
printf "ln -sf $HOME/.files/tmux/tmux.conf $HOME/.tmux.conf"
ln -sf $HOME/.files/tmux/tmux.conf $HOME/.tmux.conf

if [ -f ~/.tmux/plugins/tpm ]; then
	echo "Tmux-plugins already installed"
else
	echo "Cloning tmux-plugins"
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi
