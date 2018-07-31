#!/bin/bash

mkdir -p ~/.config/ranger  # does not delete if already exists

# ln -sf  = symbolic link, forced (removes existing file)
echo "Creating ~/.config/ranger directory and links"
echo "-> rifle.conf" 
ln -sf ~/.files/ranger/rifle.conf ~/.config/ranger/rifle.conf

echo "-> scope.sh" 
ln -sf ~/.files/ranger/scope.sh ~/.config/ranger/scope.sh

echo "-> commands.py" 
ln -sf ~/.files/ranger/commands.py ~/.config/ranger/commands.py


# Installs Devicons (if directory does not exist)
if [ -d  ~/.config/ranger/ranger_devicons ]; then
	echo "Ranger devicons already cloned"
else
	echo "Downloading and installing RANGER DEVICONS"
	git clone https://github.com/alexanderjeurissen/ranger_devicons.git ~/.config/ranger/ranger_devicons
	cd ~/.config/ranger/ranger_devicons && make install
fi

case `uname` in
    Darwin)
		# Switch rc file for macos rc file
		ln -sf ~/.files/ranger/macrc.conf ~/.config/ranger/rc.conf
            ;;
    Linux)
		ln -sf ~/.files/ranger/rc.conf ~/.config/ranger/rc.conf
        ;;
esac

