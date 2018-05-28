#!/bin/sh

# Starts in the home directory and initializes a tmux session called DropDown
# with ranger, a terminal and htop 

# todo:
# make it work in a tmux session as well as outside
session="Oni"
if [ "$TMUX" = "" ]; then 
	tmux new-session -d -s $session
else
	tmux rename-session $session
fi

tmux new-window -t $session:0
tmux rename-window -t $session:0 "Oni"
tmux send-keys -t $session:0 "oni" Enter
