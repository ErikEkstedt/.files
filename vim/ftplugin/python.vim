" imports
" PyTorch
inoremap ;to import torch<CR>import torch.nn as nn<CR>import torch.optim as optim<CR>from torch.autograd import Variable<CR>import torch.nn.functional as F<Esc>o<Esc>o
inoremap ;cl class (<++>):<CR>'''<++>'''<CR>def __init__(self,<++>):<CR>super(<++>,self).__init__()<Esc>3k6hi

" main
inoremap ;ma if __name__ == '__main__':<CR>

" main
inoremap ;in input('Press Enter to continue')<CR>

" main
inoremap ;ma if __name__ == '__main__':<CR>

" Go to next/previous Python method or class (PyMode)
nnoremap gj :call pymode#motion#move('^\s*def\s', '')<CR>zz
nnoremap gk :call pymode#motion#move('^\s*def\s', 'b')<CR>zz
nnoremap gJ :call pymode#motion#move('^\s*class\s', '')<CR>zz
nnoremap gK :call pymode#motion#move('^\s*class\s', 'b')<CR>zz

nnoremap ,= :s/\s\@<!=\+\s\@!/ \0/g<cr>
nnoremap ,= :s/\s\@<!=\+\s\@!/ = /g<CR>

" command! HTMLArgEq %s/\s\@<!=\+\s\@!/ \0 /g
"   %s/    - Substitute entire buffer
"   \s\@<! - Not preceded by whitespace
"   =\+    - One or more equal characters   
"   \s\@!  - Not followed by whitespace
"   / \0   - Add spaces around the match
"   /g     - Replace globally

" <CR> is indistinguishable from <C-m>
nnoremap <buffer> <CR> vip:SlimuxREPLSendLine<CR> 
vnoremap <buffer> <CR> :SlimuxREPLSendLine<CR>gv<Esc>zz

" indentation for python
setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal expandtab
setlocal autoindent
setlocal foldmethod=indent
setlocal nowrap
