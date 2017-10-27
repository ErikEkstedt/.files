#!/bin/bash
Img=~/.files/icons/red-icon.png
VIM=~/.files/icons/vim-icon.png
tmux has-session -t $0 2> /dev/null
if [ "$?" -eq 1 ] 
then
    DISPLAY=:0 notify-send -t 3000 --urgency=critical --icon=$VIM "Creating $session session"
    tmux start-server
    tmux new-session -d -s $0 -n $0 
    tmux selectp -t 1 
    tmux send-keys "cd ~/.files;vim" C-m 
		exec urxvt -e bash -c "tmux attach-session -t $0"
else
    attached =$( tmux ls | grep $0 | grep attached)
    if [ -z "$attached" ] 
    then
        killall notify-osd
        DISPLAY=:0 notify-send -t 3000 --urgency=critical --icon=$VIM "Attaching to $0"
				exec urxvt -e bash -c "tmux attach-session -t $0"
    else
        DISPLAY=:0 notify-send -t 3000 --urgency=critical --icon=$VIM "$0"
				name=$(xdotool search -name $0:)  
				i3-msg [id="$name"] focus
    fi
fi
