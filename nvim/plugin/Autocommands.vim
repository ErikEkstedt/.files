" AUTOCOMMANDS

" Syntax for json comments (jsonc) (coc-vim)
autocmd FileType json syntax match Comment +\/\/.\+$+


" Syntax for Dockerfile (Dockerfile.WHATEVER)
autocmd BufNewFile,BufRead Dockerfile* set syntax=dockerfile

" Automatically resize when vim changes
au VimResized * exe "normal! \<c-w>="

" exit quickfix when exiting buffer {{{
" aug qfclose
" 	au!
" 	au winenter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&buftype") == "quickfix"|q|endif
" aug end "}}}

if exists('##TextYankPost')
  autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank('DiffText', 500)
endif


augroup vimStartup
    au!

    " https://github.com/vim/vim/blob/eaf35241197fc6b9ee9af993095bf5e6f35c8f1a/runtime/defaults.vim#L108-L117
    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid, when inside an event handler
    " (happens when dropping a file on gvim) and for a commit message (it's
    " likely a different one than last time).
    autocmd BufReadPost *
      \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
      \ |   exe "normal! g`\""
      \ | endif

  augroup END
