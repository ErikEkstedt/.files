#!/bin/bash
# NAME: toggle-touchpad
# PATH: /home/erik/.config/own_scripts
# DESC: Update pulseaudio output device when HDMI TV plugged / unplugged
# NOTE: Written for AU question: http://askubuntu.com/questions/863746/keyboard-shortcut-to-disable-the-laptop-touchpad/863750?noredirect=1#comment1333958_863750

# Use device number matching touchpad, in this case 14
T=2000
#Img="/usr/share/icons/gnome/256x256/status/user-available.png"
Img="/home/erik/.files/icons/check_green.png"
Img2="/home/erik/.files/icons/red-icon.png"
#Img2="/usr/share/icons/gnome/256x256/status/user-busy.png"

# xinput list | find line with touchpad | take number before = | cut before [ ----> the Id number
N=$(xinput list | grep Touchpad | cut -f 2 -d '=' | cut -f 1 -d '[')
if [[ $(xinput list $N | grep -Ec "disabled") -eq 1 ]]; then
    xinput enable $N
    killall notify-osd
    DISPLAY=:0 notify-send -t $T --urgency=critical --icon=$Img "Touchpad enabled"
		exec ~/.files/Scripts/mouse_settings.sh 
else
    xinput disable $N
    killall notify-osd
    DISPLAY=:0 notify-send -t $T --urgency=critical --icon=$Img2 "Touchpad disabled"
fi
exit 0
