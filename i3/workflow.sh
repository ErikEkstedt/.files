#!/bin/bash
WS_LAYOUT_FILE=/home/erik/.config/i3/workflow_layout.json
DISPLAY=:0 notify-send -t 1000 --urgency=critical --icon=/usr/share/icons/gnome/256x256/status/user-available.png "Coding Layout Initialized"

# Todo: get the current screen used and use layout file that matches.
i3-msg append_layout "$WS_LAYOUT_FILE"

xfce4-terminal -x bash -c "stty -ixon && ranger"
xfce4-terminal -e htop
xfce4-terminal -x bash -c "stty -ixon && ranger"
