#!/bin/bash

###########
# FZF/ FD #
###########

prg=fzf
if ! [ -x "$(command -v $prg)" ]; then
	echo Installing fzf
	git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
	~/.fzf/install
else
	echo
	echo "Success: $prg is installed!" >&2
fi

echo "Downloading and Installing fd"
case `uname` in
	Darwin)
		brew install fd
	;;
	Linux)
		# https://github.com/sharkdp/fd/releases
		wget https://github.com/sharkdp/fd/releases/download/v7.0.0/fd-musl_7.0.0_amd64.deb ~/Downloads -P ~/Downloads -q
		cd ~/Downloads && sudo dpkg -i fd-musl_7.0.0_amd64.deb -y
	;;
esac

