" vim: fdm=marker
" NeoVim
" Erik
" Kubuntu 18.04 / KDE neon 16.04 / kubuntu 17.10
" Unicode characters: https://www.w3schools.com/charsets/ref_utf_dingbats.asp
" This file is in $NVIM_ROOT (which is linked from repo to
" ~/.config/nvim)
"
" $NVIM_ROOT
" ├── after
" │   └── ftplugin
" ├── autoload
" │   ├── erik
" │   └── lightline
" │       └── colorscheme
" ├── colors
" ├── ftplugin: all my filetype-settings
" ├── mysnippets: custom snippets
" ├── oni: settings and mappings for Oni
" ├── plugin: In here all my settings are stored.
" │   └── mappings: keymappings
" │   └── plugins: all plugin settings
" ├── spell
" └── wip

" Startup and Installation {{{
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    echo "No Vim-Plug available... Downloading and running PlugInstall"
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" fzf path
set rtp+=~/.fzf

"Python & Node
if has("unix")
	" This is probably not necessary and $HOME or similar might work.
	let s:uname = system("uname")
	if s:uname == "Darwin\n"
		" let g:python3_host_prog='/Users/erik/miniconda3/bin/python'
		" let g:python_host_prog ='/Users/erik/miniconda3/envs/py27/bin/python'
		let g:python3_host_prog='/Users/erik/miniconda3/envs/neovim3/bin/python'
		let g:python_host_prog='/Users/erik/miniconda3/envs/neovim2/bin/python'
		let g:node_host_prog='/Users/erik/.node_modules_global/bin/neovim-node-host' 
	else
		let g:python3_host_prog='/home/erik/miniconda3/bin/python'
		let g:python_host_prog='/home/erik/miniconda3/envs/py27/bin/python'
		let g:node_host_prog='/home/erik/.node_modules_global/bin/neovim-node-host' 
	endif
endif
" }}}
" Vim-Plug {{{ 
" Plugins marked with XXX I know I use/like a lot.
" Plugins will be downloaded under the specified directory. 
call plug#begin('~/.vim/bundle')

" Deoplete
if has('nvim') 
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
    Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
endif

Plug 'zchee/deoplete-jedi'
Plug 'Shougo/neco-vim'
Plug 'Shougo/neopairs.vim'

" Snippets

" --------------------
" Installed for react play
" ES2015 code snippets (Optional)
Plug 'epilande/vim-es2015-snippets'
" React code snippets
Plug 'epilande/vim-react-snippets'
" post install (yarn install | npm install) then load plugin only for editing supported files


Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue'] }

Plug 'mxw/vim-jsx'

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
" --------------------
"
Plug 'SirVer/ultisnips'                " XXX snippet engine
Plug 'honza/vim-snippets'              " XXX snippets

" Syntax
Plug 'sheerun/vim-polyglot'            " All the syntax messed upp syntax for oni ( turned .js -> javascript.jsx
Plug 'daeyun/vim-matlab'               " MATLAB
Plug 'othree/xml.vim'                  " xml highlight
Plug 'klen/python-mode'                " Python mode (docs, refactor, lints...)

                                       " Tools
" Plug 'DougBeney/pickachu'              " Pick Color/date/
Plug 'KabbAmine/vCoolor.vim'
Plug 'Raimondi/delimitMate'            " auto complete parens etc.
Plug 'Valloric/MatchTagAlways' 
Plug 'Xuyuanp/nerdtree-git-plugin'     " show git status of files
Plug 'Yggdroot/indentLine'             " see where there is indent
Plug 'airblade/vim-gitgutter'          " XXX see git changes in file in the numberline
Plug 'easymotion/vim-easymotion'       " XXX visualize targets tot move to specific words
Plug 'ivalkeen/nerdtree-execute'       " open files from nerdtree
Plug 'junegunn/fzf.vim'                " XXX fuzzy filefinding
Plug 'junegunn/goyo.vim'               " Distraction free writing
Plug 'junegunn/vim-after-object'       " change everything after something
Plug 'junegunn/vim-easy-align'         " XXX better alignment than tabular
Plug 'junegunn/vim-peekaboo'           " when pressing quotes shows what's stored in the different registers
Plug 'lilydjwg/colorizer'              " colorize hexcolor in editor
Plug 'lotabout/slimux'                 " XXX old: 'epeli/slimux' | vim+ipython OUtdated
Plug 'machakann/vim-highlightedyank'   " XXX Highlight yanks
Plug 'mtth/scratch.vim'                " Unobtrusive scratch
Plug 'nelstrom/vim-markdown-folding'   " help with folding in markdown
Plug 'nelstrom/vim-visual-star-search' " * on visual select searches for the snippet
Plug 'pangloss/vim-javascript'
Plug 'scrooloose/nerdtree'             " XXX Project and file navigation
Plug 'sjl/gundo.vim'                   " Visualize undo tree
Plug 'tommcdo/vim-exchange'            " exchange two words. ex: cxw (on first word) . (on second)
Plug 'tpope/vim-commentary'            " XXX commenting
Plug 'tpope/vim-fugitive'              " git tools
Plug 'tpope/vim-obsession'             " :mksession | saves a vim instance | used when saving tmux session
Plug 'tpope/vim-repeat'                " XXX repeat commands not repeatable by 'vanilla' vim
Plug 'tpope/vim-surround'              " XXX Surround objects with quotes, brackets ...
Plug 'w0rp/ale'                        " asynchronous linting
Plug 'wellle/targets.vim'              " XXX ci' works on (, [, {, <
Plug 'wmvanvliet/vim-ipython'

	" Plug 'Raimondi/delimitMate'           " autoclosing of brackets, quotes ...
