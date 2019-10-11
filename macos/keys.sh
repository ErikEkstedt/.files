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
    # https://apple.stackexchange.com/questions/10467/how-to-increase-keyboard-key-repeat-rate-on-os-x#83923
    echo "Set a blazingly fast keyboard repeat rate, "
    # defaults write NSGlobalDomain KeyRepeat -int 0.02 
    defaults write -g InitialKeyRepeat -int 14 # normal minimum is 15 (225 ms)
    echo "Set a shorter Delay until key repeat"
    # defaults write NSGlobalDomain InitialKeyRepeat -int 12
    defaults write -g KeyRepeat -int 1 # normal minimum is 2 (30 ms)
fi




