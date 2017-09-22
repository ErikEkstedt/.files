#!/bin/bash
# Add this to your .xinitrc or whatever file starts programs on startup.
# -R restores the last colorscheme that was in use.
wal=$(which wal)
$wal -R -a 70
#DISPLAY=:0 notify-send -t 2000 --urgency=critical --icon=$Img "$wal -R -a 70"
xmodmap ~/.files/Scripts/speedswapper
xset r rate 300 75
unclutter &
