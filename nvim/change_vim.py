#!/usr/bin/env python

from os.path import join, expanduser, exists
from os import listdir, symlink, remove, rename
import shutil


def link_regular():
    """ Link regular vim """
    print("Slim Vim -> Regular Vim")

    # Dotvim
    src = join(expanduser("~"), "DOTVIM")
    dst = join(expanduser("~"), ".vim")
    if exists(dst):
        remove(dst)
    rename(src, dst)
    print(f"Renamed: {src} -> {dst}")

    # Config
    src = join(expanduser("~"), ".files/nvim")
    dst = join(expanduser("~"), ".config/nvim")
    if exists(dst):
        remove(dst)
    symlink(src, dst, target_is_directory=True)
    print(f"Linked {src} -> {dst}")


def link_slim():
    """ Link slim vim"""
    print("Regular Vim -> Slim Vim")

    # Save Regular dotvim
    src = join(expanduser("~"), ".vim")
    dst = join(expanduser("~"), "DOTVIM")
    rename(src, dst)
    print(f"Renamed: {src} -> {dst}")

    # Slim Dotvim
    src = join(expanduser("~"), ".files/nvim_slim/vim_home_dir")
    dst = join(expanduser("~"), ".vim")
    if exists(dst):
        remove(dst)
    symlink(src, dst, target_is_directory=True)
    print(f"Linked: {src} -> {dst}")

    # Config
    src = join(expanduser("~"), ".files/nvim_slim/vim_config_dir")
    dst = join(expanduser("~"), ".config/nvim")
    if exists(dst):
        remove(dst)
    symlink(src, dst, target_is_directory=True)
    print(f"Linked: {src} -> {dst}")


conf_path = join(expanduser("~"), ".config/nvim")
dotvim_path = join(expanduser("~"), ".vim")

if exists(dotvim_path):
    slim = [f for f in listdir(dotvim_path) if f == "slim"]
    slim = True if len(slim) > 0 else False
    if slim:
        link_regular()
    else:
        print("Regular Vim -> Slim Vim")
        link_slim()
else:
    link_regular()
