#!/bin/bash
#Node install/upgrade (exists on ubuntu)
#   Also installs npm
#   https://www.sitepoint.com/beginners-guide-node-package-manager/

echo "Install Node? (y/n)"
read answer
if [[ $answer == 'y' || $answer == 'Y'   ]]; then
  echo "Installing Node"
  curl -sL https://deb.nodesource.com/setup_9.x | sudo -E bash -
  sudo apt-get install -y nodejs
fi

echo "Install npm? (y/n)"
read answer
if [[ $answer == 'y' || $answer == 'Y'   ]]; then
  # change global modules directory and reinstall npm there
  echo "Installing npm and setting global prefix"
  cd ~ && mkdir .node_modules_global
  npm config set prefix=$HOME/.node_modules_global
  npm install npm --global

  # update npm
  npm install npm@latest -g
fi

echo "Install Yarn (y/n)"
read answer
if [[ $answer == 'y' || $answer == 'Y'   ]]; then
  echo "Installing yarn"
  # Install Yarn:  https://yarnpkg.com/lang/en/docs/install/#debian-stable
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
  sudo apt-get update && sudo apt-get install yarn
fi

