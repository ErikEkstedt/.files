#!/bin/bash

Img=~/.files/icons/red-icon.png
VIM=~/.files/icons/vim-icon.png
session="Personal"
tmux has-session -t $session 2> /dev/null
if [ "$?" -eq 1 ] 
then
	DISPLAY=:0 notify-send -t 3000 --urgency=critical --icon=$VIM "Creating $session session"
	# set up tmux
	tmux start-server
	# create a new tmux session, starting vim from a saved session in the new window
	tmux new-session -d -s $session -n vim #"vim -S ~/.vim/sessions/kittybusiness"

	# Select pane 1, set dir to gfi (zsh alias) , run vim
	tmux selectp -t 1 
	tmux send-keys "cd ~/.personal; vim" C-m 
	# Finished setup, attach to the tmux session!
	exec urxvt -e bash -c "tmux attach-session -t $session"    
else
	attached=$( tmux ls | grep $session | grep attached)
	if [ -z "$attached" ] 
	then
		killall notify-osd
		DISPLAY=:0 notify-send -t 3000 --urgency=critical --icon=$VIM "Attaching to $session"
		exec urxvt -e bash -c "tmux attach-session -t $session"    
	else
		DISPLAY=:0 notify-send -t 3000 --urgency=critical --icon=$Img "Already attached"
		name=$(xdotool search -name $session)
		i3-msg [id="$name"] focus
	fi
fi


