#!/bin/bash
# NAME: toggle-touchpad
# PATH: /home/erik/.config/own_scripts
# DESC: Update pulseaudio output device when HDMI TV plugged / unplugged
# NOTE: Written for AU question: http://askubuntu.com/questions/863746/keyboard-shortcut-to-disable-the-laptop-touchpad/863750?noredirect=1#comment1333958_863750

# Use device number matching touchpad, in this case 14
if [[ $(xinput list 12 | grep -Ec "disabled") -eq 1 ]]; then
    xinput enable 12
    DISPLAY=:0 notify-send -t 1500 --urgency=critical --icon=/usr/share/icons/gnome/256x256/status/user-available.png "Touchpad enabled"
else
    xinput disable 12
    DISPLAY=:0 notify-send -t 1500 --urgency=critical --icon=/usr/share/icons/gnome/256x256/status/user-busy.png "Touchpad disabled"
fi
exit 0
