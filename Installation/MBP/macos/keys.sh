#!/bin/bash

# Script to set keyrepeat and key-delay as I want.
# TODO
# Should probably remap keys I wish to remap and so on

echo "Do you wish to revert to default? (y/n)"
read answer
if [[ $answer == 'y' || $answer == 'Y'   ]]; then
    echo "Reverting to default settings"
    defaults delete NSGlobalDomain KeyRepeat
    defaults delete NSGlobalDomain InitialKeyRepeat
else
    echo "Set a blazingly fast keyboard repeat rate, "
    defaults write NSGlobalDomain KeyRepeat -int 0.02 
    echo "Set a shorter Delay until key repeat"
    defaults write NSGlobalDomain InitialKeyRepeat -int 12
fi




