"""""""""""Plugins""""""""""""""""""""""""""
"pathogen vim modules stuff
execute pathogen#infect()
filetype plugin indent on
filetype plugin on

"SLIMUX
nnoremap <C-c><C-c> :SlimuxREPLSendLine<CR>
vnoremap <C-c><C-c> :SlimuxREPLSendLine<CR>gv<Esc>zz
vnoremap <C-c><C-s> :SlimuxREPLSendSelection<CR>gv<Esc>zz
nnoremap <C-c><C-x> :SlimuxREPLConfigure<CR>
vnoremap <C-c><C-x> :SlimuxREPLConfigure<CR>

" Calendar
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1

" latex-live-preview
let g:latex_view_general_viewer = 'zathura'
let g:vimtex_view_method = "zathura"
"let g:latex_view_general_options = shellescape("-s -x '" . exepath(v:progpath) . " --servername " . v:servername . " +{%line} {%input}'")
let g:vimtex_complete_recursive_bib = 2

" Ctrl P
let g:ctrlp_show_hidden = 2
let g:ctrlp_map = '<c-f>'
let g:ctrlp_cmd = 'CtrlP /home/erik/com_sci'

" SETTINGS"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=3
set t_Co=256 "Colormode
set term=screen-256color
colorscheme monokai-phoenix
set number "number lines
set timeoutlen=1001 ttimeoutlen=0 " making mode change faster ?
set mouse=a "mouse functionality (like gvim!)
set tw=10001 "no wrapping text onto the next line
set listchars+=precedes:<,extends:> "when nowrap is set-has carroots when a line extends beyond the edge
syntax on "colours!
set backspace=indent,eol,start "makes backspace work in Vim 7.3
set hls "highlighting!
set ruler "for cursor position in the bottom right corner
set incsearch "search begins as soon as you start typing instead of waiting for <ENTER>
set ai! "auto indent
set sessionoptions=blank,buffers,curdir,folds,help,options,tabpages,winsize,resize
set expandtab "no tab characters, spaces instead except with makefiles
autocmd BufReadPost,FileReadPost,BufNewFile [Mm]ake{file,} setlocal noexpandtab
set nobackup
set nowritebackup
set noswapfile
set nocompatible
" (in)Case sensitive search
set ignorecase
set smartcase

"more tabs for my python style
set tabstop=4 
set softtabstop=4
set shiftwidth=4
set smarttab

"""""""""""""""LOOKS""""""""""""""""""""""
" unhighlight comments, and change the search highlight to be non-intrusive
hi Comment cterm=NONE
hi Search ctermfg=1  ctermbg=NONE cterm=bold,underline
hi LineNr ctermfg=grey
hi CursorLineNr ctermfg=45

"""""""""""FUNCTIONS""""""""""""""""""""""
function! ToggleRelativeNumber()
    set relativenumber!
endfunc
map <F10> :call ToggleRelativeNumber()<CR>

" Transparancy ?
let g:transpar=0
function! ToggleTransparency()
    if g:transpar == 0
        hi Normal guibg=NONE ctermbg=NONE
        let g:transpar=1
    else
        colorscheme monokai-phoenix
        hi Comment cterm=NONE
        hi Search ctermfg=1 ctermbg=NONE cterm=bold,underline
        hi LineNr ctermfg=grey
        hi CursorLineNr ctermfg=45
        let g:transpar=0
  endif
endfunc
map <F12> :call ToggleTransparency()<CR>

"""""""""""""""""""Binds""""""""""""""""""""""
" Edit config files
nnoremap <Leader>ev :tabnew ~/.vimrc<CR>
nnoremap <Leader>sv :source ~/.vimrc<CR>

nnoremap <Leader>ez :tabnew ~/.zshrc<CR>
nnoremap <Leader>sz :source ~/.zshrc<CR>

nnoremap <Leader>ei3 :tabnew ~/.config/i3/config<CR>
nnoremap <Leader>si3 :source ~/.config/i3/config<CR>

nnoremap <Leader>er :tabnew ~/.config/ranger/rc.conf<CR>
nnoremap <Leader>sr :source ~/.config/ranger/rc.conf<CR>

nnoremap <Leader>ebib :tabnew ~/Documents/latex/References.bib<CR>
nnoremap <Leader>epy :tabnew ~/.vim/ftplugin/python.vim<CR>
nnoremap <Leader>ete :tabnew ~/.vim/ftplugin/tex.vim<CR>

" Copy / Paste
set pastetoggle=<F2> " System clipboard pastes preserves indentation
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>
nnoremap <C-a> ggvG$
vnoremap <S-u> <C-A>
nnoremap Y y$
nnoremap pw "_viwp
nnoremap pp p

" Copy / Paste from clipboard
nnoremap <C-p> "+p
inoremap <C-p> <Esc>"+pi
vnoremap <C-p> "+p
nnoremap <Space> i <Esc> 
nnoremap G Gzz
nnoremap gh 0
nnoremap gi 0ciw
nnoremap <C-y> "+yy
vnoremap <C-y> "+y
nnoremap <C-e> $
vnoremap <C-e> $
inoremap <C-h> <Esc>i
inoremap <C-l> <Esc>la
vnoremap tp y<Esc>gt<Esc>GpGgTgv<Esc>

" Go to placeholder
nnoremap <C-@> <Esc>/<++><Enter>"_c4l
vnoremap <C-@> <Esc>/<++><Enter>"_c4l
inoremap <C-@> <Esc>/<++><Enter>"_c4l

" move between matches without leaving incremental search.
set wildcharm=<C-z>
cnoremap <expr> <Tab> getcmdtype() == '/' \|\| getcmdtype() == '?' ? '<CR>/<C-r>/' : '<C-z>'
cnoremap <expr> <S-Tab> getcmdtype() == '/' \|\| getcmdtype() == '?' ? '<CR>?<C-r>/' : '<S-Tab>

"Movement
nnoremap <C-h> gT
nnoremap <C-l> gt
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap <C-j> <C-d>
nnoremap <C-k> <C-u>
 
"alternate keys for indenting/unindenting
inoremap <S-Tab> <C-O><LT><LT>
nnoremap <Tab> >>
nnoremap <S-Tab> <LT><LT>
vnoremap <Tab> > gv
vnoremap <S-Tab> <LT>gv

"highlighting extra whitespace from max
"hi def link whiteSpaceError Error
"autocmd Syntax * syn match whiteSpaceError "\(\S\| \)\@<=\t\+"
"autocmd Syntax * syn match whiteSpaceError "\s\+\%#\@<!$"
"Spellcheck
" Functionality
map <F6> :setlocal spell! spelllang=en_us<CR>
cnoreabbrev <expr> h getcmdtype() == ":" && getcmdline() == 'h' ? 'tab help' : 'h'

