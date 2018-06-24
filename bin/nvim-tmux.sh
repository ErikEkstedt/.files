#!/bin/bash
term="konsole"
session="Vim"
path="~/"
tmux has-session -t $session 2> /dev/null
if [ "$?" -eq 1 ] 
then
	# DISPLAY=:0 notify-send -t 3000 --urgency=critical --icon=$VIM "Creating $session session"
	tmux start-server
	tmux new-session -d -s $session -n $session 
	tmux selectp -t 1 
	tmux send-keys "cd $path; vim" C-m 
	exec $term -e "tmux attach-session -t $session"
fi
