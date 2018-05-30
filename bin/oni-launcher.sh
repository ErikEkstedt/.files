#!/bin/bash

# Starts in the home directory and initializes a tmux session called DropDown
# with ranger, a terminal and htop 

# todo:
# make it work in a tmux session as well as outside
session="Oni"
if $(ps -e | grep -q tmux); then
	if (tmux has-session -t "$session" 2> /dev/null); then
		# A tmux server is running and $session already exists. Switch to $session.
		tmux send-keys -t $session:0 "oni" Enter
		kdialog --icon ~/.files/icons/oni.png --passivepopup "Found $session. Sending keys"
		
		#Not working correctly. Detects oni running everytime.
		# if $(ps -e | grep -q oni); then
		# 	# An instance of oni is already running
		# 	tmux send-keys -t $session "tmux new-window" Enter
		# 	tmux send-keys -t $session:$ "oni" Enter
		# 	kdialog --icon ~/.files/icons/oni.png --passivepopup "Found $session and instance running. Sending keys to new window"
		# else
		# 	tmux send-keys -t $session:0 "oni" Enter
		# 	kdialog --icon ~/.files/icons/oni.png --passivepopup "Found $session. Sending keys"
		# fi
	else
		tmux new-session -d -s $session
		_init
		kdialog --icon ~/.files/icons/oni.png --passivepopup "NEW $session"
	fi
else
	tmux new-session -d -s $session
	_init
	kdialog --icon ~/.files/icons/oni.png --passivepopup "INIT TMUX & STARTED $session"
fi




function _init {
	tmux new-window -t $session:0
	tmux rename-window -t $session:0 "Oni"
	tmux send-keys -t $session:0 "oni" Enter
	kdialog --icon ~/.files/icons/oni.png --passivepopup "HERE $session"
}
