" Vimrc
" Erik
" Ubuntu 16.04
" Unicode characters: https://www.w3schools.com/charsets/ref_utf_dingbats.asp

"============= VUNDLE ========================{{{

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" ============ Code/Project Navigation ================
Plugin 'scrooloose/nerdtree'                " Project and file navigation
Plugin 'tpope/vim-fugitive'                 " git extension
Plugin 'airblade/vim-gitgutter'             " see git changes in file in the numberline
Plugin 'Xuyuanp/nerdtree-git-plugin'        " NerdTree git functionality rebuilding pathogen
Plugin 'junegunn/fzf.vim'                   " fuzzy filefinding

" ============ Appearence =============================
Plugin 'chriskempson/base16-vim'
Plugin 'Yggdroot/indentLine'                " see where there is indent
Plugin 'itchyny/lightline.vim'              " light weight status bar
Plugin 'vim-scripts/Wombat'		              " Wombat colorscheme
Plugin 'edkolev/tmuxline.vim'
Plugin 'junegunn/goyo.vim'									" Distraction free writing
Plugin 'junegunn/limelight.vim'							" Focus colors

" ============ Useful Tools ===========================
Plugin 'epeli/slimux'                       " vim+ipython REPL
Plugin 'tpope/vim-surround'                 " Parentheses, brackets, quotes, XML tags, and more
Plugin 'tpope/vim-repeat'                   " repeat commands not repeatable by 'vanilla' vim
Plugin 'godlygeek/tabular'                  " structure text
Plugin 'tomtom/tcomment_vim'                " smart comments
Plugin 'christoomey/vim-tmux-navigator'     " navigate between vim and tmuz seemlessly
" Plugin 'vimwiki/vimwiki'                    " Personal Wiki
Plugin 'itchyny/calendar.vim'               " Calendar for vim
Plugin 'Valloric/MatchTagAlways'
Plugin 'nelstrom/vim-visual-star-search'    " * on visual select seraches for the snippet
"
" ============ Preview Text ===========================
Plugin 'lervag/vimtex'                      " latex compiler and alot more.
Plugin 'Rykka/riv.vim'                      " ReStructuredText plugin
Plugin 'Rykka/InstantRst'                   " Preview rst in browser (Fast)
Plugin 'shime/vim-livedown'									" Preview markdowns with npm/node Livedown

" ============ Completion and Syntax ==================
Plugin 'klen/python-mode'                   " Python mode (docs, refactor, lints...)
Plugin 'scrooloose/syntastic'             " Syntax checking plugin for Vim
Plugin 'Valloric/YouCompleteMe'           " Autocomplete plugin
Plugin 'PotatoesMaster/i3-vim-syntax'     " syntax for i3 config
Plugin 'octol/vim-cpp-enhanced-highlight' " Extra highlight for cpp
Plugin 'othree/xml.vim'
Plugin 'nelstrom/vim-markdown-folding'    " help with folding in markdown

" ============ Snippets ===============================
Plugin 'SirVer/ultisnips'                 " snippet engine
Plugin 'honza/vim-snippets'               " snippets

" ============ Checkout ? ==============================
" Plugin 'fisadev/FixedTaskList.vim'          " Pending tasks list
" Plugin 'MattesGroeger/vim-bookmarks'        " Bookmarks
" Plugin 'jreybert/vimagit'

" All of your Plugins must be added before the following line
call vundle#end()            "}}}
"=============== Basic ======================={{{
" fzf path
set rtp+=~/.fzf

filetype on
filetype plugin on
filetype plugin indent on

syntax enable

