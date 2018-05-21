#!/bin/sh
# Nice script from:
# https://github.com/kugaevsky/vim-bundle-update/blob/master/vim-bundle-update.sh 

dir0="/home/erik/.files"
dir1="/home/erik/phd"
dir2="/home/erik/blog"
dir3="/home/erik/Documents/latex"

for directory in $dir0 $dir1 $dir2 $dir3
do
	echo "Checking for $directory update..."
	if [ -d "$directory/.git" ]
       	then
		cd $directory

		UPSTREAM=${1:-'@{u}'}
		LOCAL=$(git rev-parse @)
		REMOTE=$(git rev-parse "$UPSTREAM")
		BASE=$(git merge-base @ "$UPSTREAM")

		if [ $LOCAL = $REMOTE ]; then
			echo "Up-to-date"
		elif [ $LOCAL = $BASE ]; then
			echo "Need to pull"
		elif [ $REMOTE = $BASE ]; then
			echo "Need to push"
		else
			echo "Diverged"
		fi
        # echo "Git Pull"
		# git pull
	else
		echo "$directory not a git plugin."
	fi
	echo
done
exit 0

