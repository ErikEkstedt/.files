# DotFiles

## Installation
1. Clone repo 
```bash
cd ~ && git clone https://github.com/ErikEkstedt/.files.git
```
2. Run install script 
```bash
~/.files/Install.sh
```
3. Customize appearance
  * [Appearance.md](./Installation/appearance.md)

## Setup

Workflow relies on zsh+tmux+vim/oni+ssh+synergy.
* Most things are configured around <strong>vim/nvim</strong> and <strong>vim keybindings</strong> 
  * Minimize mouse use	
* Used [i3-gaps](https://github.com/Airblader/i3) but currently on [kde](https://www.kde.org/)
  * Want a regular desktop wm with good tiling capabilities and keyboard movement
* SSH: Reach all files from all machines
  * WakeOnLan: Ability to "wake" desktops.
* Synergy:_ One machine to to control all machines.
* Nvidia for machine learning

---------------

**Trying out:** 
* Oni
  * <strong>Vim</strong> is by far the best and most comfortable way of coding
  * UI - electron. Nice colors. Nice menus.
  * After some time in Oni getting back to terminal vim felt really good...
  * Even switched to VSCode to do some webdev

<strong>Web-dev:</strong>
* VSCode
* Vim-plugin makes it on the surface really great. But 
* Has really great built-in support for web-dev

--------------
## Useful tips
Get unicode to clipboard
	echo -ne "\uf026" | xclip -selection clipboard

