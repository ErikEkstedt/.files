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
      curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
      chmod u+x nvim.appimage
      mv nvim.appimage $HOME/.local/bin
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

echo "Link Config? (y/n)"
read answer
if [[ $answer == 'y' || $answer == 'Y'   ]]; then
  echo "Linking repo"
  ln -sf ~/.files/nvim ~/.config/
  ln -sf ~/.files/nvim/init.vim ~/.vimrc
fi
