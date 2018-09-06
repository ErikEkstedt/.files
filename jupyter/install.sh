#!/bin/bash

echo "Jupyter"



echo "Create .jupyter/custom? (y/n)"
read answer
if [[ $answer == 'y' || $answer == 'Y'   ]]; then
	mkdir -p ~/.Jupyter/custom
	ln -sf ~/.files/jupyter/custom/custom.js ~/.jupyter/custom/custom.js
fi

echo "Link jupyter configs? (y/n)"
read answer
if [[ $answer == 'y' || $answer == 'Y'   ]]; then
	echo "Linking jupyter config -> .jupyter/jupyter_notebook_config.py"
	ln -sf ~/.files/jupyter/jupyter_notebook_config.py ~/.jupyter/jupyter_notebook_config.py

	echo "Linking jupyter qtconfig config -> .jupyter/jupyter_qtconsole_config.py"
	ln -sf ~/.files/jupyter/jupyter_qtconsole_config.py ~/.jupyter/jupyter_qtconsole_config.py
fi
