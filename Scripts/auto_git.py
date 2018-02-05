import sys
import os
from subprocess import call
from pathlib import Path

import json
from pprint import pprint

# path = os.path.join(os.path.realpath(__file__), 'common/folder.json')

# path= '/home/erik/.files/Scripts/common/data.json'
# data = json.load(open(path))
# pprint(data)
# print('-'*80)
# print(data)

act = 'push'
act = sys.argv[1]

path_of_script = sys.argv[0]
folders = ['.files', 'Documents/latex/Notes/Thesis']
prefix = str(Path.home())
for f in folders:
    tmp_dir = os.path.join(prefix, f)
    # if os.path.isdir(tmp_dir) and os.path.exists(os.path.join(tmp_dir, '.git')):
    if os.path.isdir(tmp_dir):
        print('='*80)
        print()
        print(tmp_dir)
        os.chdir(tmp_dir)
        print()
        print('='*80)
        if act in 'pull':
            print('Git pull:\t {}'.format(f))
            print('='*80)
            call(["git", "pull"])
        elif act in 'push':
            print('Git push:\t {}'.format(f))
            print('='*80)
            call(["git", "add", "."])
            call(["git", "status", "."])
            msg = input('Commit msg: ')
            call(["git", "commit", "-m", msg])
            call(["git", "push"])
        else:
            call(["git", "status"])
        print('='*80)
