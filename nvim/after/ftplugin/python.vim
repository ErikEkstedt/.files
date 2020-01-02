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

" Note: <CR> is indistinguishable from <C-m>
nnoremap <buffer> <CR> vip:SlimuxREPLSendLine<CR>
vnoremap <buffer> <CR> :SlimuxREPLSendLine<CR>gv<Esc>zz


nnoremap <space>al ggv/if __name__<cr>k
nnoremap gm /if __name__<cr>j

let python_highlight_all = 1
