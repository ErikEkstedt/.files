#! /bin/bash

conda create -n neovim3 python=3 -y

conda source activate neovim3

pip install pynvim

conda deactivate
