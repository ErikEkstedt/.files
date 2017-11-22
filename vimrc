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
Plugin 'edkolev/tmuxline.vim'

" ============ Useful Tools ===========================
Plugin 'epeli/slimux'                       " vim+ipython REPL
Plugin 'tpope/vim-surround'                 " Parentheses, brackets, quotes, XML tags, and more
Plugin 'tpope/vim-repeat'                   " repeat commands not repeatable by 'vanilla' vim
Plugin 'godlygeek/tabular'                  " structure text
Plugin 'tomtom/tcomment_vim'                " smart comments
Plugin 'christoomey/vim-tmux-navigator'     " navigate between vim and tmuz seemlessly

" ============ Preview Text ===========================
Plugin 'JamshedVesuna/vim-markdown-preview' " preview markdowns
Plugin 'lervag/vimtex'                      " latex compiler and alot more.
Plugin 'Rykka/riv.vim'                      " ReStructuredText plugin
Plugin 'Rykka/InstantRst'                   " Preview rst in browser (Fast)

" ============ Completion and Syntax ==================
Plugin 'klen/python-mode'                   " Python mode (docs, refactor, lints...)
Plugin 'scrooloose/syntastic'               " Syntax checking plugin for Vim
Plugin 'Valloric/YouCompleteMe'             " Autocomplete plugin
Plugin 'PotatoesMaster/i3-vim-syntax'       " syntax for i3 config
Plugin 'hdima/python-syntax'                " extra help for python syntax (self etc)

" ============ Snippets ===============================
" Take an hour and install and make correct with YCM
" Plugin 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
" Plugin 'honza/vim-snippets'

" ============ Checkout ? ==============================
" Plugin 'fisadev/FixedTaskList.vim'          " Pending tasks list
" Plugin 'MattesGroeger/vim-bookmarks'        " Bookmarks
" Plugin 'vimwiki/vimwiki'                    " Personal Wiki
" Plugin 'jreybert/vimagit'
" Plugin 'ryanoasis/vim-devicons'             " Dev Icons

" All of your Plugins must be added before the following line
call vundle#end()            "}}}
"=============== Basic ======================={{{
" fzf path
set rtp+=~/.fzf

filetype on
filetype plugin on
filetype plugin indent on

syntax enable

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
set scrolloff=5               " visual rows above and below cursor
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
set virtualedit=block,onemore " 'block' makes it possible to edit empty space in visualblock
set nobackup                  
set nowritebackup
set noswapfile
set ignorecase                " (in)case sensitive search
set smartcase
set switchbuf=usetab
set wildmenu
set wildchar=<tab>
set sessionoptions=blank,buffers,curdir,folds,help,options,tabpages,winsize,resize

" }}}
"=============== APPEARENCE =================={{{
set laststatus=2 "always show status bar
set term=screen-256color
set t_co=256 "colormode

set termguicolors
let &t_8f="\e[38;2;%ld;%ld;%ldm"
let &t_8b="\e[48;2;%ld;%ld;%ldm"

" colors
colorscheme base16-classic-dark
let base16colorspace=256

" ======= HIGHLIGHTS =================
hi CursorLineNr ctermfg=87 guifg=white  
hi MatchParen guibg=black guifg=lightblue

if has('windows')
set fillchars=vert:\┃  " ┃ line with no breaks between vertical splits 
hi VertSplit ctermfg=51
hi VertSplit guibg=bg guifg=#b5bd68
endif
"}}}
"=============== MAPPINGS ===================={{{
" Config files {{{
nnoremap <leader>ev :tabnew ~/.vimrc<cr>
nnoremap <leader>ez :tabnew ~/.zshrc<cr>
nnoremap <leader>ea :tabnew ~/.files/aliases<cr>
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
nnoremap <leader>sx :! xrdb ~/.Xresources<cr>
nnoremap <leader>sot :source ~/.tmux.conf<cr>
" }}}

" Source lines
vnoremap <leader>vs y:@"<CR>

" standard saving options
nnoremap <c-s> :w<cr>
inoremap <c-s> <esc>:w<cr>
nnoremap <c-q> :q!<cr>
inoremap <c-q> <esc>:wq<cr>

" when sudo rights are needed but you did not sudo. 
cmap w!! %!sudo tee > /dev/null %

