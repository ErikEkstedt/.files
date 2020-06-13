" Deoplete
" Use deoplete.

if !exists("g:deoplete#_initialized")
  finish
endif

let g:deoplete#enable_at_startup = 1

" Time
let g:deoplete#auto_complete_delay = 1
let g:deoplete#auto_refresh_delay= 1
let g:deoplete#min_pattern_length = 1

" Size
let g:deoplete#max_abbr_width = 40
let g:deoplete#max_menu_width = 40
let g:deoplete#max_list = 10
let g:loaded_neopairs = 1
let g:neopairs#enable = 1

" Deoplete and vimtex
if !exists('g:deoplete#omni#input_patterns')
    let g:deoplete#omni#input_patterns = {}
endif

le
let g:deoplete#omni#input_patterns.tex = g:vimtex#re#deoplete

" Selection menu colors
hi Pmenu guibg=#24282e guifg=#00fbff
hi PmenuSel guibg=#272a30 gui=NONE guifg=#ff00f3
hi PmenuSbar guibg=#000000
hi PmenuThumb guibg=#FF00DE

" Mappings
" deoplete tab/s-tab/c-j/c-k complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr><S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr><C-j> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr><C-k> pumvisible() ? "\<C-p>" : "\<S-Tab>"

nnoremap <leader>dd :call deoplete#toggle()<CR>
nnoremap <leader>D :call deoplete#enable()<CR>

" Function
"close the preview window after completion is done.
autocmd CompleteDone * pclose!

" Enable deoplete when enter vim
autocmd VimEnter * :call deoplete#enable()

call deoplete#custom#source('ultisnips', 'rank', 9999)
" :call deoplete#custom#source('_', 'sorters', ['sorter_word'])
" :call deoplete#custom#source('_', 'converters', ['converter_auto_paren'])
