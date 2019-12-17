" vim: fdm=marker tw=0
" NeoVim
" This script contains all my plugins and settings
" The different settings for all plugins are located in ./after/plugin/
" Mappings are located in ./after/plugin/mappings/
"
" Unicode characters: https://www.w3schools.com/charsets/ref_utf_dingbats.asp

" Variables and Paths {{{
let g:HOSTNAME = substitute(system('hostname'), '\n', '', '') " What the hostname of the computer is /desktop/laptop
let g:HOME = substitute(system('echo $HOME'), '\n', '', '') " What the hostname of the computer is /desktop/laptop
let g:UNAME = substitute(system('uname'), '\n', '', '') " What the hostname of the computer is /desktop/laptop
let g:BROWSER = "brave-browser"

let mapleader = ','
let localleader = '\'
let g:tex_flavor = "latex"     " assuem *.tex are all latex files

" RunTimePath. Add fzf
set rtp+=~/.fzf

" Set Python/Npm paths {{{
if has("unix")  "Python & Node
	" This is probably not necessary and $HOME or similar might work.
    let g:loaded_python_provider = 0
		let g:python3_host_prog=g:HOME . '/miniconda3/envs/neovim3/bin/python'
		let g:python_host_prog=g:HOME . '/miniconda3/envs/neovim2/bin/python'
		let g:node_host_prog=g:HOME . '/.nvm/versions/node/v13.1.0/bin/neovim-node-host'
endif "}}}
" }}}

" Install Vim-Plug (if not installed) {{{
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  echo "No Vim-Plug available... Downloading and running PlugInstall"
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
              \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif "}}}

" Vim-Plug {{{
call plug#begin('~/.vim/bundle')

" ================ Deprecated ================

" Plug 'sjl/gundo.vim'                   " Visualize undo tree
" Plug 'tommcdo/vim-exchange'            " exchange two words. ex: cxw (on first word) . (on second)
" Plug 'tpope/vim-obsession'             " :mksession | saves a vim instance | used when saving tmux session
" Plug 'shime/vim-livedown'

" Not that useful
" Plug 'romainl/vim-cool'                " unhighlights searches when it is not needed anymor
" Plug 'junegunn/goyo.vim'               " Distraction free writing
Plug 'junegunn/vim-after-object'       " change everything after something
" Plug 'dhruvasagar/vim-zoom'

" Plug 'mxw/vim-jsx'
" Plug 'lepture/vim-jinja'

" ================ Interesting? ================
" Folding for python
" https://github.com/tmhedberg/SimpylFold
" Plug 'tmhedberg/SimpylFold'
" https://github.com/Konfekt/FastFold
" Plug 'Konfekt/FastFold'
Plug 'norcalli/nvim-colorizer.lua'  " faster color disable coc-highlight

" Testing
Plug 'alok/notational-fzf-vim'

" Code Formatting / Syntax
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}  " better python syntax highlight 
Plug 'ambv/black'                         " Linter/formatter
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'Shougo/neco-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'neoclide/coc-neco'                " XXX autocompletion + lsp
Plug 'SirVer/ultisnips'                " XXX snippet engine
Plug 'honza/vim-snippets'              " XXX snippets

