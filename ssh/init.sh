#!/bin/bash


# SSH Client and Server
# sudo apt-get upgrade
# sudo apt-get install openssh-client
# sudo apt-get install openssh-server

# Check
ps -A | grep sshd

rsaPub=~/.ssh/id_rsa.pub
if [ ! -f "$rsaPub" ]
then
    echo "$0: File '${file}' not found."
else

    echo "$0: File '${file}' found."
fi
sshConfigFile="/.ssh/config"
