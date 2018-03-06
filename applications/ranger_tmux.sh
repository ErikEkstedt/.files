#!/bin/bash
term="konsole"
session="Ranger"
path="~/"
tmux has-session -t $session 2> /dev/null
if [ "$?" -eq 1 ] 
then
	tmux start-server
	tmux new-session -d -s $session -n $session 
	tmux selectp -t 1 
	tmux send-keys "cd $path;ranger" C-m 
	exec $term -e "tmux attach-session -t $session"
else
	exec $term -e "tmux attach-session -t $session"
fi