let HOSTNAME = substitute(system('hostname'), '\n', '', '') " What the hostname of the computer is /desktop/laptop
let BROWSER = "firefox"
let mapleader = ','
set spelllang=en_us            " US English spelling
set ffs=unix,dos,mac           " File Format (relevant to line ending type)
set backspace=indent,eol,start " Make backspace work like most other apps.
set history=1000              " Keep 1000 lines of command-line history.
set undolevels=1000           " Keep 1000 lines of undo history.
set showcmd                   " Display incomplete commands.
set title                     " Change the title of the terminal/tab with the file name.
set hidden                    " Allow unsaved background buffers.
set shortmess=I               " Don't show Vim's welcome message.
set shortmess+=a              " Make the save message shorter. Helps avoid the 'Hit ENTER to continue' message.
set foldmethod=marker         " marker for all but specified filetypes (ex: python)
set foldlevelstart=-1         " start with fold everything
set foldclose=                " all
set conceallevel=0
set tabstop=2
set softtabstop=2
set shiftwidth=2
set noexpandtab
set autoindent
set ruler                     " for cursor position in the bottom right corner
set number                    " number lines
set relativenumber
set scrolloff=3               " visual rows above and below cursor
set sidescroll=3              " visual columns on sides of cursor
set cursorline                " highlight line where cursor is
set hls                       " highlighting!
set wrap
set nolinebreak               " break lines if window is too narrow
set formatoptions+=j          " smart line joining. uncomments comments.
set lazyredraw                " don't redraw screen during macros
set breakindent               " wrapped line s keep indentation (set bri)
let &showbreak=               " ↪ "
set breakindentopt=shift:0    " how far in the breakindent:  ↪ showbreak should be
set nuw=4                     " width of numberline
set mouse=a                   " mouse functionality
set timeoutlen=500            " ms to wait for command completion
set ttimeoutlen=0             " don't wait for <esc>
set incsearch                 " search starts when typing instead of waiting for <enter>
set virtualedit=block					" ,onemore " 'block' makes it possible to edit empty space in visualblock
set nobackup
set nowritebackup
set noswapfile
set ignorecase                " (in)case sensitive search
set smartcase
set switchbuf=usetab
set wildmenu
set wildchar=<tab>
set sessionoptions=blank,buffers,curdir,folds,help,options,tabpages,winsize,resize
set synmaxcol=170							" Maximum column in which to search for syntax items
set splitbelow
set splitright

" }}}
"=============== Misc ======================={{{
" Wildmenu completion {{{
set wildmenu
set wildmode=list:longest

set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit
set wildignore+=*.luac                           " Lua byte code

set wildignore+=migrations                       " Django migrations
set wildignore+=*.pyc                            " Python byte code

set wildignore+=*.orig                           " Merge resolution files
set wildignore+=*.fasl                           " Lisp FASLs

" Clojure/Leiningen
set wildignore+=classes
set wildignore+=lib
" }}}
" Return to line {{{
" Make sure Vim returns to the same line when you reopen a file.
" Thanks, Amit
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END
" }}}
" Backups {{{
set backup                        " enable backups
set noswapfile                    " it's 2013, Vim.

set undodir=~/.vim/tmp/undo//     " undo files
set backupdir=~/.vim/tmp/backup// " backups
set directory=~/.vim/tmp/swap//   " swap files

" Make those folders automatically if they don't already exist.
if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), "p")
endif
if !isdirectory(expand(&backupdir))
    call mkdir(expand(&backupdir), "p")
endif
if !isdirectory(expand(&directory))
    call mkdir(expand(&directory), "p")
endif
" }}}
"}}}
"=============== APPEARENCE =================={{{
set laststatus=2 "always show status bar
set term=screen-256color
set t_co=256 "colormode

set termguicolors " Enable true color support.
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
" colors
colorscheme base16-tomorrow-night
" Toggle conceallevel
map <LocalLeader>c :exec &conceallevel ? "set conceallevel=0" : "set conceallevel=1"<CR>

" ======= HIGHLIGHTS =================
hi CursorLineNr ctermfg=87 guifg=white
hi MatchParen guibg=black guifg=lightblue

if has('windows')
set fillchars=vert:\┃  " ┃ line with no breaks between vertical splits
hi VertSplit ctermfg=51
hi VertSplit guibg=bg guifg=#b5bd68
endif

" change text font color to white
inoremap <leader>å <esc>:hi normal ctermfg=255 guifg=white<cr>
nnoremap <leader>å :hi normal ctermfg=255<cr>

