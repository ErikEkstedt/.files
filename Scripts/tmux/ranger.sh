#!/bin/sh
session="Ranger"
tmux has-session -t $session 2> /dev/null
if [ "$?" -eq 1 ] 
then
	tmux start-server
	tmux new-session -d -s $session -n ranger
	tmux selectp -t 1 
	tmux send-keys "ranger" C-m 
	tmux attach-session -t $session
else
	attached=$( tmux ls | grep $session | grep attached)
	if [ -z "$attached" ] 
	then
		killall notify-osd
		tmux attach-session -t $session
	else
		name=$(xdotool search -name $session:)
		i3-msg [id="$name"] focus
	fi
fi

