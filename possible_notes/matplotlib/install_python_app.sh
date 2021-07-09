#!/bin/bash

# When using matplotlib on MacOS
# python complains about installing python.app
# this script does that.

which_python=$(which python)
dirname=$(dirname "${which_python}")

echo "Which python to link over?"
echo "Python: $which_python"
echo "DIR: $dirname"

echo "Install python.app? (y/n)"
read answer
if [[ $answer == 'y' || $answer == 'Y'   ]]; then
	echo "conda install -c anaconda python.app"
	conda install -c anaconda python.app
	echo "cd into env bin path"
	cd $dirname
	echo " mv python ->  pythonBEFORE_PYTHON_APP_INSTALL"
	mv python pythonBEFORE_PYTHON_APP_INSTALL
	echo "ln -s pythonw python"
	ln -s pythonw python
fi
