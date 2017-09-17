#!/bin/bash
WS_LAYOUT_FILE=/home/erik/.files/i3/scripts/workflow_layout.json
DISPLAY=:0 notify-send -t 1000 --urgency=critical --icon=/usr/share/icons/gnome/256x256/status/user-available.png "Coding Layout Initialized"

# Todo: get the current screen used and use layout file that matches.
i3-msg append_layout "$WS_LAYOUT_FILE"

urxvt -e bash -c "stty -ixon && ranger" &
urxvt -e htop &
urxvt -e bash -c "stty -ixon && ranger" &


