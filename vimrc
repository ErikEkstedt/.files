""""""""""""" SETTING"""""""""""""""" 
" Standard saving options
let mapleader = ','
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>
" nnoremap <C-q> :wq<CR>
" inoremap <C-q> <Esc>:wq<CR>

" when sudo rights are needed but you did not sudo. 
cmap w!! %!sudo tee > /dev/null %

""""""""" Appearence""""""""""
set laststatus=2 "always show status bar
set term=xterm-256color
set t_Co=256 "Colormode
if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif

syntax on "Color 
set background=dark
colorscheme monokai-phoenix

""""""""""""BASE16"""""""""""""""
"colorscheme base16-monokai
" if filereadable(expand("~/.vimrc_background"))
"    let base16colorspace=256
"    source ~/.vimrc_background
" endif


" unhighlight comments, and change the search highlight to be non-intrusive
" hi Comment cterm=NONE
" hi Search ctermfg=1  ctermbg=NONE cterm=bold,underline
hi LineNr ctermfg=7

set number "number lines
set hls "highlighting!
filetype plugin indent on
filetype plugin on


set wrap
set linebreak "uses 
set bri "wrapped lines keep indentation
set nuw=4 "width of numberline
set listchars+=precedes:<,extends:>,tab:··

""""""""" BEHAVIOUR""""""""""
set mouse=a "mouse functionality 
set timeoutlen=500 "ms to wait for command completion 
set ttimeoutlen=0 " same as timeoutlen but for <Esc> and the like, i dont know. at least esc
set backspace=indent,eol,start "makes backspace work in Vim 7.3
set ai! "auto indent
set incsearch "search begins as soon as you start typing instead of waiting for <ENTER>

set ruler "for cursor position in the bottom right corner
set sessionoptions=blank,buffers,curdir,folds,help,options,tabpages,winsize,resize
set expandtab "no tab characters, spaces instead except with makefiles
"autocmd BufReadPost,FileReadPost,BufNewFile [Mm]ake{file,} setlocal noexpandtab

" vim writes swap files. Disable
set nobackup
set nowritebackup
set noswapfile

" (in)Case sensitive search
set ignorecase
set smartcase

set shiftwidth=4
set tabstop=4
"alternate keys for indenting/unindenting
inoremap <S-Tab> <Esc><LT><LT>i
nnoremap <Tab> >>
nnoremap <S-Tab> <LT><LT>
vnoremap <Tab> > gv
vnoremap <S-Tab> <LT>gv

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

"""""""""""""""""""MAPPINGS""""""""""""""""""""""
" Edit config files
nnoremap <Leader>ev :tabnew ~/.vimrc<CR>
nnoremap <Leader>ez :tabnew ~/.zshrc<CR>
nnoremap <Leader>ei3 :tabnew ~/.config/i3/config<CR>
nnoremap <Leader>er :tabnew ~/.config/ranger/rc.conf<CR>
nnoremap <Leader>ex :tabnew ~/.Xresources<CR>
nnoremap <Leader>et :tabnew ~/.tmux.conf<CR>
nnoremap <Leader>ebib :tabnew ~/Documents/latex/References.bib<CR>
nnoremap <Leader>epy :tabnew ~/.vim/ftplugin/python.vim<CR>
nnoremap <Leader>ete :tabnew ~/.vim/ftplugin/tex.vim<CR>

" Source config files
nnoremap <Leader>si3 :source ~/.config/i3/config<CR>
nnoremap <Leader>sv :source ~/.vimrc<CR>
nnoremap <Leader>sz :source ~/.zshrc<CR>
nnoremap <Leader>sr :source ~/.config/ranger/rc.conf<CR>
nnoremap <Leader>sx :! xrdb ~/.Xresources<CR>
nnoremap <Leader>st :source ~/.tmux.conf<CR>

" Convenience
map <CR> o<Esc>
"map Q @q

" Copy / Paste
set pastetoggle=<F2> " System clipboard pastes preserves indentation
nnoremap <C-a> ggvG$
nnoremap Y y$
nnoremap S viw"0p

" Copy / Paste from clipboard
nnoremap <C-p> "+p
inoremap <C-p> <Esc>"+pi
vnoremap <C-p> "+p
nnoremap <C-y> "+yy
vnoremap <C-y> "+y

"""""""""""""""MOVEMENT"""""""""""""
" move up and down naturally even if lines extends over
" multiple rows
nnoremap <C-h> gT
nnoremap <C-l> gt
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
 
