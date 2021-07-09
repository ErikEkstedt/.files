#!/bin/bash

# scroll direction touchpad
# xinput set-prop 12 285 -303 303

echo "Setting properties for touchpad"
for id in `xinput --list | grep 'Touchpad' | perl -ne 'while (m/id=(\d+)/g){print "$1\n";}'`; 
do
	echo "Touchpad has ID: $id"
	xinput set-prop $id "Synaptics Scrolling Distance" -201 -201
	xinput set-prop $id "Synaptics Palm Detection" 1
	xinput set-prop $id "Synaptics Two-Finger Scrolling" 1 1
  # move speed default: 1.000000, 1.750000, 0.013174, 0.000000
	xinput set-prop $id "Synaptics Move Speed" 1.4 1.85 0.014174 0
done


