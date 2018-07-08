#!/bin/bash

# scroll direction touchpad
# xinput set-prop 12 285 -303 303

echo "Setting properties for touchpad"
for id in `xinput --list | grep 'Touchpad' | perl -ne 'while (m/id=(\d+)/g){print "$1\n";}'`; 
do
	echo "Touchpad has ID: $id"
	xinput set-prop $id "Synaptics Scrolling Distance" -303 303
done


