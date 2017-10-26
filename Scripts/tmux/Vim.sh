#!/bin/bash
Img=~/.files/icons/red-icon.png
VIM=~/.files/icons/vim-icon.png
session="Vim"
tmux has-session -t $session 2> /dev/null
if [ "$?" -eq 1 ] 
then
	DISPLAY=:0 notify-send -t 3000 --urgency=critical --icon=$VIM "Creating $session session"
	tmux start-server
	# create a new tmux session, starting vim from a saved session in the new window
	tmux new-session -d -s $session -n vim 
	# Select pane 1, set dir to gro (zsh alias) , run vim
	tmux selectp -t 1 
	tmux send-keys "~/com_sci; vim" C-m 
	exec urxvt -e bash -c "tmux attach-session -t $session"
else
	attached=$( tmux ls | grep $session | grep attached)
	if [ -z "$attached" ] 
	then
		killall notify-osd
		DISPLAY=:0 notify-send -t 3000 --urgency=critical --icon=$VIM "Attaching to $session"
		exec urxvt -e bash -c "tmux attach-session -t $session"
	else
		DISPLAY=:0 notify-send -t 3000 --urgency=critical --icon=$VIM "$session"
		name=$(xdotool search -name $session)
		i3-msg [id="$name"] focus
	fi
fi

