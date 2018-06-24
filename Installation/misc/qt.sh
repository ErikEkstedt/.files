#!/bin/bash
# Installs QT

# Download
wget http://download.qt.io/official_releases/online_installers/qt-unified-linux-x64-online.run -P ~/Downloads
# go to download folder and make installer executable
cd ~/Downloads && chmod +x qt-unified-linux-x64-online.run 
# Run installer
./qt-unified-linux-x64-online.run 
