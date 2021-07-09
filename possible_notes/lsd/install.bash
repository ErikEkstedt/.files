#!/bin/bash

wget https://github.com/Peltoche/lsd/releases/download/0.18.0/lsd-musl_0.18.0_amd64.deb
sudo dpkg -i lsd-musl_0.18.0_amd64.deb
rm lsd-musl_0.18.0_amd64.deb
