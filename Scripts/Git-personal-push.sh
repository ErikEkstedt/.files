#!/bin/sh
# Nice script from:
# https://github.com/kugaevsky/vim-bundle-update/blob/master/vim-bundle-update.sh 

if [ -z $1 ]
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
        echo cleaning crap...
        exec $Clean &
        echo "Git Push"
		git add .
        git commit -m $1
        git push
	else
		echo "$directory not a git plugin."
	fi
	echo
done
exit 0
