" Deoplete {{{
" Use deoplete.
let g:deoplete#enable_at_startup = 1
let g:deoplete#max_abbr_width = 40
let g:deoplete#max_menu_width = 40
let g:deoplete#auto_complete_delay = 5
let g:deoplete#auto_refresh_delay= 5
let g:deoplete#min_pattern_length = 1

" let g:loaded_neopairs = 1
" let g:neopairs#enable = 1

" deoplete tab/s-tab/c-j/c-k complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr><S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr><C-j> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr><C-k> pumvisible() ? "\<C-p>" : "\<S-Tab>"

nnoremap <leader>dd :call deoplete#toggle()<CR>
nnoremap <leader>D :call deoplete#enable()<CR>

" Deoplete and vimtex
if !exists('g:deoplete#omni#input_patterns')
    let g:deoplete#omni#input_patterns = {}
endif

let g:deoplete#omni#input_patterns.tex = g:vimtex#re#deoplete

"close the preview window after completion is done.
autocmd CompleteDone * pclose!

call deoplete#custom#source('_', 'sorters', ['sorter_word'])
call deoplete#custom#source('ultisnips', 'rank', 9999)
call deoplete#custom#source('_', 'converters', ['converter_auto_paren'])
"}}}
