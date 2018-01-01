#!/usr/bin/env sh

killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
polybar desktopbar -c ~/.files/polybar.conf &
polybar laptopbar -c ~/.files/polybar.conf &
