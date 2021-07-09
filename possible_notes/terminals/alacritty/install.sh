#/bin/bash

# Go to https://github.com/jwilm/alacritty/wiki/Manual-Installation
# for better instructions.

# You are probably on macos and there are binaries

echo "Clone alacritty? (y/n)"
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
fi

echo "Update rust? (y/n)"
read answer
if [[ $answer == 'y' || $answer == 'Y'   ]]; then
  rustup override set stable
  rustup update stable
fi

# Dependencies
echo "Install build? (y/n)"
read answer
if [[ $answer == 'y' || $answer == 'Y'   ]]; then
  cd ~/alacritty
  case Darwin in
    Darwin)
      # commands for OS X go here
      # Xcode error -> `xcode-select --install`
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

echo "Link config files? (y/n)"
read answer
if [[ $answer == 'y' || $answer == 'Y'   ]]; then
  echo "~/.config/alacritty/alacritty.yml  ->   ~/.files/terminals/alacritty/alacritty.yml"
  mkdir ~/.config/alacritty
  ln -sf ~/.files/terminals/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml
fi

