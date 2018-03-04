#!/bin/sh
session="Ranger"
tmux has-session -t $session 2> /dev/null
if [ "$?" -eq 1 ] 
then
	tmux start-server
	tmux new-session -d -s $session -n $session
	tmux selectp -t 1 
	tmux send-keys "ranger" C-m 
	tmux attach-session -t $session
else
	attached=$( tmux ls | grep $session | grep attached)
	if [ -z "$attached" ] 
	then
		tmux attach-session -t $session
		echo "Attach!"
	else
		name=$(xdotool search -name $session:)
		echo $name
	fi
fi

