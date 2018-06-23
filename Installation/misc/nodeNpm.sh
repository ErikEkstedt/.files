#!/bin/bash
#Node install/upgrade (exists on ubuntu)
#   Also installs npm
#   https://www.sitepoint.com/beginners-guide-node-package-manager/

echo "Install Node & npm"
curl -sL https://deb.nodesource.com/setup_9.x | sudo -E bash -
sudo apt-get install -y nodejs

# change global modules directory and reinstall npm there
cd ~ && mkdir .node_modules_global
npm config set prefix=$HOME/.node_modules_global
npm install npm --global

# update npm
npm install npm@latest -g
