"Settings
" indentation for python
setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal expandtab
setlocal autoindent
setlocal foldmethod=indent
setlocal nowrap

" Mappings

" command! HTMLArgEq %s/\s\@<!=\+\s\@!/ \0 /g
"   %s/    - Substitute entire buffer
"   \s\@<! - Not preceded by whitespace
"   =\+    - One or more equal characters   
"   \s\@!  - Not followed by whitespace
"   / \0   - Add spaces around the match
"   /g     - Replace globally
nnoremap ,= :s/\s\@<!=\+\s\@!/ \0/g<cr>
nnoremap ,= :s/\s\@<!=\+\s\@!/ = /g<CR>

" colon at the end of the line 
nnoremap Ö A:<esc>

" Note: <CR> is indistinguishable from <C-m>
nnoremap <buffer> <CR> vip:SlimuxREPLSendLine<CR> 
vnoremap <buffer> <CR> :SlimuxREPLSendLine<CR>gv<Esc>zz
