#!/usr/bin/zsh

killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

killall notify-osd
if [ "$HOST" = "erik-Desktop" ]
then
	DISPLAY=:0 notify-send -t 3000 --urgency=critical "DESKTOP POLYBAR"
	polybar desktopbar -c ~/.files/polybar.conf &
else
	DISPLAY=:0 notify-send -t 3000 --urgency=critical "Laptop POLYBAR"
	polybar laptopbar -c ~/.files/polybar.conf &
fi
