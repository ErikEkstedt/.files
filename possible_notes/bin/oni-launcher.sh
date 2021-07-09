#!/bin/bash

session="Oni"

function _init {
	tmux new-window -t $session:0
	tmux rename-window -t $session:0 "Oni"
	tmux send-keys -t $session:0 "oni" Enter
	kdialog --icon ~/.files/icons/oni.png --passivepopup "$1"
}


if $(ps -e | grep -q tmux); then
	if (tmux has-session -t "$session" 2> /dev/null); then
		# A tmux server is running and $session already exists. Switch to $session.
		# tmux send-keys -t $session:0 "oni" Enter
		# kdialog --icon ~/.files/icons/oni.png --passivepopup "Found $session. Sending keys"
		
        # Not working correctly. Detects oni running everytime.
        if $(ps -e | grep -q oni); then
            # An instance of oni is already running
            tmux new-window -t $session
            tmux send-keys -t $session:$ "oni" Enter
            kdialog --icon ~/.files/icons/oni.png --passivepopup "Found $session and instance running. Sending keys to new window"
        else
            tmux send-keys -t $session:0 "oni" Enter
            kdialog --icon ~/.files/icons/oni.png --passivepopup "Found $session. Sending keys"
        fi
    else
        tmux new-session -d -s $session
        _init "Tmux server is running. Created $session session."
    fi
else
    tmux new-session -d -s $session
    _init "Tmux server not running. Started tmux an  $session session."
fi

