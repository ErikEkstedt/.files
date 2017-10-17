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

for directory in $dir0 $dir1 $dir2 $dir3
do
	echo "Checking for $directory update..."
	if [ -d "$directory/.git" ] 
    then
		cd $directory
        echo cleaning crap in $directory
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