"}}}
"=============== Windows ====================={{{
" Move between windows {{{
" Tmux now handles movement between windows and resizing
" Plugin 'edkolev/tmuxline.vim'
" nnoremap <C-H> <c-w><c-h>
" nnoremap <C-L> <c-w><c-l>
" nnoremap <C-K> <c-w><c-k>
" nnoremap <C-J> <c-w><c-j>

" inoremap <C-H> <c-w><c-h>
" inoremap <C-L> <c-w><c-l>
" inoremap <C-K> <c-w><c-k>
" inoremap <C-J> <c-w><c-j>
"
" nnoremap <C-H> <c-w><c-h>
" nnoremap <C-L> <c-w><c-l>
" nnoremap <C-K> <c-w><c-k>
" nnoremap <C-J> <c-w><c-j>
" }}}
" Window Resizing {{{
nnoremap <C-h> :vertical resize -3<cr>
nnoremap <C-l> :vertical resize +3<cr>
nnoremap <C-k> :resize +3<cr>
nnoremap <C-j> :resize -3<cr>
" Automatically resize when vim changes 
au VimResized * exe "normal! \<c-w>="
" }}}

"}}}
"=============== MAPPINGS ===================={{{
" Config files {{{
nnoremap <leader>ev   :tabnew ~/.vimrc<cr>
nnoremap <leader>ez   :tabnew ~/.zshrc<cr>
nnoremap <leader>ea   :tabnew ~/.files/aliases<cr>
nnoremap <leader>ei3  :tabnew ~/.config/i3/config<cr>
nnoremap <leader>er   :tabnew ~/.config/ranger/rc.conf<cr>
nnoremap <leader>ex   :tabnew ~/.xresources<cr>
nnoremap <leader>et   :tabnew ~/.tmux.conf<cr>
nnoremap <leader>ebib :tabnew ~/documents/latex/references.bib<cr>
nnoremap <leader>epy  :tabnew ~/.vim/ftplugin/python.vim<cr>
nnoremap <leader>ete  :tabnew ~/.vim/ftplugin/tex.vim<cr>
nnoremap <leader>ema  :tabnew ~/.vim/ftplugin/markdown.vim<cr>

" source config files
nnoremap <leader>si3  :source ~/.config/i3/config<cr>
nnoremap <leader>sv   :source ~/.vimrc<cr>
nnoremap <leader>sz   :source ~/.zshrc<cr>
nnoremap <leader>sx   :!xrdb ~/.Xresources<cr>
nnoremap <leader>sot  :source ~/.tmux.conf<cr>

" }}}
" Visual selection {{{
nnoremap vv V
nnoremap V v$
" }}}
" Search   {{{
" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

" open quickfix window for latest vim search term.
nnoremap <silent> <leader>/ :execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>

" toggle highlight search
nnoremap <leader><space> :set hlsearch!<cr>

"}}}
" standard saving options {{{
nnoremap <c-s> :w<cr>
inoremap <c-s> <esc>:w<cr>
nnoremap <c-q> :q!<cr>
inoremap <c-q> <esc>:wq<cr>

" }}}
"indenting/unindenting {{{
inoremap <s-tab> <esc><lt><lt>i
nnoremap <tab> >>
nnoremap <s-tab> <lt><lt>
vnoremap <s-tab>   <gv
vnoremap <tab> >gv|

" indent entire file
inoremap <leader>i <esc>gg=g<c-o>
nnoremap <leader>i gg=g<c-o>
"}}}
" copy / paste {{{
set pastetoggle=<f2> " system clipboard pastes preserves indentation

" copy / paste from clipboard
nnoremap <c-p> "+p
inoremap <c-p> <esc>"+pi
vnoremap <c-p> "+p
nnoremap <c-y> "+yy
vnoremap <c-y> "+y

"}}}
" misc {{{

" increment/decrement vis. selected numbers
vnoremap <leader>aa <C-a>
vnoremap <leader>AA <C-x>
vnoremap ga g<C-a>

