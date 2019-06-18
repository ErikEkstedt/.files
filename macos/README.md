# MacOs

## Todo

* [Fixed] fix coc -> hangs
  - node version buggy
* copy/paste tmux/ranger on macos


### Neovim:

Download tar, save in home directory and link ~/.local/bin/nvim

´´´bash
cd ~
https://github.com/neovim/neovim/releases/download/nightly/nvim-macos.tar.gz
tar xzf nvim-macos.tar.gz
./nvim-osx64/bin/nvim

ln -s nvim-osx64/bin/nvim ~/.local/bin/nvim
´´´


### Hammerspoon

Hammerspoon is a great tool which I now use as a window manager


### Terminal

**Alacritty**
- Special keys: 
  * alt + =   -> ~
  * alt shift /  -> \
  * special keys broken after update
- Font
  - Check font book.app for names
  - Use correct style (Bold/Oblique etc) from font\ book.app

**iTerm**
* Special keys for tmux (alt+HJKL)
  - Now remapped to Left/Down/Up/Right
  - `titerm`  -> sources tmux settings to bind Left/Down/Up/Right to move between splits
  - Remap to buttons never used
  - Breaks using arrow keys on commandline (most troublesome ranger)
