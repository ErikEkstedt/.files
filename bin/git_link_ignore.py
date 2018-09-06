#!/usr/bin/python

# same as ./git_link_ignore.sh but in python
# did for error handling and python commandline training

import os
from os.path import join

src = join(os.path.expanduser('~'), '.files', 'git', 'gitignore')
dst = join(os.getcwd(), '.gitignore')

print('source: ', src)
print('destination: ', dst)

try:
    os.symlink(src, dst)
except:
    print('gitignore already exists!')
    ans = input('Overwrite current gitignore? (y/n)')
    if ans == 'y' or ans == 'Y':
        print('force!')
