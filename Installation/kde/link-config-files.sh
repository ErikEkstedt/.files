#!/bin/bash

echo Create links for config files...
ln -sf ~/.files/vimrc ~/.vimrc
ln -sf ~/.files/zshrc ~/.zshrc
ln -sf ~/.files/inputrc ~/.inputrc
ln -sf ~/.files/bashrc ~/.bashrc
ln -sf ~/.files/tmux.conf ~/.tmux.conf
ln -sf ~/.files/gitignore ~/.gitignore
ln -sf ~/.files/gitconfig ~/.gitconfig
ln -sf ~/.files/xinitrc ~/.xinitrc
ln -sf ~/.files/Xresources ~/.Xresources

mkdir -p ~/.config/zathura
ln -sf ~/.files/zathurarc ~/.config/zathura/zathurarc




