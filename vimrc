
"""""""""""plugins""""""""""""""""""""
"pathogen vim modules stuff
filetype off
execute pathogen#infect()
"helptags

filetype plugin on
filetype plugin indent on
syntax on "color

"""""""""""""settings"""""""""""""""" 
" encoding
scriptencoding utf-8
set encoding=utf-8

" oh dear leader
let mapleader = ','

" standard saving options
nnoremap <c-s> :w<cr>
inoremap <c-s> <esc>:w<cr>
nnoremap <c-q> :q!<cr>
inoremap <c-q> <esc>:wq<cr>

" when sudo rights are needed but you did not sudo. 
cmap w!! %!sudo tee > /dev/null %

""""""""" appearence""""""""""
" enable all python syntax highlighting features
let python_highlight_all = 1

set laststatus=2 "always show status bar
set term=xterm-256color
set t_co=256 "colormode
if &term =~ "256color"
	"hello
	" disable background color erase (bce) so that color schemes
	" render properly when inside 256-color tmux and gnu screen.
	" see also http://snk.tuxfamily.org/log/vim-256color-bce.html
	set t_ut=
endif

if has('termguicolors')
	" don't need this in xterm-256color, but do need it inside tmux.
	" (see `:h xterm-true-color`.)
	if &term =~# 'tmux-256color'
		let &t_8f="\e[38;2;%ld;%ld;%ldm"
		let &t_8b="\e[48;2;%ld;%ld;%ldm"
	endif
endif

" colors
"set background=dark
colorscheme monokai-phoenix

" syntax error color
hi error ctermfg=161 ctermbg=016 guifg=#eeeeee guibg=#5f00ff

" signalcolumn
hi signcolumn ctermbg=16

if has('folding')
	if has('windows')
		set fillchars=vert:┃ " line with no breaks between vertical splits
	endif
	set foldmethod=indent "fast but dumb. not relying on syntax. fast
	set foldlevelstart=-1 " start with unfold everything
	set foldclose="all"
endif

""""""""basic options"""""""""""
set ruler "for cursor position in the bottom right corner
set number "number lines
set scrolloff=7 " visual rows above and below cursor
set sidescroll=3 " visual columns on sides of cursor
set cursorline " highlight line where cursor is
set hls "highlighting!
" " figure out highlightning. this affecter breakindentopt 'bg hl'
"set highlight+=@:colorcolumn 
"set highlight+=c:linenr
"set highlight+=n:difftext

set wrap
set linebreak " break lines if window is too narrow
set formatoptions+=j " smart line joining. uncomments comments.

set lazyredraw " don't redraw screen during macros
set breakindent "wrapped line s keep indentation (set bri)
let &showbreak="↪ "
set breakindentopt=shift:0 "how far in the breakindent showbreak should be
set nuw=4 "width of numberline

" set list
" " note : maybe if there was no highlighting on charactars.
" " 		also try to remove highlight from breakindentopt highlight+=@:colorcolumn
" set listchars=trail:• " trail character. if whitespace at end.
" set listchars+=tab:▷- " character for tab
" set listchars+=extends:» " character if text extends beyond line
" set listchars+=precedes:« "  character if text extends beyond line on next line
"
""""""""" behaviour""""""""""
set mouse=a "mouse functionality 
set timeoutlen=300 "ms to wait for command completion 
set ttimeoutlen=0 " don't wait for <esc>
set backspace=indent,eol,start " backspace over spaces
set ai! "auto indent
set incsearch "search starts when typing instead of waiting for <enter>
set sessionoptions=blank,buffers,curdir,folds,help,options,tabpages,winsize,resize

set virtualedit=block
" vim writes swap files. disable
set nobackup
set nowritebackup
set noswapfile

" (in)case sensitive search
set ignorecase
set smartcase
set tabstop=4
set shiftwidth=4
set switchbuf=usetab

" wildchar
set wildmenu
set wildchar=<tab>

" interesting for colors. (urxvt and wal)colors becomes that of terminal.
" if has('termguicolors')
" 	set termguicolors
" endif
"
"""""""""""functions""""""""""""""""""""""
""" transparancy 
let g:transpar=0
function! Toggletransparency()
	if g:transpar == 0
		hi normal guibg=none ctermbg=none
		let g:transpar=1
	else
		colorscheme monokai-phoenix
        hi signcolumn ctermbg=16
		hi comment cterm=none
		hi search ctermfg=1 ctermbg=none cterm=bold,underline
		hi linenr ctermfg=grey
		hi cursorlinenr ctermfg=45
		let g:transpar=0
	endif
endfunc
map <f12> :call Toggletransparency()<cr>

