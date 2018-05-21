#!/usr/bin/env python
import sys
import os
import subprocess
from subprocess import call
from pathlib import Path

from pprint import pprint


def getStatus():
    # a  = call(["git", "status"])
    # print('printing a: ', a)
    cmd = "git status"
    ps = subprocess.Popen(cmd,shell=True,stdout=subprocess.PIPE,stderr=subprocess.STDOUT)
    output = ps.communicate()[0]
    # print(output)
    print(len(output))
    if len(output) > 105:
        print(output.decode("utf-8"))
    else:
        print("Synced!")

act = 'push'
act = sys.argv[1]

path_of_script = sys.argv[0]
folders = ['.files', 'blog', 'phd']
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
            getStatus()
        print('='*80)
