# WorkFLow

I should record a video when coding and note all the things I want to fix.

1. Fix iterm sending Left/Down/Up/Right
  - arrow keys are useful in many term applications
  - map to non used keys
  - change tmux mappings in tmux.mac.conf / tmux.iterm.conf

## Vim

* [ ] Pretty Nerdtree colors
* [ ] Shift-Tab

* Quicklist vim
  * [ ] quickfix list over all "#TODO" in python projects.
    - good start: [tasklist.vim](https://github.com/vim-scripts/TaskList.vim)
    - all commented TODO
    - First thing to happen if opening vim in a git repo
* Colorscheme
  - [ ] Ugly colors in json
  - [ ] Nerdtree

Plugins to try?
* [vim-illuminate](https://github.com/RRethy/vim-illuminate)
  - highlight word under cursor
* [coc-highlight](https://github.com/neoclide/coc-highlight)
  - trying now -> disabled 'lilydjwg/colorizer'
  - CocInstall coc-highlight
  - Highlight colors and word
* [Notational-FZF](https://github.com/alok/notational-fzf-vim)
* jump to next operator
  - `nnoremap <leader>o :call search('[+\-\^/*=]')<CR>`
  - `nnoremap <leader>O :call search('[+\-\^/*=]', 'b')<CR>`


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