if !exists("g:gui_oni")
	Plug 'christoomey/vim-tmux-navigator' " navigate between vim and tmuz seemlessly
endif

" Preview Text 
Plug 'lervag/vimtex'      " XXX latex compiler and alot more.
Plug 'shime/vim-livedown' " XXX Preview markdowns with npm/node Livedown

" Colorschemes and Appearence {{{ 
if !exists("g:gui_oni")
	Plug 'chriskempson/base16-vim'        " many colorschemes
	Plug 'skielbasa/vim-material-monokai' 
	Plug 'kiddos/malokai.vim'
	Plug 'Reewr/vim-monokai-phoenix'
	Plug 'vim-scripts/wombat256.vim'
	Plug 'danilo-augusto/vim-afterglow'
	Plug 'mhartington/oceanic-next'
	Plug 'yuttie/hydrangea-vim'
    Plug 'junegunn/seoul256.vim'          " cool junegunn is coool
	Plug 'joshdick/onedark.vim'           " look like atom?
	Plug 'crusoexia/vim-monokai'
	Plug 'itchyny/lightline.vim'
	" Plug 'edkolev/tmuxline.vim'          " tmux statusline same as vim.	 :Tmuxline lightline
endif

call plug#end()
" }}}
" }}}
" Basic Settings {{{

filetype plugin indent on
syntax enable
syntax on
colorscheme onedark

let HOSTNAME = substitute(system('hostname'), '\n', '', '') " What the hostname of the computer is /desktop/laptop
let g:BROWSER = "google-chrome"
let mapleader = ','
let localleader = '\'
set spelllang=sv,en_us         " US English spelling
set ffs=unix,dos,mac           " File Format (relevant to line ending type)
set backspace=indent,eol,start " Make backspace work like most other apps.
set history=1000               " Keep 1000 lines of command-line history.
set undolevels=1000            " Keep 1000 lines of undo history.
set showcmd                    " Display incomplete commands.
set noshowmode                 " stops vims own showing below the statusbar.
set title                      " Change the title of the terminal/tab with the file name.
set hidden                     " Allow unsaved background buffers.
set shortmess=I                " Don't show Vim's welcome message.
set shortmess+=a               " Make the save message shorter. Helps avoid the 'Hit ENTER to continue' message.
set modeline                   " example at top of script:  " vim: ft=tmux

" FOLD
set foldmethod=marker          " marker for all but specified filetypes (ex: python)
set foldlevelstart=-1          " start with fold everything
set foldclose=                 " all

set foldtext=erik#settings#foldtext()
set conceallevel=0
set shiftwidth=4
set tabstop=4
set softtabstop=4
set smarttab
set noexpandtab
set autoindent

" set ruler                      " for cursor position in the bottom right corner
set number                     " number lines
set relativenumber
set scrolloff=3                " visual rows above and below cursor
set sidescroll=3               " visual columns on sides of cursor
set cursorline                 " highlight line where cursor is

" set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
			\,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
			\,sm:block-blinkwait175-blinkoff150-blinkon175

set hls                        " highlighting!
set lazyredraw                 " don't redraw screen during macros

" set textwidth=0
set linebreak				   " break lines (only visually) if window is too narrow
set formatoptions+=j           " smart line joining. uncomments comments.
set wrap
set wrapmargin=5
let &showbreak="↪"
set breakindent                " wrapped line s keep indentation (set bri)
set cpo+=n
set breakindentopt+=shift:2    " how far in the showbreak: " ↪ " is
set breakindentopt+=min:20

set list
set listchars=tab:\|\ ,trail:·,extends:\#,nbsp:.
" set listchars=tab:▶\ ,trail:·,extends:\#,nbsp:.

set numberwidth=4              " width of numberline
set mouse=a                    " mouse functionality
set timeoutlen=500             " ms to wait for command completion
set ttimeoutlen=0              " don't wait for <esc>
set incsearch                  " search starts when typing instead of waiting for <enter>
set virtualedit=block          " onemore 'block' makes it possible to edit empty space in visualblock
set ignorecase                 " (in)case sensitive search
set smartcase
set switchbuf=usetab

set synmaxcol=170              " Maximum column in which to search for syntax items
set splitbelow
set splitright
set gdefault                   " with this:  s/foo/bar --> s/foo/bar/g by default. ´g´ reverses its meaning.
set inccommand=nosplit
set sessionoptions=blank,buffers,curdir,folds,help,options,tabpages,winsize,resize

let g:tex_flavor = "latex"     " assuem *.tex are all latex files

if has('windows')
	set fillchars=vert:\┃  " ┃ line with no breaks between vertical splits
endif

if !exists("g:gui_oni")
	set laststatus=2 "always show status bar
else
	set laststatus=0 "always show status bar
endif

" Wildmenu completion {{{
set wildmenu
set wildmode=full
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

" Source {{{
if exists("g:gui_oni")
	source ~/.config/nvim/oni/mappings/oni.vim
endif

" }}}
