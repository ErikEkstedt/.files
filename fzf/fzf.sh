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
	echo "\nSuccess: $prg is installed!" >&2
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


# RIPGREP

echo "Downloading and Installing ripgrep"
case `uname` in
  Darwin)
    brew install ripgrep
    ;;
  Linux)
    echo "Install RipGrep? (y/n)"
    read answer
    if [[ $answer == 'y' || $answer == 'Y'   ]]; then
      curpath=$PWD
      cd /tmp
      echo "Downloading RipGrep..."
      curl -LO https://github.com/BurntSushi/ripgrep/releases/download/0.10.0/ripgrep_0.10.0_amd64.deb
      sudo dpkg -i ripgrep_0.10.0_amd64.deb
      cd $curdir
      echo "Done!"
    fi
    ;;
esac

