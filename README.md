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

# [i3](i3/config)

* If window is Terminal `focus` window -> shift-alt-hjkl
	* else: alt-hjkl


* Send-keys to $PLAYER container (youtube/spotify).
	* Space in vim - pause/play

# Vim

[Nvim](.nvim)  |  [vim](.vim)

* Combine folders for vim and nvim
	* Use same settings

- [ ] Markdown and latex in tmux split

## Useful tips
Get unicode to clipboard
	echo -ne "\uf026" | xclip -selection clipboard
