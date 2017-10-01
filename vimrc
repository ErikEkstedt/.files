""""""""""""" SETTING"""""""""""""""" 
"pathogen vim modules stuff
filetype off
execute pathogen#infect()
Helptags
filetype plugin on
filetype plugin indent on
syntax on "Color

" encoding
scriptencoding utf-8
set encoding=utf-8

" Oh dear leader
let mapleader = ','

" Standard saving options
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>
nnoremap <C-q> :q!<CR>
inoremap <C-q> <Esc>:wq<CR>

" when sudo rights are needed but you did not sudo. 
cmap w!! %!sudo tee > /dev/null %

""""""""" Appearence""""""""""
" enable all Python syntax highlighting features
let python_highlight_all = 1

set laststatus=2 "always show status bar
set term=xterm-256color
set t_Co=256 "Colormode
if &term =~ "256color"
	"hello
	" disable Background Color Erase (BCE) so that color schemes
	" render properly when inside 256-color tmux and GNU screen.
	" see also http://snk.tuxfamily.org/log/vim-256color-bce.html
	set t_ut=
endif

if has('termguicolors')
	" Don't need this in xterm-256color, but do need it inside tmux.
	" (See `:h xterm-true-color`.)
	if &term =~# 'tmux-256color'
		let &t_8f="\e[38;2;%ld;%ld;%ldm"
		let &t_8b="\e[48;2;%ld;%ld;%ldm"
	endif
endif

"set background=dark
colorscheme monokai-phoenix


if has('folding')
	if has('windows')
		set fillchars=vert:┃ " line with no breaks between vertical splits
	endif
	set foldmethod=indent "fast but dumb. Not relying on syntax. FAST
	set foldlevelstart=-1 " Start with unfold everything
	set foldclose="all"
endif

""""""""Basic Options"""""""""""
set ruler "for cursor position in the bottom right corner
set number "number lines
set scrolloff=7 " Visual rows above and below cursor
set sidescroll=3 " Visual columns on sides of cursor
set cursorline " highlight line where cursor is
set hls "highlighting!
" " Figure out highlightning. this affecter breakindentopt 'bg hl'
"set highlight+=@:ColorColumn 
"set highlight+=c:LineNr
"set highlight+=N:DiffText

set wrap
set linebreak " break lines if window is too narrow
set formatoptions+=j " smart line joining. uncomments comments.

set lazyredraw " Don't redraw screen during macros
set breakindent "wrapped line s keep indentation (set bri)
let &showbreak="↪ "
set breakindentopt=shift:0 "how far in the breakindent showbreak should be
set nuw=4 "width of numberline

" set list
" " Note : maybe if there was no highlighting on charactars.
" " 		also try to remove highlight from breakindentopt highlight+=@:ColorColumn
" set listchars=trail:• " Trail character. If whitespace at end.
" set listchars+=tab:▷- " Character for tab
" set listchars+=extends:» " Character if text extends beyond line
" set listchars+=precedes:« "  Character if text extends beyond line on next line
"
""""""""" BEHAVIOUR""""""""""
set mouse=a "mouse functionality 
set timeoutlen=500 "ms to wait for command completion 
set ttimeoutlen=0 " Don't wait for <esc>
set backspace=indent,eol,start " Backspace over spaces
set ai! "auto indent
set incsearch "search starts when typing instead of waiting for <ENTER>
set sessionoptions=blank,buffers,curdir,folds,help,options,tabpages,winsize,resize

set virtualedit=block
" vim writes swap files. Disable
set nobackup
set nowritebackup
set noswapfile

" (in)Case sensitive search
set ignorecase
set smartcase
set tabstop=4
set shiftwidth=4
set switchbuf=usetab

" wildchar
set wildmenu
set wildchar=<Tab>

" Interesting for colors. Coors becomes that of terminal.
" if has('termguicolors')
" 	set termguicolors
" endif
"
"""""""""""FUNCTIONS""""""""""""""""""""""

""" Transparancy 
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

""" FocusMode
function! ToggleFocusMode()
	if (&foldcolumn != 12)
		set laststatus=0
		set numberwidth=10
		set foldcolumn=12
		set noruler
		hi FoldColumn ctermbg=none
		hi LineNr ctermfg=0 ctermbg=none
		hi NonText ctermfg=0
	else
		set laststatus=2
		set numberwidth=4
		set foldcolumn=0
		set ruler
		execute 'colorscheme ' . g:colors_name
	endif
