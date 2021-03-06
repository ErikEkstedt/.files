#!/bin/sh
# Microsoft mouse
for id in `xinput --list|grep 'Microsoft'|perl -ne 'while (m/id=(\d+)/g){print "$1\n";}'`; do
    xinput set-prop $id "Device Accel Constant Deceleration" 2.4
    xinput set-prop $id "Evdev Scrolling Distance"  1 -1 1
done

# SteelSeries mouse
for id in `xinput --list|grep 'SteelSeries'|perl -ne 'while (m/id=(\d+)/g){print "$1\n";}'`; do
    xinput set-prop $id "Device Accel Constant Deceleration" 2.4
    xinput set-prop $id "Evdev Scrolling Distance"  1 -1 1
done

for id in `xinput --list|grep 'Touchpad'|perl -ne 'while (m/id=(\d+)/g){print "$1\n";}'`; do
    # echo "setting device ID $id"
    # xinput set-prop $id "Device Accel Velocity Scaling" 10
    xinput set-prop $id "Synaptics Scrolling Distance" -77 -77
done

