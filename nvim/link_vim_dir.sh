#!/bin/bash

echo Linking vimdirectory $DOTFILES/nvim -> ~/.config/nvim 
echo Linking vimrc $DOTFILES/nvim/init.vim -> ~/.vimrc 
ln -sf ~/.files/nvim ~/.config/
ln -sf ~/.files/nvim/init.vim ~/.vimrc
