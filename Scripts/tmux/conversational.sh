#!/bin/bash
img=~/.files/icons/red-icon.png
vim=~/.files/icons/vim-icon.png
term="st"
session="personal"  # $1
path="~/com_sci/ConversationalAgent"  # $2
tmux has-session -t $session 2> /dev/null
if [ "$?" -eq 1 ] 
then
    display=:0 notify-send -t 3000 --urgency=critical --icon=$vim "creating $session session"
    tmux start-server
    tmux new-session -d -s $session -n $session 
    tmux selectp -t 1 
    tmux send-keys "cd $path;vim" c-m 
		exec $term -e tmux attach-session -t $session
else
    attached=$( tmux ls | grep $session | grep attached)
    if [ -z "$attached" ] 
    then
        killall notify-osd
        display=:0 notify-send -t 3000 --urgency=critical --icon=$vim "attaching to $session"
				exec $term -e tmux attach-session -t $session
    else
        display=:0 notify-send -t 3000 --urgency=critical --icon=$vim "$session"
				name=$(xdotool search -name $session:)  
				i3-msg [id="$name"] focus
    fi
fi




