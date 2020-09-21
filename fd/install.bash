#! /bin/bash

echo "Installing sharkdp/fd"

case `uname` in
    Darwin)
        brew install fd
        ;;
    Linux)
        sudo apt-get install fd-find
        echo "Make sure alias fd='fdfind' is set!"
        ;;
esac
