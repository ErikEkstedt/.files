#/bin/bash
# https://github.com/tmuxinator/tmuxinator 

prg=tmuxinator
if ! [ -x "$(command -v $prg)" ]; then
	echo "Installing $prg" >&2
	gem install tmuxinator
else
	echo "$prg is already installed" >&2
fi

# Completion
# add the line below to zsrc
echo 
echo "For completion add the following line to zsrc:"
echo \> source ~/.files/tmuxinator/tmuxinator.zsh
echo 

echo -----------------------------------------------
echo "Creating ~/.config/tmuxinator folder and links"
echo ln -sf ~/.files/tmuxinator/dropdown.yml ~/.config/tmuxinator
echo ln -sf ~/.files/tmuxinator/WORK.yml ~/.config/tmuxinator

# TODO
# Loop&Link all .yml files from target dir to $HOME/.config/tmuxinator
mkdir -p ~/.config/tmuxinator
ln -sf ~/.files/tmuxinator/dropdown.yml ~/.config/tmuxinator
ln -sf ~/.files/tmuxinator/WORK.yml ~/.config/tmuxinator
ln -sf ~/.files/tmuxinator/project.yml ~/.config/tmuxinator

echo Done!
