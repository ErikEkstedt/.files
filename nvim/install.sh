#!/bin/bash

case `uname` in
    Darwin)
		brew install neovim
            ;;
    Linux)
		echo "Add nvim PPA, update system and install"
		sudo add-apt-repository ppa:neovim-ppa/stable
		sudo apt-get update -y
		sudo apt-get install neovim -y

		echo Installing Nevim pip package
		pip install neovim

		echo Installing Nevim NPM package
		npm install -g neovim
        ;;
esac


echo "Do you wish to install LSP:s? (y/n)"
read answer
if [[ $answer == 'y' || $answer == 'Y'   ]]; then
	# Bash
	npm i -g bash-language-server 

	# JAVASCRIPT
	npm i -g javascript-typescript-langserver

	# PYTHON. PYLS
	# Source nvim-special-python env:
	# (g:python3_host_prog='/Users/erik/miniconda3/envs/neovim3/bin/python') 
	# pip install python-language-server
fi

echo ln -sf ~/.files/nvim ~/.config/
ln -sf ~/.files/nvim ~/.config/
ln -sf ~/.files/nvim/init.vim ~/.vimrc