" substitute word under cursor in entire file.
nnoremap <leader>sw :%s/<C-r><C-w>//g<Left><Left>
" Source lines
vnoremap <leader>vs y:@"<CR>
" Clean trailing whitespace
nnoremap <leader><backspace> mz:%s/\s\+$//<cr>:let @/=''<cr>`z

" when sudo rights are needed but you did not sudo.
cmap w!! %!sudo tee > /dev/null %

" tab
nnoremap <silent> <c-t> :<c-u>tabnew<cr>
inoremap <silent> <c-t> <esc>:<c-u>tabnew<cr>
nnoremap <silent> g0 :<c-u>tabfirst<cr>
nnoremap <silent> g$ :<c-u>tablast<cr>


" G(o)-Commands
" visual select last yanked/del/pasted text
nnoremap <expr> gvp '`['.strpart(getregtype(), 0, 1).'`]i'

"Spellcheck
map <F6> :setlocal spell! spelllang=en_us<CR>

nnoremap <f10> :set relativenumber!<cr>

" Some vim-diff settings
if &diff
	noremap <leader>1 :diffget LOCAL<CR>
	noremap <leader>2 :diffget BASE<CR>
	noremap <leader>3 :diffget REMOTE<CR>
	nnoremap <Leader>n ]c
	nnoremap <Leader>p [c
endif

" visual select all
nnoremap <leader>a ggvG$
nnoremap Y y$

" change word by put
nnoremap S viw"0p

" Marker line
nnoremap <leader>mA :TComment<CR>A{{{<esc>
nnoremap <leader>me :TComment<CR>A}}}<esc>

"}}}
"}}}
"=============== MOVEMENT ===================={{{
" Buffers previous/next
nnoremap <b :bp<CR>
nnoremap <n :bn<CR>

nmap G Gzz

" jump in jump list
nnoremap <i <C-I>zz
nmap <c-o> <c-o>zz

" jump paragraph
map ö {
map ä }

" */# now stays on a 
nnoremap * *<c-o>zz
nnoremap # #<c-o>zz
nnoremap gn *zz
nnoremap gN #zz
vnoremap gn *zz
vnoremap gN #zz

" next paren
nnoremap gp %

" go next spell error
nnoremap gs ]s

" move up and down naturally even if lines
" extends over multiple rows
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" natural end/beginning of line movement
nnoremap L $
nnoremap H 0

" go to placeholder
" nnoremap gj <esc>/<++><enter>"_c4l
" vnoremap gj <esc>/<++><enter>"_c4l
" inoremap gj <esc>/<++><enter>"_c4l

" Toggle fold
nnoremap ga zA
nnoremap <leader>z zMzvzz

" Nerdtree uses 'o' to open "foldlike" dirs.
" I want to use 'o' to open closed folds but everywhere else it
" should work as regular (I use 'o' alot!)
" foldclosed('.') returns -1 if not a closed fold or the linenumber
" where the closed fold is.
nnoremap <silent> o @=(foldclosed('.')>0?'za':"o")<CR>

"}}}
"=============== ABBREVIATIONS ==============={{{
cnoreabbrev Wq wq
cnoreabbrev WQ wq
cnoreabbrev Q! q!
cnoreabbrev Q q
cnoreabbrev <expr> h getcmdtype() == ":" && getcmdline() == 'h' ? 'tab help' : 'h'
cnoreabbrev <expr> q getcmdtype() == ":" && getcmdline() == 'q' ? 'q' : 'q'
"}}}
"=============== FUNCTIONS ==================={{{
" Set starting variables for functions
let g:transpar=0
let g:fold_max=1
function! Toggletransparency() " {{{
	" Worked on urxvt/xfce
	if g:transpar == 0
		hi Normal ctermbg=none
				hi LineNr ctermbg=none
				hi SignalColumn ctermbg=none
				hi VertSplit ctermfg=51
		let g:transpar=1
	else
		colorscheme monokai-phoenix
				hi SignColumn ctermbg=233
				hi VertSplit ctermfg=51
		hi Comment cterm=none
		hi Search ctermfg=1 ctermbg=none cterm=bold,underline
		hi LineNr ctermfg=grey
		hi CursorLineNr ctermfg=45
		let g:transpar=0
	endif
