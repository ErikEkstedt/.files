#!/bin/bash

files=~/.files/terminals/konsole
konsole_dir=~/.local/share/konsole

rm -rf ~/.local/share/konsole
mkdir $konsole_dir

# settings
cp $files/erik-standard.profile $konsole_dir
cp $files/dropdown.profile $konsole_dir

# colors
cp $files/base16-onedark.colorscheme $konsole_dir
cp $files/base16-pico.colorscheme $konsole_dir
cp $files/base16-pop.colorscheme $konsole_dir
