#!/bin/sh
# Nice script from:
# https://github.com/kugaevsky/vim-bundle-update/blob/master/vim-bundle-update.sh 

cd ~/.vim/bundle

for directory in `ls ~/.vim/bundle`
do
    echo "----------------------------------------"
	echo "Checking for $directory update..."
	if [ -d "$directory/.git" ]
       	then
		cd $directory
		git pull
		cd ..
	else
		echo "$directory not a git plugin. Skipping update."
	fi
	echo
done

echo "Updating fzf"
cd ~/.fzf && git pull && ./install
exit 0
