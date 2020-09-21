#!/bin/bash

prg=nvim
if ! [ -x "$(command -v $prg)" ]; then
    echo "Install Neovim"
    case `uname` in
        Darwin)
            echo "MACOS: Installing NeoVim via homebrew..."
            brew install --HEAD neovim
            ;;
        Linux)
            echo "LINUX: Installing Neovim from source" 
            sudo apt-get install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip -y
            git clone https://github.com/neovim/neovim.git ~/neovim
            cd ~/neovim
            make CMAKE_BUILD_TYPE=RelWithDebInfo
            sudo make install
            ;;
    esac
fi

echo "Linking repo"
ln -sf ~/.files/nvim ~/.config/
ln -sf ~/.files/nvim/init.vim ~/.vimrc

#echo "Create conda envs? (y/n)"
#read answer
#if [[ $answer == 'y' || $answer == 'Y'   ]]; then
#  echo "Creating Conda envs..."
#  conda create -n neovim3 python=3 -y
#fi
#
#echo "Do you wish to install LSP:s? (y/n)"
#read answer
#if [[ $answer == 'y' || $answer == 'Y'   ]]; then
#
#  echo "Install npm LSPs? (y/n)"
#  read answer
#  if [[ $answer == 'y' || $answer == 'Y'   ]]; then
#    # Bash
#    npm i -g bash-language-server
#    # JAVASCRIPT
#    npm i -g javascript-typescript-langserver
#  fi
#
#  echo "Install python LSPs? (y/n)"
#  read answer
#  if [[ $answer == 'y' || $answer == 'Y'   ]]; then
#    # PYTHON. PYLS
#    source activate neovim3
#    pip install python-language-server
#    source deactivate
#  fi
#fi

