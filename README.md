# DotFiles

## Installation

1. Clone repo 
```bash
cd ~ && git clone https://github.com/ErikEkstedt/.files.git
```
2. Run install script.  
```bash
~/.files/Install.sh
```

3. Customize appearance
  * [Appearance.md](./Installation/appearance.md)

## Setup

Workflow relies on zsh+tmux+vim/+ssh+synergy.
* Most things are configured around <strong>vim/nvim</strong> and <strong>vim keybindings</strong> 
  * Minimize mouse use!
* Used [i3-gaps](https://github.com/Airblader/i3) but currently on [kde](https://www.kde.org/)
  * Want a regular desktop wm with good tiling capabilities and keyboard movement
* SSH: Reach all files from all machines
  * WakeOnLan: Ability to "wake" desktops.
* Synergy: One keyboard and mouse to control all machines
* Nvidia for machine learning

---------------

<strong>Vim</strong> is by far the best and most comfortable way of coding. However, being
constrained in the terminal has its limitations. It is not [The beginning of infinity](https://en.wikipedia.org/wiki/The_Beginning_of_Infinity) 
until it has broken out from the terminal. This is an ongoin effort in Oni

* <strong>Oni</strong>
  * UI - electron. Nice colors. Nice menus.
  * After some time in Oni getting back to terminal vim felt really good...
  * Checkout **regulary**. Reactly Terminal Nvim with all gui functionalities -> really powerful. 

--------------
## Useful tips
Get unicode to clipboard
	echo -ne "\uf026" | xclip -selection clipboard
	echo -ne "\uf026" | pbcopy