Plug 'terryma/vim-multiple-cursors'    " XXX Really great but could try with coc
Plug 'scrooloose/nerdtree'             " XXX Project and file navigation
Plug 'Xuyuanp/nerdtree-git-plugin'     " XXX show git status of files
Plug 'ivalkeen/nerdtree-execute'       " XXX open files from nerdtree
Plug 'KabbAmine/vCoolor.vim'           " XXX pick color from menu
Plug 'Yggdroot/indentLine'             " XXX see where there is indent
" Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'airblade/vim-gitgutter'          " XXX see git changes in file in the numberline
Plug 'easymotion/vim-easymotion'       " XXX visualize targets tot move to specific words
Plug 'junegunn/fzf.vim'                " XXX fuzzy filefinding
Plug 'junegunn/vim-easy-align'         " XXX better alignment than tabular
Plug 'junegunn/vim-peekaboo'           " XXX when pressing quotes shows what's stored in the different registers
Plug 'lotabout/slimux'                 " XXX old: 'epeli/slimux' | vim+ipython OUtdated
Plug 'machakann/vim-highlightedyank'   " XXX Highlight yanks
" Plug 'nelstrom/vim-markdown-folding'   " XXX help with folding in markdown
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'nelstrom/vim-visual-star-search' " * on visual select searches for the snippet
Plug 'tpope/vim-commentary'            " XXX commenting
Plug 'tpope/vim-fugitive'              " XXX git tools
Plug 'tpope/vim-repeat'                " XXX repeat commands not repeatable by 'vanilla' vim
Plug 'tpope/vim-surround'              " XXX Surround objects with quotes, brackets ...
Plug 'wellle/targets.vim'              " XXX ci' works on (, [, {, < on entire line
Plug 'christoomey/vim-tmux-navigator'  " XXX navigate between vim and tmuz seemlessly
Plug 'tmux-plugins/vim-tmux-focus-events' " Focus events correctly triggered. Leaving/Returning to vim inside tmux
let g:tmux_navigator_no_mappings = 1


" Preview Text
Plug 'lervag/vimtex'       " XXX latex compiler, preview latex pdf, highlight and syntax. alot more.
Plug 'mhinz/neovim-remote' " Needed for vimtex. Error: 'compiler_progranme=nvr' / '--remote'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

" Colorschemes and Appearence {{{
Plug 'arzg/vim-substrata'
Plug 'benburrill/potato-colors'
Plug 'crusoexia/vim-monokai'
Plug 'mhartington/oceanic-next'
Plug 'morhetz/gruvbox'

Plug 'joshdick/onedark.vim'
Plug 'jacoborus/tender.vim'
Plug 'dracula/vim'
Plug 'tomasr/molokai'
Plug 'arcticicestudio/nord-vim'

call plug#end()
" }}}
" }}}

" Basic Settings {{{

set termguicolors " Enable true color support.
filetype plugin indent on
syntax enable
syntax on
set hls                        " highlighting!

" Colorschemes -----------------------------------
" colorscheme substrata 
colorscheme onedark 
" colorscheme nord 
" colorscheme OceanicNext

hi Folded guibg=clear
hi FoldColumn guibg=clear
hi MatchParen guifg=#ff008b

let g:background_color = synIDattr(hlID("Normal"), "bg")
let g:custom_focus=1  " enables custom focus in ./plugin/focus_background.vim

" COLORIZER TEST
lua require'colorizer'.setup()

" Settings
set spelllang=sv,en_us                " US English spelling
set ffs=unix,dos,mac                  " File Format (relevant to line ending type)
set backspace=indent,eol,start        " Make backspace work like most other apps.
set history=1000                      " Keep 1000 lines of command-line history.
set undolevels=1000                   " Keep 1000 lines of undo history.
set showcmd                           " Display incomplete commands.
set noshowmode                        " stops vims own showing below the statusbar.
set hidden                            " Allow unsaved background buffers.

set shortmess=I                       " Don't show Vim's welcome message.
set shortmess+=a                      " Make the save message shorter. Helps avoid the 'Hit ENTER to continue' message.
set shortmess+=c                      " see :help deoplete -> Configuration FAQ (ins-completion-menu)

set modeline                          " example at top of script:  " vim: ft=vim
set foldmethod=indent
set foldlevelstart=0                 " start with fold everything
set foldclose=                        " all
set foldtext=erik#settings#foldtext() " see nvim/autoload/erik/settings.vim
set conceallevel=0

set autoindent                        " enable auto-indentation
set bs=indent,eol,start               " allow backspacing over everything
set tabstop=2                         " no. of spaces for tab in file
set shiftwidth=2                      " no. of spaces for step in autoindent
set softtabstop=2                     " no. of spaces for tab when editing
set expandtab                         " expand tabs into spaces
set smarttab                          " smart tabulation and backspace

