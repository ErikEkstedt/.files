#!/bin/bash
# Add this to your .xinitrc or whatever file starts programs on startup.
# -R restores the last colorscheme that was in use.
<<<<<<< HEAD
WAL=$(which wal)
$WAL -R -a 70
=======
wal=$(which wal)
$wal -R -a 70
#DISPLAY=:0 notify-send -t 2000 --urgency=critical --icon=$Img "$wal -R -a 70"
>>>>>>> d09e3daa1dca6964ab6289905be24e232bf9476f
xmodmap ~/.files/Scripts/speedswapper
xset r rate 300 75
unclutter &
