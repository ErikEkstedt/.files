"Settings
setlocal tw=120
setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal expandtab
setlocal autoindent
setlocal foldmethod=indent
setlocal nowrap
" setlocal iskeyword-=_ " makes vim words not include '_'. (dw on start of word) foo_bar -> _bar

" Mappings

" command! HTMLArgEq %s/\s\@<!=\+\s\@!/ \0 /g
"   %s/    - Substitute entire buffer
"   \s\@<! - Not preceded by whitespace
"   =\+    - One or more equal characters
"   \s\@!  - Not followed by whitespace
"   / \0   - Add spaces around the match
"   /g     - Replace globally
nnoremap <buffer> ,= :s/\s\@<!=\+\s\@!/ \0/g<cr>
nnoremap <buffer> ,= :s/\s\@<!=\+\s\@!/ = /g<CR>

if exists("g:loaded_slime")
  nnoremap <buffer> <silent> <cr> vap:<c-u>call slime#send_op(visualmode(), 1)<cr>
endif

if exists('g:slimux_tmux_path')
  " Note: <CR> is indistinguishable from <C-m>
  nnoremap <buffer> <CR> vip:SlimuxREPLSendLine<CR>
  vnoremap <buffer> <CR> :SlimuxREPLSendLine<CR>gv<Esc>zz
endif


nnoremap <space>al gg0v/if __name__<cr>k
nnoremap gm /if __name__<cr>j

let python_highlight_all = 1
