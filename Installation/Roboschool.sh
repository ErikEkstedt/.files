#!/bin/bash


###################################################
# THIS IS NOT DONE.. IT DOES NOT WORK OUT OF THE BOX YET.....
###################################################

###################################################
# THIS IS NOT DONE.. IT DOES NOT WORK OUT OF THE BOX YET.....
###################################################


# First time installing everything it went wrong. Just make sure the folder in `setup.py` in $ROBOSCHOOL_PATH exists. just copy files to the right place.

# Create a virtual environment with python3.5
echo "######################################################"
echo "Making a new virtual environment called `robo`" 
echo "######################################################"
conda create -n robo python=3.5 -yy
echo
echo
echo "######################################################"
echo "source robo"
source activate robo

echo 
echo 
echo 
echo "######################################################"
echo "Installing some ML dependencies"
echo " Tensorflow, PyTorch"
pip install gym['all'] -yy
pip install tensorflow-gpu -yy
conda install pytorch torchvision cuda80 -c soumith -yy

echo 
echo 
echo 
echo "######################################################"
echo "install libcupti-dev..."
sudo apt-get install libcupti-dev

echo 
echo 
echo 
echo 
echo "######################################################"
echo "I like to install roboschool in the environment directory.."
echo "cd ~/anaconda3/envs/robo/lib/python3.5/site-packages/ "
# export a path variable `ROBOSCHOOL_PATH=/path/to/roboschool`
echo "ROBOSCHOOL_PATH=/home/erik/anaconda3/envs/robo/site-packages/roboschool"
export ROBOSCHOOL_PATH=/home/erik/anaconda3/envs/robo/lib/python3.5/site-packages/roboschool


# Install dependencies (Ubuntu)
sudo apt install cmake ffmpeg pkg-config qtbase5-dev libqt5opengl5-dev libassimp-dev libpython3.5-dev libboost-python-dev libtinyxml-dev -yy

# clone roboschool repo
echo "Cloning Roboschool repo..."
git clone https://github.com/openai/roboschool.git $ROBOSCHOOL_PATH
echo "Done!"
echo
echo

# Install bullet
echo "Installing bullet..."
git clone https://github.com/olegklimov/bullet3 -b roboschool_self_collision
mkdir bullet3/build
cd    bullet3/build
cmake -DBUILD_SHARED_LIBS=ON -DUSE_DOUBLE_PRECISION=1 -DCMAKE_INSTALL_PREFIX:PATH=$ROBOSCHOOL_PATH/roboschool/cpp-household/bullet_local_install -DBUILD_CPU_DEMOS=OFF -DBUILD_BULLET2_DEMOS=OFF -DBUILD_EXTRAS=OFF  -DBUILD_UNIT_TESTS=OFF -DBUILD_CLSOCKET=OFF -DBUILD_ENET=OFF -DBUILD_OPENGL3_DEMOS=OFF ..
make -j4
make install
cd ../..

echo "Done with bullet"
echo
echo
echo


# Pip install project

pip install -e $ROBOSCHOOL_PATH

###################################################
# THIS IS NOT DONE.. IT DOES NOT WORK OUT OF THE BOX YET.....
###################################################
