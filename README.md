# DotFiles

This repository contains my dotfiles and configuration. For each program there
should be a `install.sh` bash file which should be able to automatically install the
correlated program with configuration. This does not always work smoothly but browsing
through the install scripts should provide enough information to get it to work.

## Setup

Most things are configured around <strong>vim/nvim</strong> and <strong>vim keybindings</strong>. Minimize mouse use!
The settings are used on both Linux (KDE neon / ubuntu) and MacOS

Workflow relies on 
* [ZSH](https://www.zsh.org/)
  - Shell (as instead of bash)
  * Community plugins/themes/settings [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)
* [NVIM](https://neovim.io/)
  - Editor and a way of life
  * [Greg Hurrel Youtube Channel](https://www.youtube.com/channel/UCXPHFM88IlFn68OmLwtPmZA)
* [Tmux](https://github.com/tmux/tmux)
  - Terminal multiplexer
  - Unix mentality use different tools for different uses 
  * [thoughtbot crash course on tmux](https://thoughtbot.com/blog/a-tmux-crash-course)
* [Ranger](https://github.com/ranger/ranger)
  - Nice way to copy/move/delete multiple files, visualize structure and preview images
* [FZF](https://github.com/junegunn/fzf)
  - Fuzzy finding used in terminal, ranger and nvim
* [LSD](https://github.com/Peltoche/lsd)
  - "The next gen ls command"





#### Misc
* [Synergy](https://symless.com/synergy)
  - Sometimes use synergy to control multiple computers
* SSH
* Nvidia for machine learning

--------------

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


## Useful tips
Get unicode to clipboard
	echo -ne "\uf026" | xclip -selection clipboard
	echo -ne "\uf026" | pbcopy
