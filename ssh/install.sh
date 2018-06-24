#!/bin/bash

##############################
#########  Not Done  #########
#########  Not Done  #########
##############################

# This is meant to be script that installs ssh and checks if
# public keys and config exists and links config files and
# creates a key if necessary

# SSH Client and Server
# echo "Update system and 'apt install' openssh-server/client"
# sudo apt-get upgrade -y
# sudo apt-get install openssh-client -y
# sudo apt-get install openssh-server -y

# Check if openssh server was installed and is running
echo "----------------------------------------"
keyFile="sshd"
echo "Checking if $keyFile is running..."
if [[ $(ps -A | grep sshd) ]]; then
    echo "SSHD is running"
else
    echo "SSHD is NOT running AT ALL"
fi

echo "----------------------------------------"
keyFile="openssh-server"
echo "Checking if $keyFile is installed..."
if [[ $(apt list --installed | grep $keyFile) ]]; then
    echo "$keyFile is installed"
else
    echo "$keyFile is NOTNOTNOTNOT installed"
fi

echo "----------------------------------------"
echo "Checking if private key exists"
rsaPub=~/.ssh/id_rsa.pub
if [[ -e $rsaPub ]]; then
    echo "Public key exists"
else
    echo "Public key does NOT NOT NOT exists"
fi

echo "Checking if config exists"
sshConfigFile=~/.ssh/config
if [[ -e $sshConfigFile ]]; then
    echo "Config exists"
else
    echo "Config does NOT NOT NOT exists"
fi
