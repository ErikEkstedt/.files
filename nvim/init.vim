" NeoVim
" Erik
" Ubuntu 16.04
" Unicode characters: https://www.w3schools.com/charsets/ref_utf_dingbats.asp

set nocompatible              " be iMproved, required
if empty(glob('~/.config/nvim/autoload/plug.vim'))
	echo "No Vim-Plug available... Downloading and running PlugInstall"
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"============= Vim-Plug ======================{{{
" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/bundle')

" ============ Code/Project Navigation ================
Plug 'scrooloose/nerdtree'                " Project and file navigation
Plug 'tpope/vim-fugitive'                 " git extension
Plug 'airblade/vim-gitgutter'             " see git changes in file in the numberline
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'junegunn/fzf.vim'                   " fuzzy filefinding

" ============ Appearence =============================
Plug 'Yggdroot/indentLine'                " see where there is indent
Plug 'itchyny/lightline.vim'              " light weight status bar
Plug 'vim-scripts/Wombat'		              " Wombat colorscheme
Plug 'edkolev/tmuxline.vim'
Plug 'junegunn/goyo.vim'									" Distraction free writing
Plug 'junegunn/limelight.vim'							" Focus colors

" ============ Colorschemes ===========================
Plug 'chriskempson/base16-vim'
Plug 'skielbasa/vim-material-monokai'

" ============ Useful Tools ===========================
Plug 'epeli/slimux'                       " vim+ipython REPL
Plug 'tpope/vim-surround'                 " Parentheses, brackets, quotes, XML tags, and more
Plug 'tpope/vim-repeat'                   " repeat commands not repeatable by 'vanilla' vim
Plug 'godlygeek/tabular'                  " structure text
Plug 'tomtom/tcomment_vim'                " smart comments
Plug 'christoomey/vim-tmux-navigator'     " navigate between vim and tmuz seemlessly
Plug 'itchyny/calendar.vim'               " Calendar for vim
Plug 'Valloric/MatchTagAlways'
Plug 'nelstrom/vim-visual-star-search'    " * on visual select seraches for the snippet
" Plug 'vimwiki/vimwiki'                    " Personal Wiki

" ============ Auto-Completion ========================
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'Shougo/neco-vim'
Plug 'davidhalter/jedi-vim'

" ============ Preview Text ===========================
Plug 'lervag/vimtex'                      " latex compiler and alot more.
Plug 'Rykka/riv.vim'                      " ReStructuredText plug
Plug 'Rykka/InstantRst'                   " Preview rst in browser (Fast)
Plug 'shime/vim-livedown'									" Preview markdowns with npm/node Livedown

" ============ Completion and Syntax ==================
Plug 'klen/python-mode'                   " Python mode (docs, refactor, lints...)
Plug 'scrooloose/syntastic'             " Syntax checking plug for Vim
Plug 'PotatoesMaster/i3-vim-syntax'     " syntax for i3 config
Plug 'octol/vim-cpp-enhanced-highlight' " Extra highlight for cpp
Plug 'othree/xml.vim'
Plug 'nelstrom/vim-markdown-folding'    " help with folding in markdown

" ============ Snippets ===============================
Plug 'SirVer/ultisnips'                 " snippet engine
Plug 'honza/vim-snippets'               " snippets
call plug#end()
"}}}
"=============== Basic ======================={{{
" fzf path
set rtp+=~/.fzf
set rtp+=~/.files/vim

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

source ~/.config/nvim/Abbreviations.vim
source ~/.config/nvim/Appearence.vim
source ~/.config/nvim/Autocommands.vim
source ~/.config/nvim/Mappings.vim
source ~/.config/nvim/Functions.vim
source ~/.config/nvim/PluginSettings.vim
