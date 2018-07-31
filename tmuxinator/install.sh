#!/bin/bash
# https://github.com/tmuxinator/tmuxinator 

prg=tmuxinator
if ! [ -x "$(command -v $prg)" ]; then
	echo "Installing $prg" >&2
	sudo gem install tmuxinator
else
	echo "$prg is already installed" >&2
fi

# Completion
# add the line below to zsrc
echo 
echo "For completion add the following line to zsrc:"
echo \> source ~/.files/tmuxinator/tmuxinator.zsh
echo 


# https://stackoverflow.com/questions/14505047/loop-through-all-the-files-with-a-specific-extension
cd ~/.files/tmuxinator

echo "Creating ~/.config/tmuxinator folder and link .yml files"
mkdir -p ~/.config/tmuxinator
shopt -s nullglob
for i in *.yml; do
	echo "$(realpath $i)"
	ln -sf "$(realpath $i)" ~/.config/tmuxinator
done

echo Done!
