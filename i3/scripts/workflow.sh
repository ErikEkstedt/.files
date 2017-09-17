#!/bin/bash
WS_LAYOUT_FILE=/home/erik/.files/i3/scripts/workflow_layout.json
DISPLAY=:0 notify-send -t 1000 --urgency=critical --icon=/usr/share/icons/gnome/256x256/status/user-available.png "Coding Layout Initialized"

# Todo: get the current screen used and use layout file that matches.
i3-msg append_layout "$WS_LAYOUT_FILE"

#urxvt -e ranger -T 1
urxvt -e htop 
urxvt -e htop 
urxvt -e ranger -T 2
#urxvt -e "bash -c stty -ixon && ranger"


