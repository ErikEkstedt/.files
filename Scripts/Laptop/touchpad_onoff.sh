#!/bin/bash
# NAME: toggle-touchpad
# PATH: /home/erik/.files/Scripts

# Use device number matching touchpad, in this case 14
T=2000
Img="/home/erik/.files/icons/check_green.png"
Img2="/home/erik/.files/icons/red-icon.png"

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
