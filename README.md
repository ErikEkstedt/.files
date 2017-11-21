# DotFiles

## Directories
* [Installation](https://github.com/eeckee/.files/tree/master/Installation "Installation directory")
* [Scripts](https://github.com/eeckee/.files/tree/master/Scripts "Scripts used in mostly i3/bash")
* [i3](https://github.com/eeckee/.files/tree/master/i3 "i3 config directory")
* [ranger](https://github.com/eeckee/.files/tree/master/ranger "Ranger config directory")
* [vim](https://github.com/eeckee/.files/tree/master/vim "Vim config directory")
* [icons](https://github.com/eeckee/.files/tree/master/icons "Icons for notify-send")
* [Wallpapers](https://github.com/eeckee/.files/tree/master/Wallpapers "Some wallpapers that are nice as default")


# Todo:
- [ ] Steal background colors from base16-monokai, they be nice
- [x] FIX colors in ranger... -> Base16
- [ ] Write terminal installation script.
- [ ] Script that starts a terminal and run mountdesk and ssh to desktop. 
- [x] Scripts for tmux: Notes, logs, todo, calendar.
- [x] Tweak the tmux scripts so if its attached i3 focuses on that container.
- [ ] Fix Calendar vim - might help in productivty / goals.


# .VIMRC

## Python-Ide
1. [python-ide]( https://github.com/jarolrod/vim-python-ide )
	- [x] Installed python-mode
		* Had problem with ´import git, vim´
2. [python-ide]( https://github.com/ets-labs/python-vimrc )

## 
* Camelstyle and the other style vim objects (cw, dw ,...)

* RST
	* Syntax for rst
	* Preview

## Snippets
snips

## Vim
- [ ] Look into a way for vimtex to open preview in tmux.
- [ ] Latex ftplugin does not work? a function that sets linebreak and textwidth.
  - tried to add linebreak whenever using a tex file. but i dont want linebreak in code. tried to add code in ftplugin tex.vim.
- [ ] [vim-man](https://github.com/vim-utils/vim-man) - Read man files in vim. A nice way of open man pages in vim from terminal.


## Useful tips
Get unicode to clipboard
	echo -ne "\uf026" | xclip -selection clipboard