endfunc 
map <f12> :call Toggletransparency()<cr>
" }}}
function! Togglefocusmode() " {{{
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
" }}} 
function! Toggle_MaxMinFold() "{{{
		if g:fold_max == 0
		let g:fold_max=1
				:normal zM
	else
		let g:fold_max=0
				:normal zR
	endif
endfunc
nnoremap <leader>mm :call Toggle_MaxMinFold()<CR>

"}}}
function! NERDTreeColors() "{{{
	hi NERDTreeDir guifg=#90a959 
	hi Directory guifg=#404040
	hi NERDTreeCWD guifg=gray50
	hi NERDTreeFile guifg=white
	hi NERDTreeBookmarksHeader guifg=gray50
	hi NERDTreeBookmarkName guifg=gray50
endfunc
nnoremap <LocalLeader>n :call NERDTreeColors()<CR>
"}}}
" Moving visual lines vertically (greg hurrell){{{
function! s:Visual()
	return visualmode() == 'V'
endfunction

function! Move_up() abort range
	let l:at_top=a:firstline == 1
	if s:Visual() && !l:at_top
		'<,'>move '<-2
		call feedkeys('gv=','n')
	endif
	call feedkeys('gv','n')
endfunction

function! Move_down() abort range
	let l:at_bottom=a:lastline == line('$')
	if s:Visual() && !l:at_bottom
		'<,'>move '>+1
		call feedkeys('gv=','n')
	endif
	call feedkeys('gv','n')
endfunction

xnoremap K :call Move_up()<CR>
xnoremap J :call Move_down()<CR>
"}}}
"}}}
"============== AUTOCOMMANDS ================={{{
" function to exit quickfix when exiting buffer
aug qfclose "{{{
	au!
	au winenter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&buftype") == "quickfix"|q|endif
aug end "}}}

" augroup VIM "{{{
" 	au!
" 	au WinLeave,InsertEnter * set nocursorline
" 	au WinLeave,InsertEnter * set norelativenumber
" 	au WinEnter,InsertLeave * set cursorline
" 	au WinEnter,InsertLeave * set relativenumber
" augroup end " }}}

augroup vimtex_event_1 "{{{
" compile on initialization, cleanup on quit
	au!
	au user vimtexeventquit     call vimtex#compiler#clean(0)
augroup end "}}}

"}}}
"============== Macros/ longer cmds =========={{{

" find , and make new line | todo: 2gl -> execute command 2 times, etc.
nnoremap gl f,a<CR><esc> 

" save current buffer, close all buffers, open the buffer I was on
" noremap <leader>bd :w | %bd | e#
noremap <leader>bd :%bd<CR><C-O>:bd#<CR>
" whitespace around operator nnoremap <leader>. f+i <esc>la <esc>0

"}}}
"============= PLUGIN SETTINGS ==============={{{
"============== Tmux-navigation =============={{{
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <Left> :TmuxNavigateLeft<cr>
nnoremap <silent> <Down> :TmuxNavigateDown<cr>
nnoremap <silent> <Up> :TmuxNavigateUp<cr>
nnoremap <silent> <Right> :TmuxNavigateRight<cr>

"}}}
"============== Riv =========================={{{
let g:instant_rst_bind_scroll = 0
" }}}
"============== Slimux ======================={{{
nnoremap <C-c><C-c> :SlimuxREPLSendLine<CR>
vnoremap <C-c><C-c> :SlimuxREPLSendLine<CR>gv<Esc>zz
nnoremap <C-c><C-x> :SlimuxREPLConfigure<CR>
vnoremap <C-c><C-x> :SlimuxREPLConfigure<CR>
" }}}
"============== Vim-netrw ===================={{{
let g:netrw_banner = 0 "no banner
let g:netrw_liststyle = 3
let g:netrw_sort_sequence = '[\/]$,*' " sort is affecting only: directories on the top, files below
noremap <leader>ex :Explore<cr>
nnoremap <leader>vv :Vexplore<cr>
nnoremap <leader>hh :Hexplore<cr>
" }}}
"============== Calendar ====================={{{
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1

