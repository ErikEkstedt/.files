#! /bin/bash


case $(uname) in
    Darwin)
        # commands for OS X go here
        echo "MACOS"
        echo "-----"
        wget https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh
        bash Miniconda3-latest-MacOSX-x86_64.sh
        ;;
    Linux)
        echo "Linux"
        echo "-----"
        # commands for Linux go here
        wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
        bash Miniconda3-latest-Linux-x86_64.sh
        ;;
esac

