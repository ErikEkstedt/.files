#!/bin/bash

echo "Link hwdb files to /etc/udev/hwdb"
sudo ln -sf $HOME/.files/Installation/MBP-linux/61-evdev-local.hwdb /etc/udev/hwdb.d/
sudo ln -sf $HOME/.files/Installation/MBP-linux/61-libinput-local.hwdb /etc/udev/hwdb.d/

