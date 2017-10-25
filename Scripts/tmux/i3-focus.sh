Img=~/.files/icons/red-icon.png
VIM=~/.files/icons/vim-icon.png
session="Notes"
tmux has-session -t $session 2> /dev/null
if [ "$?" -eq 1 ] 
then
    DISPLAY=:0 notify-send -t 3000 --urgency=critical --icon=$VIM "Creating $session session"
else
	name=$(xdotool search -name $session)
		i3-msg [id="$name"] focus
		echo $name
fi
