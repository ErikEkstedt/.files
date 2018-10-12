#!/bin/bash

echo "Do you wish to install NeoVim? (y/n)"
read answer
if [[ $answer == 'y' || $answer == 'Y'   ]]; then
  case `uname` in
    Darwin)
      echo "Installing NeoVim via homebrew..."
      brew install neovim
      ;;
    Linux)
      echo "Add nvim PPA, update system and install..."
      sudo add-apt-repository ppa:neovim-ppa/stable
      sudo apt-get update -y
      sudo apt-get install neovim -y

      echo Installing Nevim pip package
      pip install neovim

      echo Installing Nevim NPM package
      npm install -g neovim
      ;;
  esac
fi

echo "Create conda envs? (y/n)"
read answer
if [[ $answer == 'y' || $answer == 'Y'   ]]; then
  echo "Creating Conda envs..."
  conda create -n neovim3 python=3.6 -y
  echo "Did conda install neovim 3?"
  read answer
  conda create -n neovim2 python=2 -y
  echo "Lets hope it created neovim2" 
fi

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
