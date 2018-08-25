#!/bin/bash

# Git should have a global gitignore in the home
# directory. But in some repos this does not work.

# This is a simple hack to link to a standard
# gitignore file in my dotfiles.

echo "Created .gitignore in $(pwd)"
ln -s ~/.files/git/gitignore $(pwd)/.gitignore
