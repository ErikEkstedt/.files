#!/usr/bin/env python

'''
Dependencies:
    tree (sudo apt install tree)

-----------------------
Skeleton project maker.

Creates:
    * files:
        * README.md
        * blog.md
    * dir:
        *images


Uses a zsh-function ($HOME/.files/zsh/zsh-functions.zsh) in order to cd into
the created project folder.

´´´zsh
function init-project() {
	if [[ $1 ]]; then
		project-init.py $1
		cd $1
	else
		echo "No project name..."
		echo "Please add a name as argument"
	fi
}
´´´

'''

from pathlib import Path
import os
import sys
import re

cwd = os.getcwd()
if len(sys.argv) > 1:
    dirname = sys.argv[1]
    dirname = os.path.join(cwd, dirname)
else:
    print('WARNING')
    print('No name of project\nExit')
print('-'*50)

if not os.path.exists(dirname):
    os.makedirs(dirname)
    os.makedirs(os.path.join(dirname, "images"))
    os.makedirs(os.path.join(dirname, "code"))
    Path(os.path.join(dirname, 'README.md')).touch()
    print('Created skeleton for project: ', dirname)
    os.chdir(dirname)
    print()
    print(dirname+':')
    os.system('tree')
    print()
    print('-'*50)
else:
    print("Directory already exists")

