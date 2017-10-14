#!/bin/sh
for id in `xinput --list|grep 'Microsoft'|perl -ne 'while (m/id=(\d+)/g){print "$1\n";}'`; do
    # echo "setting device ID $id"
    notify-send -t 500  'Mouse fixed'
    # xinput set-prop $id "Device Accel Velocity Scaling" 10
    xinput set-prop $id "Device Accel Constant Deceleration" 2.4
    xinput set-prop $id "Evdev Scrolling Distance"  1 -1 1
done



