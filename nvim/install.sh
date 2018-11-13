#!/bin/bash

echo "Do you wish to install NeoVim? (y/n)"
read answer
if [[ $answer == 'y' || $answer == 'Y'   ]]; then
  case `uname` in
    Darwin)
      echo "Installing NeoVim via homebrew..."
      brew install neovim
      ;;
    Linux)
      echo "Add nvim PPA, update system and install..."
      sudo add-apt-repository ppa:neovim-ppa/stable
      sudo apt-get update -y
      sudo apt-get install neovim -y

      echo Installing Nevim pip package
      pip install neovim

      echo Installing Nevim NPM package
      npm install -g neovim
      ;;
  esac
fi

echo "Create conda envs? (y/n)"
read answer
if [[ $answer == 'y' || $answer == 'Y'   ]]; then
  echo "Creating Conda envs..."
  conda create -n neovim3 python=3 -y
  conda create -n neovim2 python=2 -y
fi

echo "Do you wish to install LSP:s? (y/n)"
read answer
if [[ $answer == 'y' || $answer == 'Y'   ]]; then

  echo "Install npm LSPs? (y/n)"
  read answer
  if [[ $answer == 'y' || $answer == 'Y'   ]]; then
    # Bash
    npm i -g bash-language-server
    # JAVASCRIPT
    npm i -g javascript-typescript-langserver
  fi

  echo "Install python LSPs? (y/n)"
  read answer
  if [[ $answer == 'y' || $answer == 'Y'   ]]; then
    # PYTHON. PYLS
    source activate neovim3
    pip install python-language-server
    source deactivate
  fi
fi

echo ln -sf ~/.files/nvim ~/.config/
ln -sf ~/.files/nvim ~/.config/
ln -sf ~/.files/nvim/init.vim ~/.vimrc
