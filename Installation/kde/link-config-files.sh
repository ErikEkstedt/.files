#!/bin/bash

echo Create links for config files:

echo ln -sf ~/.files/vimrc ~/.vimrc
ln -sf ~/.files/vimrc ~/.vimrc

echo ln -sf ~/.files/zshrc ~/.zshrc
ln -sf ~/.files/zsh/zshrc-desktop ~/.zshrc

echo ln -sf ~/.files/inputrc ~/.inputrc
ln -sf ~/.files/inputrc ~/.inputrc

echo ln -sf ~/.files/bashrc ~/.bashrc
ln -sf ~/.files/bashrc ~/.bashrc

echo ln -sf ~/.files/tmux.conf ~/.tmux.conf
ln -sf ~/.files/tmux.conf ~/.tmux.conf

echo ln -sf ~/.files/gitignore ~/.gitignore
echo ln -sf ~/.files/gitconfig ~/.gitconfig
ln -sf ~/.files/gitconfig ~/.gitconfig

echo ln -sf ~/.files/xinitrc ~/.xinitrc
ln -sf ~/.files/xinitrc ~/.xinitrc

echo ln -sf ~/.files/Xresources ~/.Xresources
ln -sf ~/.files/Xresources ~/.Xresources

mkdir -p ~/.config/zathura
echo ln -sf ~/.files/zathurarc ~/.config/zathura/zathurarc
ln -sf ~/.files/zathurarc ~/.config/zathura/zathurarc

echo ln -sf ~/.files/nvim ~/.config/
ln -sf ~/.files/nvim ~/.config/

echo "Removing konsole directory (~/.local/share/konsole)"
rm -rf ~/.local/share/konsole
echo ln -sf ~/.files/konsole ~/.local/share/
ln -sf ~/.files/terminals/konsole ~/.local/share/



