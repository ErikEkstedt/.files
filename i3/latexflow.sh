#!/bin/bash
WS_LAYOUT_FILE=/home/erik/.config/i3/workflow_layout_latex.json

i3-msg append_layout "$WS_LAYOUT_FILE"

zathura
xfce4-terminal -e htop
xfce4-terminal -x bash -c "stty -ixon && ranger"
