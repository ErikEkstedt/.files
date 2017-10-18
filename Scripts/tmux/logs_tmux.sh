#!/bin/bash
Img=~/.files/icons/red-icon.png
VIM=~/.files/icons/vim-icon.png
session="Logs"
tmux has-session -t $session 2> /dev/null
if [ "$?" -eq 1 ] 
then
    DISPLAY=:0 notify-send -t 3000 --urgency=critical --icon=$VIM "Creating $session session"
    tmux start-server
    # create a new tmux session, starting vWm from a saved session in the new window
    tmux new-session -d -s $session -n vim #"vim -S ~/.vim/sessions/kittybusiness"
    # Select pane 1, set dir to gro (zsh alias) , run vim
    tmux selectp -t 1 
    tmux send-keys "cd ~/Documents/latex/Logs;vim" C-m 
    # Split pane 1 horizontal by 65%, start redis-server
    tmux splitw -h -p 15
    tmux send-keys "~/Documents/latex/Logs;zathura" C-m 
    # Select pane 1
    tmux selectp -t 1
    # Finished setup, attach to the tmux session!
    tmux attach-session -t $session    
else
    attached=$( tmux ls | grep $session | grep attached)
    if [ -z "$attached" ] 
    then
        killall notify-osd
        DISPLAY=:0 notify-send -t 3000 --urgency=critical --icon=$VIM "Attaching to $session"
        tmux attach-session -t $session    
    else
        DISPLAY=:0 notify-send -t 3000 --urgency=critical --icon=$Img "Already attached"
    fi
fi