nnoremap <Space> i <Esc> 
nnoremap G Gzz
nnoremap gh 0
nnoremap gi 0ciw
vnoremap tp y<Esc>gt<Esc>GpGgTgv<Esc>

" Go to placeholder
nnoremap <C-@> <Esc>/<++><Enter>"_c4l
vnoremap <C-@> <Esc>/<++><Enter>"_c4l
inoremap <C-@> <Esc>/<++><Enter>"_c4l

" wildchar
set wildmenu
set wildchar=<Tab>

"highlighting extra whitespace from max
hi def link whiteSpaceError Error
"autocmd Syntax * syn match whiteSpaceError "\(\S\| \)\@<=\t\+"
"autocmd Syntax * syn match whiteSpaceError "\s\+\%#\@<!$"

"Spellcheck
" Functionality
map <F6> :setlocal spell! spelllang=en_us<CR>
" h <space> becomes tab help <space> as to open help in new tab (instead of split)
cnoreabbrev <expr> h getcmdtype() == ":" && getcmdline() == 'h' ? 'tab help' : 'h'

" autocmd. 
autocmd BufEnter *.tex call SetTexColor()
function! SetTexColor()
    set background=light
    let g:solarized_termcolors=256
    " use lightline-solarized in lightline
    let g:lightline = {
        \ 'colorscheme': 'lightline_solarized',
        \ }
    colorscheme solarized
endfunction

" Compile on initialization, cleanup on quit
augroup vimtex_event_1
    au!
    au User VimtexEventQuit     call vimtex#compiler#clean(0)
augroup END

"""""""""""PLUGINS""""""""""""""""""""
"pathogen vim modules stuff
execute pathogen#infect()

" slimux.vim
nnoremap <C-c><C-c> :SlimuxREPLSendLine<CR>
vnoremap <C-c><C-c> :SlimuxREPLSendLine<CR>gv<Esc>zz
nnoremap <C-c><C-x> :SlimuxREPLConfigure<CR>
vnoremap <C-c><C-x> :SlimuxREPLConfigure<CR>

" Calendar.vim
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1

" vimtex.vim
let g:latex_view_general_viewer = 'zathura'
let g:vimtex_view_method = "zathura"
"let g:latex_view_general_options = shellescape("-s -e '" . exepath(v:progpath) . " --servername " . v:servername . " +{%line} {%input}'")
let g:vimtex_complete_recursive_bib = 2

" CtrlP.vim
let g:ctrlp_show_hidden = 2 
nnoremap <Leader>f :CtrlP<CR>
nnoremap <Leader>fm :CtrlPMRU<CR>
let g:ctrlp_map = ''

"fugitive.vim
nnoremap <Leader>ga :Gwrite<CR>
nnoremap <Leader>gc :Gcommit<CR>
nnoremap <Leader>gp :Gpush<CR>

" " vim-netrw
let g:netrw_banner = 0 "no banner
let g:netrw_liststyle = 3 
let g:netrw_sort_sequence = '[\/]$,*' " sort is affecting only: directories on the top, files below
nnoremap <Leader>tt :Texplore<CR>
nnoremap <Leader>ee :Explore<CR>

" lightline - statusline
let g:lightline = {'colorscheme': 'wombat',}
set noshowmode

" Tabular
vnoremap <silent> <Leader>ce :Tabularize /=<CR>
vnoremap <silent> <Leader>ct :Tabularize /#<CR>

