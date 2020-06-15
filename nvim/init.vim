" vim: fdm=marker tw=0
" NeoVim
" This script contains all my plugins and settings
" The different settings for all plugins are located in ./after/plugin/
" Mappings are located in ./after/plugin/mappings/
" Unicode characters: https://www.w3schools.com/charsets/ref_utf_dingbats.asp

set number
set signcolumn=yes
set laststatus=2 "always show status bar
set termguicolors " Enable true color support.
set background=dark
set hls                        " highlighting!
filetype plugin indent on
syntax on

let mapleader = ','
let localleader = '\'

" global variables {{{
let g:tex_flavor = "latex"     " assuem *.tex are all latex files
let g:HOME = substitute(system('echo $HOME'), '\n', '', '') " Home directory
let g:UNAME = substitute(system('uname'), '\n', '', '') " Linux/Darwin
let g:BROWSER = "brave-browser"
" }}}
" Set Python/Npm paths {{{
if has("unix")  "Python & Node
  " This is probably not necessary and $HOME or similar might work.
  let g:loaded_python_provider = 0
  let g:python3_host_prog=g:HOME . '/miniconda3/envs/neovim3/bin/python'
  let g:python_host_bin=g:HOME . '/miniconda3/envs/neovim3/bin'
  let g:python_host_prog=g:HOME . '/miniconda3/envs/neovim2/bin/python'
  " let g:node_host_prog=g:HOME . '/.nvm/versions/node/v13.1.0/bin/neovim-node-host'
