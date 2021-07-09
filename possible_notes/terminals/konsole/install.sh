#!/bin/bash

files=~/.files/terminals/konsole
konsole_dir=~/.local/share/konsole

rm -rf ~/.local/share/konsole
mkdir $konsole_dir

# settings
cp $files/erik-standard.profile $konsole_dir
cp $files/dropdown.profile $konsole_dir

# colors
cp $files/*.colorscheme $konsole_dir
