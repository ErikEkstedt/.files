#!/bin/bash

echo "Add nvim PPA, update system and install"
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update -y
sudo apt-get install neovim -y

echo ln -sf ~/.files/nvim ~/.config/
ln -sf ~/.files/nvim ~/.config/