" run scripts
nnoremap <leader>r :! urxvt -e python % &<cr><cr>

" Toggle conceallevel
map <LocalLeader>c :exec &conceallevel ? "set conceallevel=0" : "set conceallevel=1"<CR>

" GO TO next comment (in syntastic - flake8 (python) at least)
nnoremap <leader>e :lnext<cr>
inoremap <leader>e <esc>:lnext<cr>

" Buffers previous/next
nnoremap <b :bp<CR>
nnoremap <n :bn<CR>

" indent entire file
inoremap <leader>i <esc>gg=g<c-o>
nnoremap <leader>i gg=g<c-o>

" jump forward in jump list
nnoremap <i <C-I>

" change text font color to white
inoremap <leader>å <esc>:hi normal ctermfg=255<cr>
nnoremap <leader>å :hi normal ctermfg=255<cr>

" Calendar
nnoremap <leader>cm :Calendar -view=month<CR>
nnoremap <leader>cw :Calendar -view=week<CR>
nnoremap <leader>cd :Calendar -view=day<CR>

" try map öä
map ö {
map ä }

nnoremap <leader>no :set hlsearch!<cr>

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

" G(o)-Commands
nnoremap <expr> gvp '`['.strpart(getregtype(), 0, 1).'`]'

nnoremap gp %
nnoremap gs ]sz=

set pastetoggle=<f2> " system clipboard pastes preserves indentation

" copy / paste from clipboard
nnoremap <c-p> "+p
inoremap <c-p> <esc>"+pi
vnoremap <c-p> "+p
nnoremap <c-y> "+yy
vnoremap <c-y> "+y

" visual select all
nnoremap <leader>a ggvG$
nnoremap Y y$

" change word by put
nnoremap S viw"0p

" Marker line

nnoremap <leader>mA A  %{{{<esc>
nnoremap <leader>me i%}}}<esc>

"}}}
"=============== MOVEMENT ===================={{{
" move up and down naturally even if lines 
" extends over multiple rows
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

nnoremap L $
nnoremap H 0

nnoremap G Gzz
nnoremap <c-o> <c-o>zz

"Move between splits
nnoremap <c-h> <c-w><c-h>
nnoremap <c-l> <c-w><c-l>
nnoremap <c-k> <c-w><c-k>
nnoremap <c-j> <c-w><c-j>

inoremap <c-h> <esc><c-w><c-h>i
inoremap <c-l> <esc><c-w><c-l>i
inoremap <c-j> <esc><c-w><c-j>i
inoremap <c-k> <esc><c-w><c-k>i

vnoremap <c-h> <esc><c-w><c-h>gv
vnoremap <c-l> <esc><c-w><c-l>gv
vnoremap <c-j> <esc><c-w><c-j>gv
vnoremap <c-k> <esc><c-w><c-k>gv

" " Resize splits
nnoremap <Leader>q :vertical resize -5<CR>
nnoremap <Leader>w :vertical resize +5<CR>


" go to placeholder
nnoremap gj <esc>/<++><enter>"_c4l
vnoremap gj <esc>/<++><enter>"_c4l
inoremap gj <esc>/<++><enter>"_c4l

" Toggle fold
nnoremap ga zA

"Spellcheck
map <F6> :setlocal spell! spelllang=en_us<CR>

nnoremap <f10> :set relativenumber!<cr>

