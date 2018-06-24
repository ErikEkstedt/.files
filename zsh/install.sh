#!/bin/bash
# Install oh-my-zsh
# and set zsh as main shell
# install spaceship-theme 
# Dependencies: npm

echo Links: zsh
echo ln -sf ~/.files/zsh/zshrc ~/.zshrc
ln -sf ~/.files/zsh/zshrc ~/.zshrc

sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

sudo -u erik chsh -s $(which zsh)

npm install -g spaceship-zsh-theme
