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

echo ln -sf ~/.files/nvim ~/.config/
ln -sf ~/.files/nvim ~/.config/
ln -sf ~/.files/nvim/init.vim ~/.vimrc
