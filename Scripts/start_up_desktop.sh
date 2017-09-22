#!/bin/bash
# Add this to your .xinitrc or whatever file starts programs on startup.
# -R restores the last colorscheme that was in use.
sudo ethtool -s enp0s31f6 wol g
wal=$(which wal)
$wal -R -a 70
xmodmap ~/.files/Scripts/speedswapper
xset r rate 300 75
unclutter &
