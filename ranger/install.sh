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
    echo "Use Macos conf (macrc.conf)"
    ln -sf ~/.files/ranger/macrc.conf ~/.config/ranger/rc.conf
    ;;
  Linux)
    echo "-> rc.conf" 
    ln -sf ~/.files/ranger/rc.conf ~/.config/ranger/rc.conf
    ;;
esac

# Replace just the line that differs (mac vs linux). However, I use links so this is not exactly what I want.
#Create temporary file with new line in place
# cat ~/.files/ranger/rc.conf | sed -e "s/set preview_images_method w3m/set preview_images_method iterm/" > /tmp/ranger_conf_mac_tmp
# cp /tmp/ranger_conf_mac_tmp ~/.config/ranger/rc.conf