endfunc
nnoremap <F1> :call ToggleFocusMode()<cr>
"""""""""""""""""""MAPPINGS""""""""""""""""""""""
" Edit config files
" mak function that opens vimrc in vsplit left after changing the layout to
" fullscreen (i3?).
nnoremap <Leader>ev :vsplit ~/.vimrc<CR>
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

" Run scripts
nnoremap <Leader>r :! urxvt -e python % &<CR><CR>

" Go to next comment (in pymode at least)
nnoremap <Leader>w :lnext<CR>
inoremap <Leader>w <esc>:lnext<CR>

" Indent entire file
inoremap <Leader>i <esc>gg=G<C-o>
nnoremap <Leader>i gg=G<C-o>

" try map öä
map ö {
map ä }

" Abbreviations
cnoreabbrev Wq wq
cnoreabbrev WQ wq
cnoreabbrev <expr> h getcmdtype() == ":" && getcmdline() == 'h' ? 'tab help' : 'h'
cnoreabbrev <expr> Q getcmdtype() == ":" && getcmdline() == 'Q' ? 'q' : 'Q'

" Convenience
map <CR> o<Esc>
noremap Q @q

"alternate keys for indenting/unindenting
inoremap <S-Tab> <Esc><LT><LT>i
nnoremap <Tab> >>
nnoremap <S-Tab> <LT><LT>
vnoremap <S-Tab>   <gv
vnoremap <Tab> >gv|

" tab
nnoremap <silent> <C-t> :<C-u>tabnew<CR>
inoremap <silent> <C-t> <ESC>:<C-u>tabnew<CR>
nnoremap <silent> g0 :<C-u>tabfirst<CR>
nnoremap <silent> g$ :<C-u>tablast<CR>

" select last paste
nnoremap <expr> gp '`['.strpart(getregtype(), 0, 1).'`]'

" swap line/normal visual mode
noremap V v
noremap v V

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

nnoremap <F10> :set relativenumber!<CR>
"""""""""""""""MOVEMENT"""""""""""""
" move up and down naturally even if lines 
" extends over multiple rows
nnoremap <C-h> <C-w><C-h>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-j> <C-w><C-j>

inoremap <C-h> <Esc><C-w><C-h>i
inoremap <C-l> <Esc><C-w><C-l>i
inoremap <C-j> <Esc><C-w><C-j>i
inoremap <C-k> <Esc><C-w><C-k>i

vnoremap <C-h> <Esc><C-w><C-h>gv
vnoremap <C-l> <Esc><C-w><C-l>gv
vnoremap <C-j> <Esc><C-w><C-j>gv
vnoremap <C-k> <Esc><C-w><C-k>gv

nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

nnoremap <Space> i <Esc> 
nnoremap G Gzz
nnoremap gh 0
nnoremap gi 0ciw
vnoremap tp y<Esc>gt<Esc>GpGgTgv<Esc>

" " vim-netrw
let g:netrw_banner = 0 "no banner
let g:netrw_liststyle = 3 
let g:netrw_sort_sequence = '[\/]$,*' " sort is affecting only: directories on the top, files below
nnoremap <Leader>tt :Texplore<CR>
nnoremap <Leader>ee :Explore<CR>
nnoremap <Leader>vv :Vexplore<CR>


" Go to placeholder
nnoremap <C-@> <Esc>/<++><Enter>"_c4l
vnoremap <C-@> <Esc>/<++><Enter>"_c4l
inoremap <C-@> <Esc>/<++><Enter>"_c4l

"Spellcheck
map <F6> :setlocal spell! spelllang=en_us<CR>
" h <space> becomes tab help <space> as to open help in new tab (instead of split)

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

" Indentation for python
au! BufNewFile,BufRead *.py
    set tabstop=4
	set softtabstop=4
	set shiftwidth=4
	set textwidth=79
	set expandtab
	set autoindent
	set fileformat=unix

" Indentation for js, htmlm css
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

"""""""""""PLUGINS""""""""""""""""""""
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

" lightline - statusline
"let g:lightline = {'colorscheme': 'wombat',}
let g:lightline = {'colorscheme': 'powerline',}
set noshowmode "stops vims own showing below the statusbar.

" Tabular
vnoremap <silent> <Leader>ce :Tabularize /=<CR>
vnoremap <silent> <Leader>ct :Tabularize /#<CR>

" YouCompleteMe
let g:ycm_python_binary_path = '/home/erik/anaconda3/bin/python3'
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_min_num_of_chars_for_completion = 0


" Python-mode
" Most are default but here to remind me that they exist
" Turn off autocmoplete to use YCM
" let g:pymode_run =  0 " Runs in background, freezes vim. No good.
" let g:pymode_rope_completion = 0
" let g:pymode_rope_complete_on_dot = 0
" let g:pymode_rope_lookup_project = 0
" let g:pymode_rope = 0
" let g:pymode_python = 'python3'
" let g:pymode_doc_bind = 'K'
" let g:pymode_breakpoint_bind = '<leader>b'
" "let g:pymode_rope_completion_bind = "<tab>"
" let g:pymode_quickfix_minheight = 3
" let g:pymode_quickfix_maxheight = 5
" let g:pymode_virtualenv_path = "/home/erik/anaconda3/"
" let g:pymode_options_max_line_length=120
" let g:pymode_trim_whitespaces = 1 " trim whitespaces on save

"let g:pymode_lint_ignore = "E501" " Ignores certain warnings
" Warnings pylint
" E302: expected 2 blank lines 
" E231: missing whitespacea after ','
" let g:pymode_warnings = 1
" function! TogglePymodeWarnings()
"     if g:pymode_warnings==1
"         let g:pymode_warnings = 0
"         echo "Warnings off!"
"     else
"         let g:pymode_warnings = 1
"         echo "Warnings on!"
"     endif
" endfunction
" nnoremap <F10> :call TogglePymodeWarnings()<CR>

""""""""""""BASE16"""""""""""""""
"colorscheme base16-monokai
" if filereadable(expand("~/.vimrc_background"))
"    let base16colorspace=256
"    source ~/.vimrc_background
" endif

" unhighlight comments, and change the search highlight to be non-intrusive
" hi Comment cterm=NONE