nnoremap <leader>cm :Calendar -view=month<CR>
nnoremap <leader>cw :Calendar -view=week<CR>
nnoremap <leader>cd :Calendar -view=day<CR>

" }}}
"============== Vimtex ======================={{{
let g:latex_view_general_viewer = 'zathura'
let g:vimtex_view_method = "zathura"
"let g:latex_view_general_options = shellescape("-s -e '" . exepath(v:progpath) . " --servername " . v:servername . " +{%line} {%input}'")
let g:vimtex_complete_recursive_bib = 2

" }}}
"============== Fugitive ====================={{{
nnoremap <Leader>ga :Gwrite<CR>
nnoremap <Leader>gc :Gcommit<CR>
nnoremap <Leader>gp :Gpush<CR>

" }}}
"============== Lightline ===================={{{
"wombat, solarized, powerline, jellybeans, Tomorrow,
"Tomorrow_Night, Tomorrow_Night_Blue, Tomorrow_Night_Eighties,
"PaperColor, seoul256, landscape, one, Dracula, darcula,
"molokai, materia, material, OldHope, nord and 16color

let g:lightline = {'colorscheme': 'molokai'} 
let g:lightline.inactive = {'left': [['filename'], ['gitbranch']]}
let g:lightline.component_function = {'gitbranch': 'fugitive#head'}

" color
" let s:palette = g:lightline#colorscheme#{g:lightline.colorscheme}#palette
" let s:palette.inactive.middle = [[ 'Pink' , 'DarkGreen', 'White', 'White']]

set noshowmode "stops vims own showing below the statusbar.
let g:lightline.tab = {'active': ['tabnum', 'filename', 'modified'],
			\'inactive': [ 'tabnum', 'filename', 'modified' ]}
" }}}
"
"============== Tabular ======================{{{
vnoremap <silent> <Leader>t= :Tabularize /=<CR>
vnoremap <silent> <Leader>t# :Tabularize /#<CR>
vnoremap <silent> <Leader>t" :Tabularize /"<CR>
vnoremap <silent> <Leader>t% :Tabularize /%<CR>
vnoremap <silent> <Leader>t: :Tabularize /:<CR>
vnoremap <silent> <Leader>t; :Tabularize /;<CR>
vnoremap <silent> <Leader>t- :Tabularize /-<CR>
" }}}
"============== YouCompleteMe ================{{{
" set completeopt-=preview
let g:ycm_python_binary_path = '/home/erik/anaconda3/bin/python3'
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_min_num_of_chars_for_completion = 2
let g:ycm_register_as_syntastic_checker = 0

let g:ycm_max_num_candidates = 10
let g:ycm_max_num_identifier_candidates = 10

" nnoremap <leader>g :YcmCompleter GoTo<CR>
" nnoremap <leader>d :YcmCompleter GoToDefinition<CR>

" }}}
"============== NerdTree ====================={{{
" " open NERDTree on startup
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let NERDTreeIgnore=['\.pyc$', '\.pdf$', '\.png$', '\.aux$', '\.bbl$', '\.fls$', '\.blg$', '\.log$', '\.fdb_latexmk$','\.gz$']
let NERDTreeShowBookmarks = 1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-n> :NERDTreeToggle<CR>

let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''

"PaleTurquoise1
hi NERDTreeDir guifg=#90a959
hi Directory guifg=#404040

hi NERDTreeCWD guifg=gray50
hi NERDTreeFile guifg=white
hi NERDTreeBookmarksHeader guifg=gray50
hi NERDTreeBookmarkName guifg=gray50
" }}}
"============== Python-Mode =================={{{
" Bindings {{{
let g:pymode_motion = 1
" Go to next/previous method or class
nnoremap gj :call pymode#motion#move('^\s*def\s', '')<CR>zz
nnoremap gk :call pymode#motion#move('^\s*def\s', 'b')<CR>zz
nnoremap gJ :call pymode#motion#move('^\s*class\s', '')<CR>zz
nnoremap gK :call pymode#motion#move('^\s*class\s', 'b')<CR>zz