""" focusmode
function! Togglefocusmode()
	if (&foldcolumn != 12)
		set laststatus=0
		set numberwidth=10
		set foldcolumn=12
		set noruler
		hi foldcolumn ctermbg=none
		hi linenr ctermfg=0 ctermbg=none
		hi nontext ctermfg=0
	else
		set laststatus=2
		set numberwidth=4
		set foldcolumn=0
		set ruler
		execute 'colorscheme ' . g:colors_name
	endif
endfunc
nnoremap <f1> :call Togglefocusmode()<cr>



"""""""""""autocommands"""""""""""""""""
" " open nerdtree on startup
" autocmd vimenter * nerdtree
"
" " autocmd. 
" autocmd bufenter *.tex call Settexcolor()
" autocmd bufenter *.tex set foldmethod=manual
" 	
function! Settexcolor()
	set background=light
	let g:solarized_termcolors=256
	" use lightline-solarized in lightline
	let g:lightline = {
				\ 'colorscheme': 'lightline_solarized',
				\ }
	colorscheme solarized
endfunction

" function to exit quickfix when exiting buffer
aug qfclose
  au!
  au winenter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&buftype") == "quickfix"|q|endif
aug end

" compile on initialization, cleanup on quit
augroup vimtex_event_1
	au!
	au user vimtexeventquit     call vimtex#compiler#clean(0)
augroup end

" indentation for python
au! bufnewfile,bufread *.py
    set tabstop=4
	set softtabstop=4
	set shiftwidth=4
	set textwidth=79
	set expandtab
	set autoindent
	set fileformat=unix

" indentation for js, htmlm css
au bufnewfile,bufread *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

"""""""""""""""""""mappings""""""""""""""""""""""
" edit config files
" mak function that opens vimrc in vsplit left after changing the layout to
" fullscreen (i3?).
nnoremap <leader>ev :vsplit ~/.vimrc<cr>
nnoremap <leader>ez :tabnew ~/.zshrc<cr>
nnoremap <leader>ei3 :tabnew ~/.config/i3/config<cr>
nnoremap <leader>er :tabnew ~/.config/ranger/rc.conf<cr>
nnoremap <leader>ex :tabnew ~/.xresources<cr>
nnoremap <leader>et :tabnew ~/.tmux.conf<cr>
nnoremap <leader>ebib :tabnew ~/documents/latex/references.bib<cr>
nnoremap <leader>epy :tabnew ~/.vim/ftplugin/python.vim<cr>
nnoremap <leader>ete :tabnew ~/.vim/ftplugin/tex.vim<cr>

" source config files
nnoremap <leader>si3 :source ~/.config/i3/config<cr>
nnoremap <leader>sv :source ~/.vimrc<cr>
nnoremap <leader>sz :source ~/.zshrc<cr>
nnoremap <leader>sx :! xrdb ~/.xresources<cr>
nnoremap <leader>st :source ~/.tmux.conf<cr>

" run scripts
nnoremap <leader>r :! urxvt -e python % &<cr><cr>

" go to next comment (in pymode at least)
nnoremap <leader>w :lnext<cr>
inoremap <leader>w <esc>:lnext<cr>

" easier next paren
nnoremap <leader>w :lnext<cr>
inoremap <leader>w <esc>:lnext<cr>

" indent entire file
inoremap <leader>i <esc>gg=g<c-o>
nnoremap <leader>i gg=g<c-o>

" command line change text font
inoremap <leader>å <esc>:hi normal ctermfg=255<cr>
nnoremap <leader>å :hi normal ctermfg=255<cr>

" try map öä
map ö {
map ä }


" abbreviations
cnoreabbrev Wq wq
cnoreabbrev WQ wq
cnoreabbrev <expr> h getcmdtype() == ":" && getcmdline() == 'h' ? 'tab help' : 'h'
cnoreabbrev <expr> q getcmdtype() == ":" && getcmdline() == 'q' ? 'q' : 'q'

" convenience
map <cr> o<esc>
noremap q @q

"alternate keys for indenting/unindenting
inoremap <s-tab> <esc><lt><lt>i
nnoremap <tab> >>
nnoremap <s-tab> <lt><lt>
vnoremap <s-tab>   <gv
vnoremap <tab> >gv|

" tab
nnoremap <silent> <c-t> :<c-u>tabnew<cr>
inoremap <silent> <c-t> <esc>:<c-u>tabnew<cr>
nnoremap <silent> g0 :<c-u>tabfirst<cr>
nnoremap <silent> g$ :<c-u>tablast<cr>

" select last paste
nnoremap <expr> gp '`['.strpart(getregtype(), 0, 1).'`]'

" swap line/normal visual mode
noremap v v
noremap v v

" copy / paste
set pastetoggle=<f2> " system clipboard pastes preserves indentation
nnoremap <c-a> ggvg$
nnoremap y y$
nnoremap s viw"0p

" copy / paste from clipboard
nnoremap <c-p> "+p
inoremap <c-p> <esc>"+pi
vnoremap <c-p> "+p
nnoremap <c-y> "+yy
vnoremap <c-y> "+y

