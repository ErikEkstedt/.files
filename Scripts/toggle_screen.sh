#!/bin/bash
# https://faq.i3wm.org/question/5312/how-to-toggle-onoff-external-and-internal-monitors.1.html
EXTERNAL_OUTPUT="HDMI-2"
INTERNAL_OUTPUT="eDP-1"

# if we don't have a file, start at zero
if [ ! -f "/tmp/monitor_mode.dat" ] ; then
  monitor_mode="all"

# otherwise read the value from the file
else
  monitor_mode=`cat /tmp/monitor_mode.dat`
fi

if [ $monitor_mode = "all" ]; then
        monitor_mode="EXTERNAL"
        xrandr --output $INTERNAL_OUTPUT --off --output $EXTERNAL_OUTPUT --auto
        feh --bg-scale ~/.config/wall.png
        DISPLAY=:0 notify-send -t 1000 --urgency=critical --icon=/usr/share/icons/gnome/256x256/status/user-available.png "Monitor mode: Only External"
elif [ $monitor_mode = "EXTERNAL" ]; then
        monitor_mode="INTERNAL"
        xrandr --output $INTERNAL_OUTPUT --auto --output $EXTERNAL_OUTPUT --off
        feh --bg-scale ~/.config/wall.png
        DISPLAY=:0 notify-send -t 1000 --urgency=critical --icon=/usr/share/icons/gnome/256x256/status/user-available.png "Monitor mode: Only Laptop"
elif [ $monitor_mode = "INTERNAL" ]; then
        monitor_mode="CLONES"
        xrandr --output $INTERNAL_OUTPUT --auto --output $EXTERNAL_OUTPUT --auto --same-as $INTERNAL_OUTPUT
        feh --bg-scale ~/.config/wall.png
        DISPLAY=:0 notify-send -t 1000 --urgency=critical --icon=/usr/share/icons/gnome/256x256/status/user-available.png "Monitor mode: Clone screen"
else
        monitor_mode="all"
        xrandr --output $INTERNAL_OUTPUT --auto --output $EXTERNAL_OUTPUT --auto --above $INTERNAL_OUTPUT
        feh --bg-scale ~/.config/wall.png
        DISPLAY=:0 notify-send -t 1000 --urgency=critical --icon=/usr/share/icons/gnome/256x256/status/user-available.png "Monitor mode: All"
fi
echo "${monitor_mode}" > /tmp/monitor_mode.dat