" }}}
" python executables for different plugins

if HOSTNAME == "erik-laptop"
	let g:pymode_python = 'python'
elseif HOSTNAME == "erik-desktop"
	let g:pymode_python = 'python3'
else
	echo "New computer?"
	let g:pymode_python = 'python'
endif

" rope {{{
let g:pymode_rope                            = 0
let g:pymode_rope_completion                 = 0
let g:pymode_rope_complete_on_dot            = 0
let g:pymode_rope_auto_project               = 0
let g:pymode_rope_enable_autoimport          = 0
let g:pymode_rope_autoimport_generate        = 0
let g:pymode_rope_guess_project              = 0
"}}}

" documentation
let g:pymode_doc                   = 0
let g:pymode_doc_bind              = '<leader>K'

" lints (using syntastic for this)
let g:pymode_lint                  = 0
let g:pymode_lint_on_write         = 0
let g:pymode_lint_ignore           = ["E501", "W",]
let g:pymode_lint_checkers         = ['pyflakes', 'pep8', 'mccabe']
let g:pymode_lint_ignore           = ["E501", "W",]

" breakpoints
let g:pymode_breakpoint            = 1
let g:pymode_breakpoint_key        = '<leader>b'

" syntax highlight {{{
let python_highlight_all                     = 1
let g:pymode_syntax                          = 1
let g:pymode_syntax_slow_sync                = 1
let g:pymode_syntax_all                      = 1
let g:pymode_syntax_print_as_function        = g:pymode_syntax_all
let g:pymode_syntax_highlight_async_await    = 0
let g:pymode_syntax_highlight_equal_operator = 0
let g:pymode_syntax_highlight_stars_operator = 0
let g:pymode_syntax_highlight_self           = g:pymode_syntax_all
let g:pymode_syntax_indent_errors            = 0
let g:pymode_syntax_string_formatting        = g:pymode_syntax_all
let g:pymode_syntax_space_errors             = 0
let g:pymode_syntax_string_format            = g:pymode_syntax_all
let g:pymode_syntax_string_templates         = g:pymode_syntax_all
let g:pymode_syntax_doctests                 = g:pymode_syntax_all
let g:pymode_syntax_builtin_objs             = g:pymode_syntax_all
let g:pymode_syntax_builtin_types            = g:pymode_syntax_all
let g:pymode_syntax_highlight_exceptions     = g:pymode_syntax_all
let g:pymode_syntax_docstrings               = g:pymode_syntax_all

"}}}

" code folding
" YCM became super slow and the folding kinda stunk.
let g:pymode_folding=0

" pep8 indents
let g:pymode_indent=1

" code running
let g:pymode_run=1
let g:pymode_run_bind='<F5>'
let g:pymode_rope_lookup_project = 0

imap <F5> <Esc>:w<CR>:!clear;python %<CR>
" }}}
"============== Syntastic ===================={{{
" Recommended settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let b:syntastic_mode          = "passive"
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq   = 0
let g:syntastic_mode_map = { 'passive_filetypes': ['python']} 

let g:syntastic_auto_jump                 = 2
let g:syntastic_always_populate_loc_list  = 1
let g:syntastic_auto_loc_list             = 1
let g:syntastic_loc_list_height           = 7
let g:syntastic_enable_signs              = 1

let g:syntastic_aggregate_errors          = 1
let g:syntastic_error_symbol              = '✘'
let g:syntastic_style_error_symbol        = '✘'
let g:syntastic_warning_symbol            = '❔'
let g:syntastic_style_warning_symbol      = 'x'
" let g:syntastic_python_python_exec        = 'python'
" let g:syntastic_python_checkers         = ['flake8', 'pydocstyle', 'pep8', 'python']
" let g:syntastic_python_flake8_post_args = '--ignore=E501,E128,E225'
let g:syntastic_python_checkers           = ['pydocstyle', 'pep8', 'python']
let g:syntastic_python_checker_args       = '--ignore=E501'

