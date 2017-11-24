#!/bin/bash

# First time installing everything it went wrong. Just make sure the folder in `setup.py` in $ROBOSCHOOL_PATH exists. just copy files to the right place.

# Create a virtual environment with python3.5
conda create -n robo python=3.5 -yy

# export a path variable `ROBOSCHOOL_PATH=/path/to/roboschool`

export ROBOSCHOOL_PATH=/home/erik/roboschool


# Install dependencies (Ubuntu)
sudo apt install cmake ffmpeg pkg-config qtbase5-dev libqt5opengl5-dev libassimp-dev libpython3.5-dev libboost-python-dev libtinyxml-dev -yy

# clone roboschool repo
git clone https://github.com/openai/roboschool.git $ROBOSCHOOL_PATH


# Install bullet
git clone https://github.com/olegklimov/bullet3 -b roboschool_self_collision
mkdir bullet3/build
cd    bullet3/build
cmake -DBUILD_SHARED_LIBS=ON -DUSE_DOUBLE_PRECISION=1 -DCMAKE_INSTALL_PREFIX:PATH=$ROBOSCHOOL_PATH/roboschool/cpp-household/bullet_local_install -DBUILD_CPU_DEMOS=OFF -DBUILD_BULLET2_DEMOS=OFF -DBUILD_EXTRAS=OFF  -DBUILD_UNIT_TESTS=OFF -DBUILD_CLSOCKET=OFF -DBUILD_ENET=OFF -DBUILD_OPENGL3_DEMOS=OFF ..
make -j4
make install
cd ../..


# Pip install project

pip install -e $ROBOSCHOOL_PATH