nnoremap <f10> :set relativenumber!<cr>
"""""""""""""""movement"""""""""""""
" move up and down naturally even if lines 
" extends over multiple rows
nnoremap <c-h> <c-w><c-h>
nnoremap <c-l> <c-w><c-l>
nnoremap <c-k> <c-w><c-k>
nnoremap <c-j> <c-w><c-j>

inoremap <c-h> <esc><c-w><c-h>i
inoremap <c-l> <esc><c-w><c-l>i
inoremap <c-j> <esc><c-w><c-j>i
inoremap <c-k> <esc><c-w><c-k>i

vnoremap <c-h> <esc><c-w><c-h>gv
noremap <c-l> <esc><c-w><c-l>gv
vnoremap <c-j> <esc><c-w><c-j>gv
vnoremap <c-k> <esc><c-w><c-k>gv

nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

nnoremap <space> i <esc> 
nnoremap G gzz
nnoremap gh 0
nnoremap gi 0ciw
vnoremap tp y<esc>gt<esc>gpggtgv<esc>

" " vim-netrw
let g:netrw_banner = 0 "no banner
let g:netrw_liststyle = 3 
let g:netrw_sort_sequence = '[\/]$,*' " sort is affecting only: directories on the top, files below
nnoremap <leader>tt :texplore<cr>
nnoremap <leader>ee :explore<cr>
nnoremap <leader>vv :vexplore<cr>
nnoremap <leader>hh :hexplore<cr>

nnoremap <leader>sr :SyntasticReset<cr>
nnoremap <leader>st :SyntasticTogglemode<cr>
nnoremap <leader>sc :SyntasticCheck<cr>
nnoremap <leader>lc :lclose<cr>
nnoremap <leader>lo :errors<cr>

" go to placeholder
" nnoremap <c-@> <esc>/j<enter>"_c4l
" vnoremap <c-@> <esc>/<++><enter>"_c4l
" inoremap <c-@> <esc>/<++><enter>"_c4l

nnoremap gj <esc>/<++><enter>"_c4l
vnoremap gj <esc>/<++><enter>"_c4l
inoremap gj <esc>/<++><enter>"_c4l

"spellcheck
map <f6> :setlocal spell! spelllang=en_us<cr>
" h <space> becomes tab help <space> as to open help in new tab (instead of split)

" slimux.vim
nnoremap <c-c><c-c> :slimuxreplsendline<cr>
vnoremap <c-c><c-c> :slimuxreplsendline<cr>gv<esc>zz
nnoremap <c-c><c-x> :slimuxreplconfigure<cr>
vnoremap <c-c><c-x> :slimuxreplconfigure<cr>

" calendar.vim
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1

" vimtex.vim
let g:latex_view_general_viewer = 'zathura'
let g:vimtex_view_method = "zathura"
"let g:latex_view_general_options = shellescape("-s -e '" . exepath(v:progpath) . " --servername " . v:servername . " +{%line} {%input}'")
let g:vimtex_complete_recursive_bib = 2

" ctrlp.vim
let g:ctrlp_show_hidden = 2 
nnoremap <leader>f :ctrlp<cr>
nnoremap <leader>fm :ctrlpmru<cr>
let g:ctrlp_map = ''

"fugitive.vim
nnoremap <leader>ga :gwrite<cr>
nnoremap <leader>gco :gcommit<cr>
nnoremap <leader>gpu :gpush<cr>

" lightline - statusline
"let g:lightline = {'colorscheme': 'wombat',}
let g:lightline = {'colorscheme': 'powerline',}
set noshowmode "stops vims own showing below the statusbar.

" tabular
vnoremap <silent> <leader>ce :tabularize /=<cr>
vnoremap <silent> <leader>ct :tabularize /#<cr>

" youcompleteme
let g:ycm_python_binary_path = '/home/erik/anaconda3/bin/python3'
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :ycmcompleter gotodefinitionelsedeclaration<cr>
let g:ycm_min_num_of_chars_for_completion = 0

" syntastic
" recommended settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatusLineFlag()}
set statusline+=%*

let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_python_checkers =  ["flake8" ]
let g:syntastic_loc_list_height = 4

" indentline
let g:indentline_filetypeexclude=['help']
let g:indentline_char = '┊'

" nerdtree
map <c-n> :nerdtreetoggle<cr>
let g:nerdtreeshowgitstatus = 1
let g:nerdtreeupdateonwrite = 1
let g:nerdtreeindicatormapcustom = {
    \ "modified"  : "✹",
    \ "staged"    : "✚",
    \ "untracked" : "✭",
    \ "renamed"   : "➜",
    \ "unmerged"  : "═",
    \ "deleted"   : "✖",
    \ "dirty"     : "✗",
    \ "clean"     : "✔︎",
    \ "unknown"   : "?"
    \ }

" python syntax ~/.vim/syntax/python.vim 
let python_highlight_all = 1