set nonumber                            " number lines
" Trying out without relative for speed and I dont use it
" set relativenumber
set scrolloff=3                       " visual rows above and below cursor
set sidescrolloff=3                  " visual columns on sides of cursor
set cursorline                        " highlight line where cursor is

" set completeopt-=preview
" set completeopt+=noinsert
set lazyredraw                 " don't redraw screen during macros
"
set formatoptions+=j           " smart line joining. uncomments comments.
set formatoptions+=n           " smart autoindenting inside numbered lists

" set nowrap
set wrapmargin=5
let &showbreak="↪"
set breakindent                " wrapped line s keep indentation (set bri)
set cpo+=n
set breakindentopt+=shift:2    " how far in the showbreak: " ↪ " is
set breakindentopt+=min:20

set list
set listchars=tab:\ \ ,trail:·,extends:▶,nbsp:·
" set listchars=tab:▶\ ,trail:·,extends:\#,nbsp:·
" set listchars=tab:\|\ ,trail:·,extends:▶,nbsp:·,conceal:\#
" set listchars=tab:▶\ ,trail:·,extends:\#,nbsp:.

set numberwidth=3              " width of numberline
set mouse=a                    " mouse functionality
" set mousemodel=popup
set timeoutlen=400               " ms to wait for command completion
set ttimeoutlen=0              " don't wait for <esc>
set incsearch                  " search starts when typing instead of waiting for <enter>
set virtualedit=block          " onemore 'block' makes it possible to edit empty space in visualblock
set ignorecase                 " (in)case sensitive search
set smartcase
set switchbuf=usetab

set splitbelow
set splitright

set signcolumn=yes
set gdefault                   " with this:  s/foo/bar --> s/foo/bar/g by default. ´g´ reverses its meaning.
set inccommand=nosplit
set sessionoptions=blank,buffers,curdir,folds,help,options,tabpages,winsize,resize

if has('windows')
	set fillchars=vert:\│ " ┃ line with no breaks between vertical splits
endif

" Transparancy

" PMenu
set pb=20
hi PmenuSel gui='bold'

" Floating windows
" set winblend=20


if exists("g:gui_oni")
	source ~/.config/nvim/oni/mappings/oni.vim
	set laststatus=0 "always show status bar
else
	set laststatus=2 "always show status bar
endif

" Wildmenu completion {{{
set wildoptions=pum
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
" Large Files {{{

" file is large from 5mb
let g:LargeFile = 1024 * 1024 * 5
augroup LargeFile
 autocmd BufReadPre * let f=getfsize(expand("<afile>")) | if f > g:LargeFile || f == -2 | call LargeFile() | endif
augroup END

function LargeFile()
 " no syntax highlighting etc
 set eventignore+=FileType
 " save memory when other file is viewed
 setlocal bufhidden=unload
 " is read-only (write with :w new_filename)
 " setlocal buftype=nowrite
 " no undo possible
 setlocal undolevels=-1
 " display message
 autocmd VimEnter *  echo "The file is larger than " . (g:LargeFile / 1024 / 1024) . " MB, so some options are changed (see .vimrc for details)."
endfunction

" }}}
" Backups {{{

" Backup
if exists('$SUDO_USER')
  set nobackup                        " enable backups
  set nowritebackup                        " enable backups
else
  set backupdir=~/.vim/tmp/backup/ " backups
  " Create folder if it does note exists
  if !isdirectory(expand(&backupdir))
    call mkdir(expand(&backupdir), "p")
  endif
endif

" Swapfile
if exists('$SUDO_USER')
  set noswapfile  enable backups
else
  set directory=~/.vim/tmp/swap//   " swap files
endif

" Undo
if exists('$SUDO_USER')
  set noundofile  " don't create root-owned files
else
  set undodir=~/.vim/tmp/undo//
  set undofile  "use undo files
endif

" Make those folders automatically if they don't already exist.
if !isdirectory(expand(&undodir))
	call mkdir(expand(&undodir), "p")
endif
if !isdirectory(expand(&directory))
	call mkdir(expand(&directory), "p")
endif
" }}}
"}}}

