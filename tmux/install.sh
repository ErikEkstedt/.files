#!/bin/bash
# https://github.com/tmux/tmux/wiki/Installing

echo "TMUX INSTALL"
echo "============"
echo "Install dependencies"
sudo apt-get -y install libevent-dev ncurses-dev build-essential bison pkg-config

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
fi

echo "ln -sf $HOME/.files/tmux/tmux.conf $HOME/.tmux.conf"
ln -sf $HOME/.files/tmux/tmux.conf $HOME/.tmux.conf

if [ -d ~/.tmux/plugins/tpm ]; then
    echo "Tmux-plugins already installed"
else
    echo "Cloning tmux-plugins"
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi
