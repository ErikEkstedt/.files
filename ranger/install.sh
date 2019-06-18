#!/bin/bash

root=~/.files/ranger
conf_dir=~/.config/ranger

echo "Creating conf_dir directory and links"
mkdir -p $conf_dir  # does not delete if already exists

# ln -sf $root/rifle.conf $conf_dir/rifle.conf
cat $root/rifle.conf > $conf_dir/rifle.conf
echo "  -created rifle.conf" 

# ln -sf $root/scope.sh $conf_dir/scope.sh
cat $root/scope.sh > $conf_dir/scope.sh
echo "  -created scope.sh" 

# ln -sf $root/commands.py $conf_dir/commands.py
cat $root/commands.py > $conf_dir/commands.py
echo "  -created commands.py" 

# Installs Devicons (if directory does not exist)
if [ -d  $conf_dir/ranger_devicons ]; then
	echo "Ranger devicons already cloned"
else
	echo "Downloading and installing RANGER DEVICONS"
	git clone https://github.com/alexanderjeurissen/ranger_devicons.git $conf_dir/ranger_devicons
	cd $conf_dir/ranger_devicons && make install
fi

case `uname` in
  Darwin)
    echo "Use Macos conf (macrc.conf)"
    cat $root/rc_super.conf $root/rc_mac.conf > $conf_dir/rc.conf
    ;;
  Linux)
    echo "-> rc.conf" 
    cat $root/rc_super.conf $root/rc_linux.conf > $conf_dir/rc.conf
    ;;
esac

# Replace just the line that differs (mac vs linux). However, I use links so this is not exactly what I want.
#Create temporary file with new line in place
# cat $root/rc.conf | sed -e "s/set preview_images_method w3m/set preview_images_method iterm/" > /tmp/ranger_conf_mac_tmp
# cp /tmp/ranger_conf_mac_tmp conf_dir/rc.conf
