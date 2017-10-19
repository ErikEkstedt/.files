#!/bin/bash

#read -p "Please Enter a commit comment: '\n'> " uservar
read -p "Please Enter a commit message: `echo '\n> '`" uservar
if [ -z "$uservar" ]
then
    echo "Empty commit comment. Abort..."
    exit 0
fi

Clean="/home/erik/.files/Scripts/clear.sh"
dir0="/home/erik/.files"
dir1="/home/erik/com_sci/Master_code/Robot"
dir2="/home/erik/Documents/latex"
dir3="/home/erik/com_sci/Master_code/Learning"
dir4="/home/erik/com_sci/Ideas/Computer_interface"
dir5="/home/erik/com_sci/Ideas/ParamMass"

Img=~/.files/icons/red-icon.png
for directory in $dir0 $dir1 $dir2 $dir3
do
	echo "Git push from $directory..."
	if [ -d "$directory/.git" ] 
    then
		cd $directory
        killall notify-osd
        DISPLAY=:0 notify-send -t 2000 --urgency=critical --icon=$Img "Cleaning crap in $directory"
        exec $Clean &
        echo "Git Push"
		git add .
        git commit -m "$uservar"
        git push
	else
		echo "$directory not a git plugin."
	fi
	echo
done
exit 0
