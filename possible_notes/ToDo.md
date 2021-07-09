# WorkFLow

I should record a video when coding and note all the things I want to fix.

1. Fix iterm sending Left/Down/Up/Right
  - arrow keys are useful in many term applications
  - map to non used keys
  - change tmux mappings in tmux.mac.conf / tmux.iterm.conf

# Color
  - Transparency
    - vim: nvim/colors/transparency.vim
    - tmux: tmux/themes/transparency.tmuxtheme

## Vim

* New vim-lsp
* Coc errors disrupt airline
* [ ] Shift-Tab

* Colorscheme
  - [ ] Ugly colors in json
  - [ ] Ugly colors in markdown
  - [ ] Nerdtree
* Quicklist vim
  * how to populate a quicklist
  * what keybindings to use for fast navigation?
  * [ ] quickfix list over all "#TODO" in python projects.
    - good start: [tasklist.vim](https://github.com/vim-scripts/TaskList.vim)
    - all commented TODO
    - First thing to happen if opening vim in a git repo

Plugins to try?
* jump to next operator (trying now)
  - `nnoremap <leader>o :call search('[+\-\^/*=]')<CR>`
  - `nnoremap <leader>O :call search('[+\-\^/*=]', 'b')<CR>`


## Tmux

* Make move window work on visual mode
  - [x] tmux: alt-hjkl
  - [ ] vim: alt-hjkl

## ZSH

* [ ] `[oh-my-zsh] plugin 'zsh-autosuggestions' not found`
* [ ] zsrc
  - source `tmux_iterm.conf`

* Plugins?
  - how download script


## Ranger

* Image preview MacOs - Iterm

---------------

### Record all keystrokes

This is too painstakenly boring to implement buyt would be cool

[Capture all keys in vim](http://vim.wikia.com/wiki/Capture_all_keys)

ML models/Tool:
- data is the keystrokes
- labels are the
  - files visited during keystrokes
- save all files to date.keylog
- save all visited buffers
  - used as labels for keypresses
  - au bufEnter
  - if not empty
- Track the changes over time
   - Version Control
   - Use version control as a language model
- pause over threshold make new paragraph in keylog

---------------



