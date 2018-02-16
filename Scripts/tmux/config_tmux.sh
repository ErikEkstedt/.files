#!/bin/bash
Img=~/.files/icons/red-icon.png
VIM=~/.files/icons/vim-icon.png
session="Config"
term="st"
path="~/.files"
tmux has-session -t $session 2> /dev/null
if [ "$?" -eq 1 ] 
then
	killall notify-osd
	DISPLAY=:0 notify-send -t 3000 --urgency=critical --icon=$VIM "Creating $session session"
	tmux start-server
	tmux new-session -d -s $session -n $session 
	tmux selectp -t 1 
	tmux send-keys "cd $path;vim" C-m 
	exec $term -e tmux attach-session -t $session
	name=$(xdotool search -name $session:)  
	i3-msg [id="$name"] floating enable
else
	attached=$( tmux ls | grep $session | grep attached)
	if [ -z "$attached" ] 
	then
		killall notify-osd
		DISPLAY=:0 notify-send -t 3000 --urgency=critical --icon=$VIM "Attaching to $session"
		exec $term -e tmux attach-session -t $session
	else
		killall notify-osd
		DISPLAY=:0 notify-send -t 3000 --urgency=critical --icon=$VIM "$session"
		name=$(xdotool search -name $session:)  
		i3-msg [id="$name"] focus
	fi
fi