endif "}}}
if &loadplugins " {{{
  if empty(glob('~/.config/nvim/autoload/plug.vim'))
    echo "No Vim-Plug available... Downloading and running PlugInstall"
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
          \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  endif
  call plug#begin('~/.vim/bundle') "{{{

  " ================ Not used anymore ================
  " Plug 'sjl/gundo.vim'                   " Visualize undo tree
  " Plug 'tpope/vim-obsession'             " :mksession | saves a vim instance | used when saving tmux session
  " Plug 'machakann/vim-highlightedyank'   " Highlight yanks[DEPRECATED] Built-in now
  " Not that useful
  " Plug 'romainl/vim-cool'                " unhighlights searches when it is not needed anymor
  " Plug 'romainl/vim-qf'
  " Plug 'junegunn/goyo.vim'               " Distraction free writing
  " Plug 'junegunn/vim-after-object'       " change everything after something
  " Plug 'dhruvasagar/vim-zoom'
  " Plug 'mxw/vim-jsx'
  " Plug 'lepture/vim-jinja'

  " ================ Interesting? ================
  " Folding for python
  " https://github.com/tmhedberg/SimpylFold
  " Plug 'tmhedberg/SimpylFold'
  " https://github.com/Konfekt/FastFold
  " Plug 'Konfekt/FastFold'

  " testing
  Plug 'heavenshell/vim-pydocstring', { 'do': 'make install' }
  " Plug 'haorenW1025/floatLf-nvim'
  Plug 'yuezk/vim-js'
  Plug 'maxmellon/vim-jsx-pretty'
  Plug 'epilande/vim-es2015-snippets'
  Plug 'epilande/vim-react-snippets'

  " completion / LSP
  " Plug 'neovim/nvim-lsp'
  " Plug 'haorenW1025/completion-nvim'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  " Plug 'Shougo/neco-vim'
  Plug 'SirVer/ultisnips'                " XXX snippet engine
  Plug 'honza/vim-snippets'              " XXX snippets


  " Filemanager
  Plug 'kyazdani42/nvim-tree.lua'
  Plug 'kyazdani42/nvim-web-devicons'

  " Plug 'Xuyuanp/nerdtree-git-plugin'     " XXX show git status of files
  " Plug 'ivalkeen/nerdtree-execute'       " XXX open files from nerdtree
  Plug 'tpope/vim-fugitive'              " XXX git tools

  " Tools
  Plug 'Raimondi/delimitMate'
  Plug 'vimwiki/vimwiki'
  Plug 'mg979/vim-visual-multi', {'branch': 'master'}

  Plug 'KabbAmine/vCoolor.vim'           " XXX pick color from menu
  Plug 'Yggdroot/indentLine'             " XXX see where there is indent
  Plug 'tpope/vim-commentary'            " XXX commenting
  Plug 'tpope/vim-repeat'                " XXX repeat commands not repeatable by 'vanilla' vim
  Plug 'tpope/vim-surround'              " XXX Surround objects with quotes, brackets ...
  Plug 'wellle/targets.vim'              " XXX ci' works on (, [, {, < on entire line
  Plug 'easymotion/vim-easymotion'       " XXX visualize targets tot move to specific words
  Plug 'godlygeek/tabular'

  Plug '~/.fzf'
  Plug 'junegunn/fzf.vim'                " XXX fuzzy filefinding
  Plug 'alok/notational-fzf-vim'
  Plug 'chengzeyi/fzf-preview.vim'

  Plug 'junegunn/vim-easy-align'         " XXX better alignment than tabular
  Plug 'junegunn/vim-peekaboo'           " XXX when pressing quotes shows what's stored in the different registers
  Plug 'nelstrom/vim-visual-star-search' " * on visual select searches for the snippet
  Plug 'lotabout/slimux'                 " XXX
  " Plug 'jpalardy/vim-slime'

  Plug 'christoomey/vim-tmux-navigator'  " XXX navigate between vim and tmuz seemlessly
  Plug 'tmux-plugins/vim-tmux-focus-events' " Focus events correctly triggered. Leaving/Returning to vim inside tmux
  let g:tmux_navigator_no_mappings = 1

  " Code Formatting / Syntax / Preview
  Plug 'norcalli/nvim-colorizer.lua'  " faster color disable coc-highlight

  " Python
  Plug 'psf/black', { 'tag': '19.10b0' } " Plug 'psf/black'
  Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}  " better python syntax highlight
  Plug 'jupyter-vim/jupyter-vim'        " interact with qtconsole

  Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
  Plug 'plasticboy/vim-markdown'
  Plug 'lervag/vimtex'       " XXX latex compiler, preview latex pdf, highlight and syntax. alot more.
  Plug 'mhinz/neovim-remote' " Needed for vimtex. Error: 'compiler_progranme=nvr' / '--remote'
  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

  " Statusline
  Plug 'airblade/vim-gitgutter'          " XXX see git changes in file in the numberline
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  " Colorschemes
  Plug 'gruvbox-community/gruvbox'        " maintained fork of 'morhetz/gruvbox'
  Plug 'arzg/vim-substrata'
  Plug 'benburrill/potato-colors'
  Plug 'crusoexia/vim-monokai'
  Plug 'mhartington/oceanic-next'
  Plug 'joshdick/onedark.vim'
  Plug 'jacoborus/tender.vim'
  Plug 'dracula/vim'
  Plug 'tomasr/molokai'
  Plug 'arcticicestudio/nord-vim'
  Plug 'kaicataldo/material.vim'
  Plug 'sheerun/vim-wombat-scheme'
  Plug 'w0ng/vim-hybrid'

  call plug#end() " }}}
  lua require'colorizer'.setup()
  " Colorschemes are plugins so they must be in here
  " let g:material_terminal_italics = 1
  " let g:material_theme_style = 'darker'
  " colorscheme material
  " colorscheme molokai
  " colorscheme monokai
  " colorscheme onedark
  colorscheme gruvbox
  " colorscheme Tomorrow-Night
  " colorscheme hybrid
  " colorscheme substrata
  " colorscheme nord
  " colorscheme wombat
endif
"}}}

let g:background_color = synIDattr(hlID("Normal"), "bg")
let g:custom_focus=1  " enables custom focus in ./plugin/focus_background.vim

