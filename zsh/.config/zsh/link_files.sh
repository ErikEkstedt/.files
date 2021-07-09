#!/bin/bash
echo "Links: zsh"
echo "ln -sf ~/.files/zsh/zshrc ~/.zshrc"
ln -sf ~/.files/zsh/zshrc ~/.zshrc
sudo -u erik chsh -s $(which zsh)
