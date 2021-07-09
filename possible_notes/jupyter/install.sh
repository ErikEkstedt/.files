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

echo "Install jjupyter-vim bindings? (y/n)"
read answer
if [[ $answer == 'y' || $answer == 'Y'   ]]; then
  nbext_dirname=$(jupyter --data-dir)/nbextensions
  echo Create dir $nbext_dirname if it does not exists
  # Create required directory in case (optional)
  mkdir -p $nbext_dirname
  echo "Clone the repository"
  cd $(jupyter --data-dir)/nbextensions
  git clone https://github.com/lambdalisue/jupyter-vim-binding vim_binding
  echo "Activate the extension"
  jupyter nbextension enable vim_binding/vim_binding
fi
