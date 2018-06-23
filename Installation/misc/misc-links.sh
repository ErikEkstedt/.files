#!/bin/bash

echo Create links for Misc-config files:
echo
echo ln -sf ~/.files/vimrc ~/.vimrc
ln -sf ~/.files/vimrc ~/.vimrc
echo ln -sf ~/.files/inputrc ~/.inputrc
ln -sf ~/.files/inputrc ~/.inputrc
echo ln -sf ~/.files/bashrc ~/.bashrc
ln -sf ~/.files/bashrc ~/.bashrc
echo ln -sf ~/.files/xinitrc ~/.xinitrc
ln -sf ~/.files/xinitrc ~/.xinitrc
echo ln -sf ~/.files/Xresources ~/.Xresources
ln -sf ~/.files/Xresources ~/.Xresources

echo ln -sf ~/.files/gitignore ~/.gitignore
ln -sf ~/.files/gitignore ~/.gitignore
echo ln -sf ~/.files/gitconfig ~/.gitconfig
ln -sf ~/.files/gitconfig ~/.gitconfig


echo ln -sf ~/.files/tmux.conf ~/.tmux.conf
ln -sf ~/.files/tmux.conf ~/.tmux.conf


mkdir -p ~/.config/zathura
echo ln -sf ~/.files/zathurarc ~/.config/zathura/zathurarc
ln -sf ~/.files/zathurarc ~/.config/zathura/zathurarc


echo "Removing konsole directory (~/.local/share/konsole)"
rm -rf ~/.local/share/konsole
echo ln -sf ~/.files/konsole ~/.local/share/
ln -sf ~/.files/terminals/konsole ~/.local/share/



