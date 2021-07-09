#!/bin/bash
# https://github.com/tmux/tmux/wiki/Installing

echo "TMUX INSTALL"
echo "============"

prg=tmux
if ! [ -x "$(command -v $prg)" ]; then
    case `uname` in
        Darwin)
            brew install tmux
            ;;
        Linux)
            # Build from master
            sudo apt-get install -y libevent-dev ncurses-dev build-essential bison pkg-config
            git clone https://github.com/tmux/tmux.git ~/tmux
            curdir=$pwd
            cd ~/tmux
            sh autogen.sh
            ./configure
            make && sudo make install
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
