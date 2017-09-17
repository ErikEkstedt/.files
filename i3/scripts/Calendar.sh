#!/bin/bash
WS_LAYOUT_FILE=/home/erik/.files/i3/scripts/Calendar_layout.json

i3-msg workspace "7:Calendar" 
i3-msg append_layout "$WS_LAYOUT_FILE"
urxvt -e vim -c "Calendar -view=month" &
urxvt -e vim -c "Calendar -view=week" &
urxvt -e vim -c "Calendar -view=day" &

