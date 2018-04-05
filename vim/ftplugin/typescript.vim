inoremap ;r (req, res) => {<CR><CR>}<esc>ki<tab>
inoremap ;R (req, res) => {<CR><CR>}<esc>ki<tab>

if exists("g:gui_oni")
    :call deoplete#disable()
endif
