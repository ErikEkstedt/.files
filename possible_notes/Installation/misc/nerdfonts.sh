#!/bin/bash
echo "Cloing nerdfonts repo and installing fonts"
echo "Notice: This step takes some time..."
cd ~ && git clone --depth 1 https://github.com/ryanoasis/nerd-fonts.git
cd nerd-fonts && ./install.sh -y
