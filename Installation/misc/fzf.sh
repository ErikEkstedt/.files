#!/bin/bash
# This is an installer for fzf and fd
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# go to:
#    https://github.com/sharkdp/fd/releases
echo "Downloading and Installing fd"
wget https://github.com/sharkdp/fd/releases/download/v7.0.0/fd-musl_7.0.0_amd64.deb ~/Downloads -P ~/Downloads -q
cd ~/Downloads && sudo dpkg -i fd-musl_7.0.0_amd64.deb -y

