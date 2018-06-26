#!/bin/bash

case `uname` in
  Darwin)
    # commands for OS X go here
	prg=latex
	if ! [ -x "$(command -v $prg)" ]; then
		echo
		echo "Downloading and installing $prg..." >&2
		echo
		wget http://tug.org/cgi-bin/mactex-download/MacTeX.pkg -P ~/Downloads
		cd ~/Downloads && open MacTeX.pkg
	else
		echo "Success: $prg is installed." >&2
	fi
	prg=zathura
	if ! [ -x "$(command -v $prg)" ]; then
		# https://github.com/zegervdv/homebrew-zathura
		echo
		echo "Downloading and installing $prg..." >&2
		echo
		brew cask install xquartz
		brew tap zegervdv/zathura
		brew install --HEAD meson
		brew install zathura
	else
		echo "Success: $prg is installed." >&2
	fi
  ;;
  Linux)
	sudo apt-get install -y texlive-full latexmk
  ;;
esac
