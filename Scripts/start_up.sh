#!/bin/bash
# Add this to your .xinitrc or whatever file starts programs on startup.
# -R restores the last colorscheme that was in use.
xrdb ~/.Xdefaults                                                                          
xmodmap ~/.files/Scripts/speedswapper
xset r rate 200 75
WAL=$(which wal)
$WAL -R -a 70 
sh ./mouse_settings.sh &
unclutter &
