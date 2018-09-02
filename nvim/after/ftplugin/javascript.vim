" Settins
" indentation for python
setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2

" Mappings
inoremap <buffer> ;r (req, res) => {<CR><CR>}<esc>ki<tab>
inoremap <buffer> ;R (req, res) => {<CR><CR>}<esc>ki<tab>
nnoremap <buffer> Ö A;<esc>

inoremap <buffer> ;co console.log('')<esc>hi


:UltiSnipsAddFiletypes javascript.html
