#!/bin/bash
# Checks if any input was given
if [ -n "$1" ]; then
    REMOTE="$1"
    echo $REMOTE
else     
    echo "No ssh name given."
    REMOTE="Desktop"
    echo $REMOTE
fi
DISPLAY=:0 notify-send -t 2000 --urgency=critical "Remote: $REMOTE"
exec st -e ssh $REMOTE