" bindings-------------------------------
nnoremap <leader>sr :SyntasticReset<cr>
nnoremap <leader>st :SyntasticToggleMode<cr>
nnoremap <leader>sc :SyntasticCheck<cr>
nnoremap <leader>lc :lclose<cr>
nnoremap <leader>lo :errors<cr>

" GO TO next comment 
nnoremap ge :lnext<cr>
nnoremap gE :lprevious<cr>

" }}}
"============== Indentline ==================={{{
let g:indentLine_fileTypeExclude=['help']
let g:indentLine_char = '┊'
" }}}
"============== Vim-livedown-markdown ========{{{
" should markdown preview get shown automatically upon opening markdown buffer
let g:livedown_autorun = 0

" should the browser window pop-up upon previewing
let g:livedown_open = 1 

" the port on which Livedown server will run
let g:livedown_port = 1337

" the browser to use
let g:livedown_browser = BROWSER

nnoremap gm :LivedownToggle<CR>
nnoremap gM :LivedownPreview<CR>
"}}}
"============== VimWiki ======================{{{
" Use markdown syntax
" ? look at this more. Mess with markdown syntax ?
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
let g:vimwiki_list = [{'path': '~/vimwiki/index.md', 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_hl_cb_checked = 1  " make checked item lists highlighted
let g:vimwiki_listsyms = '✗○◐●✓'
let g:vimwiki_folding = 'custom'
let g:vimwiki_use_calendar = 1	"Enable calendar.vim integration
"}}}
"============== Vim-surround ================={{{
nnoremap <leader>' :normal ysiw'<CR>
nnoremap <leader>" :normal ysiw"<CR>
nnoremap <leader>) :normal ysiw)<CR>
nnoremap <leader>* :normal ysiw*<CR>
"}}}
"============== FZF =========================={{{
" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
	\ 'bg':      ['bg', 'Normal'],
	\ 'hl':      ['fg', 'Comment'],
	\ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
	\ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
	\ 'hl+':     ['fg', 'Statement'],
	\ 'info':    ['fg', 'PreProc'],
	\ 'border':  ['fg', 'Ignore'],
	\ 'prompt':  ['fg', 'Conditional'],
	\ 'pointer': ['fg', 'Exception'],
	\ 'marker':  ['fg', 'Keyword'],
	\ 'spinner': ['fg', 'Label'],
	\ 'header':  ['fg', 'Comment'] }

" Settings
" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" Mappings
nnoremap <Leader>fi  :Files ~<CR>
nnoremap <Leader>lfi :Files<CR>
nnoremap <Leader>li  :Lines<CR>
nnoremap <Leader>gs  :GFiles?<CR>
nnoremap <Leader>gb  :Buffers<CR>
nnoremap <Leader>h   :Helptags<CR>
nnoremap <Leader>ff  :Ag<CR>

" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

"}}}
"============== UltiSnips ===================={{{
" Trigger configuration. 
" Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe. 
let g:UltiSnipsExpandTrigger                      = "<leader>c"
let g:UltiSnipsJumpForwardTrigger                 = "<c-b>"
let g:UltiSnipsJumpBackwardTrigger                = "<c-z>"

"If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit                          = "vertical"
let g:UltiSnipsUsePythonVersion                   = 3

augroup markdown 
	au! 
	au BufNewFile,BufRead *.md,*.markdown,*.mmd set filetype=markdown 
	au BufNewFile,BufRead *.md,*.markdown,*.mmd UltiSnipsAddFiletypes markdown 
augroup END
"}}}
"============== GoYo ========================={{{
" Trigger configuration. 
" Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe. 
let g:goyo_width  = 80  " (default: 80)
let g:goyo_linenr = 0   " (default: 0)

" Functions Goyo and tmux
function! s:goyo_enter()
  silent !tmux set status off
  silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  set noshowmode
  set noshowcmd
  set scrolloff=999
endfunction

function! s:goyo_leave()
  silent !tmux set status on
  silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  set showmode
  set showcmd
  set scrolloff=5
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" mappings
nnoremap <leader>gg :Goyo<CR>

"}}}
