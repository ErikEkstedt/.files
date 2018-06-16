#!/bin/bash
SESSION=$1
# PROJECT=$2

# echo "project: $SESSION"
echo "project:" 
# echo "project: $PROJECT"
# cd $PROJECT

cd ~/phd/projects/project0

tmux -2 new-session -d -s $SESSION
tmux rename-window -t $SESSION:0 Code
tmux split-window  -t $SESSION:0 -h
tmux resize-pane -t $SESSION:0 -R 30

tmux new-window -t $SESSION -a -n blog
tmux new-window -t $SESSION -a -n terminal

tmux select-window -t $SESSION:0

tmux select-pane -t $SESSION:0 -t 0
tmux send-keys -t $SESSION:blog "cd ~/blog/public/notes" Enter
tmux send-keys -t $SESSION:terminal "ls" Enter
tmux -2 attach -t $SESSION
