#!/bin/bash

echo "IPython"
echo "Link IPython configs? (y/n)"
read answer
if [[ $answer == 'y' || $answer == 'Y'   ]]; then
	echo "Linking ipython config -> .ipython/profile_default/ipython_config.py"
	ln -sf ~/.files/ipython/ipython_config.py ~/.ipython/profile_default/ipython_config.py
fi

echo "Jupyter"
echo "Link jupyter configs? (y/n)"
read answer
if [[ $answer == 'y' || $answer == 'Y'   ]]; then
	echo "Linking jupyter config -> .jupyter/jupyter_notebook_config.py"
	ln -sf ~/.files/ipython/jupyter_notebook_config.py ~/.jupyter/jupyter_notebook_config.py
fi
