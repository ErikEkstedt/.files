#!/bin/bash

##############################
#########  Not Done  #########
#########  Not Done  #########
##############################

# Colors
Red='\033[0;31m'
Yellow='\033[1;33m'
NC='\033[0m' # No Color
function printSection() {
	printf "${Yellow}"
	echo "-----------------------------------------------------"
	printf "$1"
	printf "${NC}\n\n"
}

# This is meant to be script that installs ssh and checks if
# public keys and config exists and links config files and
# creates a key if necessary

# SSH Client and Server
# echo "Update system and 'apt install' openssh-server/client"
# sudo apt-get upgrade -y
# sudo apt-get install openssh-client -y

# Check if openssh server was installed and is running
echo "----------------------------------------"
keyFile="sshd"
echo "Checking if $keyFile is running..."
if [[ $(ps -A | grep sshd) ]]; then
    echo "SSHD is running"
else
    echo "SSHD is NOT running AT ALL"
fi

prg="openssh-server"
printSection $prg
if [[ $(apt list --installed | grep $prg) ]]; then
    echo "$prg is installed"
else
    echo "$prg is NOT installed"
	echo "Do you wish to install $prg? (y/n)"
	read answer
	if [[ $answer == 'y' || $answer == 'Y'   ]]; then
		sudo apt-get install openssh-server -y
	fi
fi

printf "${Yellow}"
echo "----------------------------------------"
echo "Checking if private key exists"
rsaPub=~/.ssh/id_rsa.pub
if [[ -e $rsaPub ]]; then
    echo "Public key exists"
else

    echo "Public key does NOT NOT NOT exists"
	# Generate key with email as label
	echo "What label to use when generating key? (email)"
	echo "Label: "
	printf "${NC}"

	read answer
	ssh-keygen -t rsa -b 4096 -C $answer

	printf "${Yellow}"
	echo ""
	echo 'eval ssh-agent -s)'
	echo 'ssh-add ~/.ssh/id_rsa'
	echo 'Copy rsa key to clipboard'
	echo 'Go to github -> settings -> add gpg/ssh'
	printf "${NC}"
	eval "$(ssh-agent -s)"
	ssh-add ~/.ssh/id_rsa
	xclip -sel clip < ~/.ssh/id_rsa.pub  # copies id to clipboard (sudo apt install xclip)
fi

# echo "Checking if config exists"
# sshConfigFile=~/.ssh/config
# if [[ -e $sshConfigFile ]]; then
#     echo "Config exists"
# else
#     echo "Config does NOT NOT NOT exists"
# fi