" Settings {{{
set hidden
set noshowmode                        " no extra --Insert--, --Replace-- etc
set pb=20           " transparency for popup, (default: 0)

" shortmess: help 'shortmess'
set shortmess=f            " f	use "(3 of 5)" instead of "(file 3 of 5)"
set shortmess+=i           " use "[noeol]" instead of "[Incomplete last line]"
set shortmess+=l           " use "999L, 888C" instead of "999 lines, 888 characters"
set shortmess+=m           " use "[+]" instead of "[Modified]"
set shortmess+=n           " use "[New]" instead of "[New File]"
set shortmess+=r           " use "[RO]" instead of "[readonly]"
set shortmess+=w           " use "[w]" instead of "written" for file write message
set shortmess+=x           " use "[dos]" instead of "[dos format]", "[unix]" instead of
set shortmess+=I           " Don't show Vim's welcome message.
set expandtab              " expand tabs into spaces (default: off)
set tabstop=4              " no. of spaces for tab in file (default: 8)
set shiftwidth=4           " no. of spaces for step in autoindent (default: 8)
set list                   " show spaces and tabs
set listchars=tab:▶-\ ,trail:·,extends:▶,nbsp:·
set tw=120
set nowrap                 " No linewrap by default
set wrapmargin=5
let &showbreak="↪"
set linebreak              " If on, Vim will wrap long lines at a character in 'breakat' rather than at the last character that fits on the screen.
set breakindent            " wrapped line s keep indentation (set bri)
set scrolloff=3            " visual rows above and below cursor
set sidescrolloff=5        " visual columns on sides of cursor
set formatoptions+=n       " smart autoindenting inside numbered lists (I get defaut: jcroql)
set mouse=a                " mouse functionality (default: empty)
set virtualedit=block      " onemore 'block' makes it possible to edit empty space in visualblock
set timeoutlen=400         " ms to wait for command completion (default: 1000)
set smartcase
set ignorecase
set switchbuf=usetab       " look for open files
set splitbelow
set splitright
set inccommand=nosplit     " show incremental changes for |:substitute|, |:smagic|, |:snomagic|. |hl-Substitute|
set sessionoptions+=resize " changes effects of :mksession command.
set gdefault               " e.g. :%s/foo/bar -> :%s/foo/bar/g by default. ´g´ reverses its meaning.

" set ttimeoutlen=0              " don't wait for <esc> (default: 50)
" set ffs=unix,dos,mac                  " File Format (relevant to line ending type)
" set spelllang=sv,en_us                " US English spelling

" Folds
set foldmethod=indent
" set foldlevelstart=0                 " start with fold everything
" set foldclosed=                        " all
" set foldtext=erik#settings#foldtext() " see nvim/autoload/erik/settings.vim


if has('windows')
  " ┃ line with no breaks between vertical splits
  set fillchars=vert:\│
endif


if exists("g:gui_oni")
  source ~/.config/nvim/oni/mappings/oni.vim
  set laststatus=0 "always show status bar  (default: 2)
endif
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
  set nobackup
  set nowritebackup
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

" Automatically create those folders if they don't already exist.
if !isdirectory(expand(&undodir))
  call mkdir(expand(&undodir), "p")
endif
if !isdirectory(expand(&directory))
  call mkdir(expand(&directory), "p")
endif
" }}}
" Wildmenu completion {{{
" set wildoptions=pum        " default: pum,tagfile
" set wildignore  default: empty
" set wildignore=.hg,.git,.svn                    " Version control
" set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
" set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
" set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
" set wildignore+=*.spl                            " compiled spelling word lists
" set wildignore+=*.sw?                            " Vim swap files
" set wildignore+=*.DS_Store                       " OSX bullshit
" set wildignore+=*.luac                           " Lua byte code
" set wildignore+=migrations                       " Django migrations
" set wildignore+=*.pyc                            " Python byte code
" set wildignore+=*.orig                           " Merge resolution files
" set wildignore+=*.fasl                           " Lisp FASLs

" }}}
