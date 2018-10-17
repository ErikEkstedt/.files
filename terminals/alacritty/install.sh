#/bin/bash


# Go to https://github.com/jwilm/alacritty/wiki/Manual-Installation
# for better instructions.


# Install alacritty you are probably on macos and therea are binaries

echo "Install (clone, dependencies and build)? (y/n)"
read answer
if [[ $answer == 'y' || $answer == 'Y'   ]]; then
  echo "Clone git source? (y/n)"
  read answer
  if [[ $answer == 'y' || $answer == 'Y'   ]]; then
    echo "Cloning into home directory..."
    cd ~
    git clone https://github.com/jwilm/alacritty.git
    cd alacritty
  fi

  echo "Check if rustup is up to date (y/n)"
  read answer
  if [[ $answer == 'y' || $answer == 'Y'   ]]; then
    rustup override set stable
    rustup update stable
  fi


  # Dependencies
  echo "Install dependencies and build? (y/n)"
  read answer
  if [[ $answer == 'y' || $answer == 'Y'   ]]; then
    case Darwin in
      Darwin)
        # commands for OS X go here
        echo "Build and copy to /Applications/"
        make app
        cp -r target/release/osx/Alacritty.app /Applications/
        ;;
      Linux)
        # commands for Linux go here
        echo "Install dependencies... (sudo)"
        sudo apt-get install cmake libfreetype6-dev libfontconfig1-dev xclip   
        echo "----------------------------------------"
        echo "Build"
        cargo build --release
        ;;
    esac
  fi
fi


echo "Link config files? (y/n)"
read answer
if [[ $answer == 'y' || $answer == 'Y'   ]]; then
  echo "~/.config/alacritty/alacritty.yml  ->   ~/.files/terminals/alacritty/alacritty.yml"
  mkdir ~/.config/alacritty
  ln -sf ~/.files/terminals/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml
fi

