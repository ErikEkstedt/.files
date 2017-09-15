#!/bin/bash
WS_LAYOUT_FILE=/home/erik/.config/i3/Calendar_layout.json

i3-msg workspace "7:Calendar" 
i3-msg append_layout "$WS_LAYOUT_FILE"

xfce4-terminal -x vim -c "Calendar -view=month"
xfce4-terminal -x vim -c "Calendar -view=week"
xfce4-terminal -x vim -c "Calendar -view=day"
 
 

