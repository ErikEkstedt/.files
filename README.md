# DotFiles

This repository contains all of my dotfiles and configuration. For each program there
should be a `install.sh` bash file which should be able to automatically install the
correlated program with configuration. This does not always work smoothly but browsing
through the install scripts should provide enough information to get it work.

## Installation

1. Clone repo 
```bash
cd ~ && git clone https://github.com/ErikEkstedt/.files.git
```
2. Run install script `~/.files/Install.sh`. This script links to other install scripts
   for different programs. It tries to install zsh, nvim, `conda`, tmux, ..., the basic
   things neede for a life in the terminal. However, I have not put in that much time to
   make this run smoothly and it has to be run a couple of times (conditionals asking to
   install the different programs).

## Setup

Workflow relies on zsh+tmux+nvim+ssh+synergy.
* Most things are configured around <strong>vim/nvim</strong> and <strong>vim keybindings</strong> 
  * Minimize mouse use!
* OS
  * [KDE](https://www.kde.org/)
    * Started on Ubuntu -> [i3-gaps](https://github.com/Airblader/i3)
    * Want a regular desktop wm with good tiling capabilities and keyboard movement
  * My work computer is a Mac and most things have mac/linux agnostic configs.
* SSH: Reach all files from all machines
  * WakeOnLan: Ability to "wake" desktops.
  * sshfs
* Synergy: One keyboard and mouse to control all machines
* Nvidia for machine learning

---------------

<strong>Vim</strong> is by far the best and most comfortable way of coding. However, being
constrained in the terminal has its limitations. It is not [The beginning of infinity](https://en.wikipedia.org/wiki/The_Beginning_of_Infinity) 
until it has broken out from the terminal. This is an ongoing effort in Oni

* <strong>[Oni](https://www.onivim.io/) </strong>
  * (git)(https://github.com/onivim/oni)
  * UI - electron. Nice colors. Nice menus.
  * After some time in Oni getting back to terminal vim felt really good...

--------------

## Useful tips
Get unicode to clipboard
	echo -ne "\uf026" | xclip -selection clipboard
	echo -ne "\uf026" | pbcopy