if &diff
	noremap <leader>1 :diffget LOCAL<CR>
	noremap <leader>2 :diffget BASE<CR>
	noremap <leader>3 :diffget REMOTE<CR>
	nnoremap <Leader>n ]c
	nnoremap <Leader>p [c
endif
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
let g:transpar=0
function! Toggletransparency()
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

function! Togglefocusmode()
	if (&foldcolumn != 12z)
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

let g:fold_max=1
function! Toggle_MaxMinFold()
		echo "hello"
		if g:fold_max == 0
		let g:fold_max=1
				:normal zM
	else
		let g:fold_max=0
				:normal zR
	endif
endfunc
nnoremap <leader>r :call Toggle_MaxMinFold()<CR>
"}}}
"============== AUTOCOMMANDS ================={{{
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
"}}}
"============= PLUGIN SETTINGS ==============={{{

"=============== riv.vim ==================
let g:instant_rst_bind_scroll = 0

"=============== Slimux ==================
nnoremap <C-c><C-c> :SlimuxREPLSendLine<CR>
vnoremap <C-c><C-c> :SlimuxREPLSendLine<CR>gv<Esc>zz
nnoremap <C-c><C-x> :SlimuxREPLConfigure<CR>
vnoremap <C-c><C-x> :SlimuxREPLConfigure<CR>

"=============== Vim-netrw ==================
let g:netrw_banner = 0 "no banner
let g:netrw_liststyle = 3 
let g:netrw_sort_sequence = '[\/]$,*' " sort is affecting only: directories on the top, files below
noremap <leader>ex :Explore<cr>
nnoremap <leader>vv :Vexplore<cr>
nnoremap <leader>hh :Hexplore<cr>

"=============== Calendar ==================
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1

"=============== Vimtex ==================
let g:latex_view_general_viewer = 'zathura'
let g:vimtex_view_method = "zathura"
"let g:latex_view_general_options = shellescape("-s -e '" . exepath(v:progpath) . " --servername " . v:servername . " +{%line} {%input}'")
let g:vimtex_complete_recursive_bib = 2

"=============== CtrlP ==================
let g:ctrlp_show_hidden = 2 
nnoremap <Leader>f :CtrlP<CR>
nnoremap <Leader>fm :CtrlPMRU<CR>
let g:ctrlp_map = ''

"=============== Fugitive ==================
nnoremap <Leader>ga :Gwrite<CR>
nnoremap <Leader>gc :Gcommit<CR>
nnoremap <Leader>gp :Gpush<CR>

"=============== Lightline ==================
let g:lightline = {'colorscheme': 'powerline'}
set noshowmode "stops vims own showing below the statusbar.

"=============== Tabular ==================
vnoremap <silent> <Leader>t= :Tabularize /=<CR>
vnoremap <silent> <Leader>t# :Tabularize /#<CR>
vnoremap <silent> <Leader>t" :Tabularize /"<CR>
vnoremap <silent> <Leader>t% :Tabularize /%<CR>
vnoremap <silent> <Leader>t: :Tabularize /:<CR>
vnoremap <silent> <Leader>t; :Tabularize /;<CR>

"=============== YouCompleteMe ================== {{{
set completeopt-=preview
let g:ycm_python_binary_path = '/home/erik/anaconda3/bin/python3'
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_min_num_of_chars_for_completion = 2

noremap <leader>gd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>g :YcmCompleter GoTo<CR>
nnoremap <leader>d :YcmCompleter GoToDefinition<CR>
" }}}
"=============== Nerdtree ================== {{{
" " open NERDTree on startup
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let NERDTreeIgnore=['\.pyc$', '\.pdf$', '\.png$', '\.aux$', '\.bbl$', '\.fls$', '\.blg$', '\.log$', '\.xml$', '\.fdb_latexmk$','\.gz$']
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
"=============== PyMode ==================== {{{
" python executables for different plugins
let g:pymode_python                          = 'python'
let g:syntastic_python_python_exec           = 'python'

" rope
let g:pymode_rope                            = 0
let g:pymode_rope_completion                 = 0
let g:pymode_rope_complete_on_dot            = 0
let g:pymode_rope_auto_project               = 0
let g:pymode_rope_enable_autoimport          = 0
let g:pymode_rope_autoimport_generate        = 0
let g:pymode_rope_guess_project              = 0

" documentation
let g:pymode_doc                             = 0
let g:pymode_doc_bind                        = 'K'

" lints
let g:pymode_lint                            = 0

" virtualenv
" let g:pymode_virtualenv                      = 1

" breakpoints
let g:pymode_breakpoint                      = 1
let g:pymode_breakpoint_key                  = '<leader>b'

" syntax highlight
let g:pymode_syntax                          = 1
let g:pymode_syntax_slow_sync                = 1
let g:pymode_syntax_all                      = 1
let g:pymode_syntax_print_as_function        = g:pymode_syntax_all
let g:pymode_syntax_highlight_async_await    = g:pymode_syntax_all
let g:pymode_syntax_highlight_equal_operator = g:pymode_syntax_all
let g:pymode_syntax_highlight_stars_operator = g:pymode_syntax_all
let g:pymode_syntax_highlight_self           = g:pymode_syntax_all
let g:pymode_syntax_indent_errors            = g:pymode_syntax_all
let g:pymode_syntax_string_formatting        = g:pymode_syntax_all
let g:pymode_syntax_space_errors             = g:pymode_syntax_all
let g:pymode_syntax_string_format            = g:pymode_syntax_all
let g:pymode_syntax_string_templates         = g:pymode_syntax_all
let g:pymode_syntax_doctests                 = g:pymode_syntax_all
let g:pymode_syntax_builtin_objs             = g:pymode_syntax_all
let g:pymode_syntax_builtin_types            = g:pymode_syntax_all
let g:pymode_syntax_highlight_exceptions     = g:pymode_syntax_all
let g:pymode_syntax_docstrings               = g:pymode_syntax_all

" highlight 'long' lines (>= 80 symbols) in python files
" augroup vimrc_autocmds
"     autocmd!
"     autocmd FileType python,rst,c,cpp highlight Excess ctermbg=DarkGrey guibg=Black
"     autocmd FileType python,rst,c,cpp match Excess /\%81v.*/
"     autocmd FileType python,rst,c,cpp set nowrap
"     autocmd FileType python,rst,c,cpp set colorcolumn=80
" augroup END

" code folding
let g:pymode_folding=0

" pep8 indents
let g:pymode_indent=1

" code running
let g:pymode_run=1
let g:pymode_run_bind='<F5>'
let g:pymode_rope_lookup_project = 0

imap <F5> <Esc>:w<CR>:!clear;python %<CR>
" }}}
" ========== Tagbar ================
nmap <F8> :TagbarToggle<CR>

"=============== Syntastic ================== {{{
" Recommended settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_mode = "passive"

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_loc_list_height = 4
let g:syntastic_enable_signs=1

let g:syntastic_aggregate_errors=1
let g:syntastic_error_symbol='X'
let g:syntastic_style_error_symbol='X'
let g:syntastic_warning_symbol='x'
let g:syntastic_style_warning_symbol='x'
let g:syntastic_python_checkers=['flake8', 'pydocstyle', 'python']
"let g:syntastic_python_checkers =  ["flake8" ]

" bindings-------------------------------
nnoremap <leader>sr :SyntasticReset<cr>
nnoremap <leader>st :SyntasticToggleMode<cr>
nnoremap <leader>sc :SyntasticCheck<cr>
nnoremap <leader>lc :lclose<cr>
nnoremap <leader>lo :errors<cr>
" }}}
"=============== Indentline ==================
let g:indentLine_fileTypeExclude=['help']
let g:indentLine_char = '┊'

" Python syntax ~/.vim/syntax/python.vim 
let python_highlight_all = 1

"=============== Vim-markdown-preview ==================
let vim_markdown_preview_github=1
let vim_markdown_preview_hotkey='<C-m>'
let vim_markdown_preview_browser='Google Chrome'

"=============== FZF ==================
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
nnoremap <Leader>gg :Lines<CR>
nnoremap <Leader>gs :GFiles?<CR>
nnoremap <Leader>gb :Buffers<CR>
"}}}
"===== TODO ====={{{
	" " figure out highlightning. this affecter breakindentopt 'bg hl'
	"set highlight+=@:colorcolumn 
	"set highlight+=c:linenr
	"set highlight+=n:difftext

	" set list
	" " note : maybe if there was no highlighting on charactars.
	" " 		also try to remove highlight from breakindentopt highlight+=@:colorcolumn
	" set listchars=trail:• " trail character. if whitespace at end.
	" set listchars+=tab:▷- " character for tab
	" set listchars+=extends:» " character if text extends beyond line
	" set listchars+=precedes:« "  character if text extends beyond line on
	" next lineo

" Stated that the python code below woooould prevent errors
" cannot parse code. errors. o
" ImportError: No module named '_sysconfigdata_m_linux_x86_64-linux-gnu'
" python3 << EOF
" import vim
" import git
" def is_git_repo():
"       try:
"           _ = git.Repo('.', search_parent_directories=True).git_dir
"           return "1"
"       except:
"           return "0"
" vim.command("let g:pymode_rope = " + is_git_repo())
" EOF
"
"}}}
