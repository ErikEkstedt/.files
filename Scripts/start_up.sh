#!/bin/bash
# Add this to your .xinitrc or whatever file starts programs on startup.
# -R restores the last colorscheme that was in use.
xrdb ~/.Xdefaults                                                                          
xmodmap ~/.files/Scripts/speedswapper
xmodmap -e "clear mod5"
xmodmap -e "keycode 108 = Alt_L"
xset r rate 300 75
WAL=$(which wal)
$WAL -R -a 70 
unclutter &
