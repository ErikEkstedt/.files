#!/bin/bash
Img=~/.files/icons/red-icon.png
VIM=~/.files/icons/vim-icon.png
session="Master"
term="termite"
path="~/com_sci/Master_code/Roboschool"
tmux has-session -t $session 2> /dev/null
if [ "$?" -eq 1 ] 
then
    DISPLAY=:0 notify-send -t 3000 --urgency=critical --icon=$VIM "Creating $session session"
    tmux start-server
    tmux new-session -d -s $session -n $session 
    tmux selectp -t 1 
		tmux send-keys "cd $path;vim" C-m 
		#tmux send-keys "~/com_sci/Master_code/Robot;ipython --no-autoindent" C-m 
		exec $term -e "tmux attach-session -t $session"
else
    attached=$( tmux ls | grep $session | grep attached)
    if [ -z "$attached" ] 
    then
        killall notify-osd
        DISPLAY=:0 notify-send -t 3000 --urgency=critical --icon=$VIM "Attaching to $session"
				exec $term -e "tmux attach-session -t $session"
    else
        DISPLAY=:0 notify-send -t 3000 --urgency=critical --icon=$VIM "$session"
				name=$(xdotool search -name $session:)  
				i3-msg [id="$name"] focus
    fi
fi


