#!/bin/sh
# Nice script from:
# https://github.com/kugaevsky/vim-bundle-update/blob/master/vim-bundle-update.sh 

dir0="/home/erik/.files"
dir1="/home/erik/com_sci/Master_code/Robot"
dir2="/home/erik/Documents/latex"

for directory in $dir0 $dir1 $dir2
do
	echo "Checking for $directory update..."
	if [ -d "$directory/.git" ]
       	then
		cd $directory
        echo "Git Pull"
		git pull
	else
		echo "$directory not a git plugin."
	fi
	echo
done
exit 0
