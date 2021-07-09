#!/bin/bash
# download miniconda

if [ ! -f ~/Downloads/Miniconda3-latest-Linux-x86_64.sh ]; then 
	wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh ~/Downloads -P ~/Downloads
fi

sh $HOME/Downloads/Miniconda3-latest-Linux-x86_64.sh

conda update conda
