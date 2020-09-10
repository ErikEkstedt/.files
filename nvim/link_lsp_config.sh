#!/bin/bash
# rm ~/.config/nvim

mkdir ~/.config/nvim
mkdir ~/.config/nvim/after
mkdir ~/.config/nvim/after/plugin
mkdir ~/.config/nvim/lua

ln -s ~/.files/nvim/lua/my_lsp_settings.lua ~/.config/nvim/lua/my_lsp_settings.lua
ln -s ~/.files/nvim/lsp_init.vim ~/.config/nvim/init.vim
ln -s ~/.files/nvim/after/plugin/completion.vim ~/.config/nvim/after/plugin/completion.vim
ln -s ~/.files/nvim/after/plugin/diagnostic.vim ~/.config/nvim/after/plugin/diagnostic.vim
ln -s ~/.files/nvim/after/plugin/ultisnips_settings.vim ~/.config/nvim/after/plugin/ultisnips_settings.vim
