#! /bin/bash


case `uname` in
    Darwin)
        brew install ripgrep
        ;;
    Linux)
        sudo apt-get install ripgrep -y
        ;;
esac
