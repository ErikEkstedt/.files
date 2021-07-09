# DotFiles

TODO:
1. stow directly -> `nvim/.config/nvim`
2. move all "install notes", that are not using symlinks, into actual notes
3. test


My dotfiles

Most things are configured around <strong>nvim</strong> and <strong>vim keybindings</strong>.
The settings are used on both Linux (KDE neon / ubuntu) and MacOS

* [NVIM](https://neovim.io/)
- Editor and a way of life
* [Greg Hurrel Youtube Channel](https://www.youtube.com/channel/UCXPHFM88IlFn68OmLwtPmZA)
* [ZSH](https://www.zsh.org/)
- Shell (as instead of bash)
* Community plugins/themes/settings [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)
* [Tmux](https://github.com/tmux/tmux)
- Terminal multiplexer
- Unix mentality use different tools for different uses 
* [thoughtbot crash course on tmux](https://thoughtbot.com/blog/a-tmux-crash-course)
* [FZF](https://github.com/junegunn/fzf)
- Fuzzy finding used in terminal, ranger and nvim
* [lf](https://github.com/ranger/ranger)
- Nice way to copy/move/delete multiple files, visualize structure and (not yet ? preview images)
* [LSD](https://github.com/Peltoche/lsd)
- "The next gen ls command"


## Installation

1. Clone repo 
```bash
cd ~ && git clone https://github.com/ErikEkstedt/.files.git
```

2. Install stow
```bash
sudo apt-get install stow
```
3. Install by symlink through `stow`
```bash
stow */  # Everything except README
```
4. Single link
```bash
stow zsh
```
