#!/usr/bin/python3

import shutil
from os.path import join, expanduser
import glob

HOME = expanduser('~')
src = join(HOME, '.files', 'firefox', 'userChrome.css')

dst = glob.glob(join(HOME, '.mozilla/firefox/**/chrome'))[0]
dst = join(dst, 'userChrome.css')

print(f'Copying:\n {src} -> {dst}')

shutil.copy(src, dst)
