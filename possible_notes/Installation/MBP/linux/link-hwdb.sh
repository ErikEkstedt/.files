#!/bin/bash

echo "Link hwdb files to /etc/udev/hwdb"

sudo cp $HOME/.files/Installation/MBP/linux/61-evdev-local.hwdb /etc/udev/hwdb.d/61-evdev-local.hwdb 
sudo cp $HOME/.files/Installation/MBP/linux/61-libinput-local.hwdb /etc/udev/hwdb.d/61-libinput-local.hwdb 
