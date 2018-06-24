#!/bin/bash
# Install QT

# Download
# wget http://download.qt.io/official_releases/qt/5.7/5.7.0/qt-opensource-linux-x64-5.7.0.run

wget http://download.qt.io/official_releases/online_installers/qt-unified-linux-x64-online.run -P ~/Downloads

# go to download folder and make installer executable
cd ~/Downloads && chmod +x qt-unified-linux-x64-online.run 
# Run installer
./qt-unified-linux-x64-online.run 
