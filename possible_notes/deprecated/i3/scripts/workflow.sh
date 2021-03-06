#!/bin/bash
WS_LAYOUT_FILE=/home/erik/.files/i3/scripts/layout_code.json
DISPLAY=:0 notify-send -t 1000 --urgency=critical --icon=/usr/share/icons/gnome/256x256/status/user-available.png "Coding Layout Initialized"

term=st
# Todo: get the current screen used and use layout file that matches.
i3-msg append_layout "$WS_LAYOUT_FILE"

$term -e tmux &
$term -e tmux -c "cd ~/com_sci/Master_code/project/project && vim" &
$term -e tmux -c vtop &
