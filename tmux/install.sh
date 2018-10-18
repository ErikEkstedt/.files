#!/bin/bash
# https://gist.github.com/P7h/91e14096374075f5316e

echo "Install Tmux (y/n)"
read answer
if [[ $answer == 'y' || $answer == 'Y'   ]]; then
  prg=tmux
  if ! [ -x "$(command -v $prg)" ]; then
    case `uname` in
      Darwin)
        brew install tmux
        ;;
      Linux)
        # commands for Linux go here
        echo "Installing $prg"
        sudo apt install $prg
        # Steps to build and install tmux from source.
        # Takes < 25 seconds on EC2 env [even on a low-end config instance].
        VERSION=2.7
        echo "Installing tmux version $VERSION"
        sudo apt-get -y remove tmux
        sudo apt-get -y install wget tar libevent-dev libncurses-dev
        sudo apt -y install build-essential
        wget https://github.com/tmux/tmux/releases/download/${VERSION}/tmux-${VERSION}.tar.gz
        tar xf tmux-${VERSION}.tar.gz
        rm -f tmux-${VERSION}.tar.gz
        cd tmux-${VERSION}
        ./configure
        make
        sudo make install
        cd -
        sudo rm -rf /usr/local/src/tmux-*
        sudo mv tmux-${VERSION} /usr/local/src
        ;;
    esac
    ## Logout and login to the shell again and run.
    ## tmux -V
  else
    echo "Tmux already installed"
  fi
fi

echo "\nLinking Tmux config file"
case `uname` in
  Darwin)
    echo "ln -sf $HOME/.files/tmux/mac-tmux.conf $HOME/.tmux.conf"
    ln -sf $HOME/.files/tmux/mac-tmux.conf $HOME/.tmux.conf
    ;;
  Linux)
    echo "ln -sf $HOME/.files/tmux/tmux.conf $HOME/.tmux.conf"
    ln -sf $HOME/.files/tmux/tmux.conf $HOME/.tmux.conf
    ;;
esac

if [ -d ~/.tmux/plugins/tpm ]; then
	echo "Tmux-plugins already installed"
else
  echo "Cloning tmux-plugins"
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi
