#!/bin/bash
term="termite"

function tlist {
	session=$( tmux list-sessions | rofi -dmenu -i -p 'Tmux Sessions: ' )
	s=$(echo $session | cut -f 1 -d ' ')

	# check escape
	if [ -z "$session" ]; then
		exit 1
	fi

	ans=$( echo -e "Kill\nAttach" | rofi -dmenu -i -p "Wish to (K)ill or (A)ttach $session? " )
	if [ $ans == 'K' ] || [ $ans == 'Kill' ] ; then
		# echo "killing $session"
		tmux kill-session -t "$s"
	else
		# echo "attaching $session"
		exec $term -e "tmux attach-session -t $s"
	fi
	tlist
}
tlist
