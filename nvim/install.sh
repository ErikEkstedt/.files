#!/bin/bash

echo Installing Nevim Python package
pip install neovim

echo Installing Nevim NPM package
npm install -g neovim


echo "Add nvim PPA, update system and install"
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update -y
sudo apt-get install neovim -y

echo ln -sf ~/.files/nvim ~/.config/
ln -sf ~/.files/nvim ~/.config/
