" vim: fdm=marker tw=0
" NeoVim
" This script contains all my plugins and settings
" The different settings for all plugins are located in ./after/plugin/
" Mappings are located in ./after/plugin/mappings/
" Unicode characters: https://www.w3schools.com/charsets/ref_utf_dingbats.asp

set number
set signcolumn=yes
set laststatus=2  " always show status bar
set termguicolors " Enable true color support.
set background=dark
set hls           " highlighting!
filetype plugin indent on
syntax on


" global variables {{{
let mapleader = ','
let localleader = '\'

let g:tex_flavor = "latex"     " assuem *.tex are all latex files
let g:HOME = substitute(system('echo $HOME'), '\n', '', '') " Home directory
let g:UNAME = substitute(system('uname'), '\n', '', '') " Linux/Darwin
let g:BROWSER = "brave-browser"
" }}}

" Set Python/Npm paths {{{
if has("unix")  "Python & Node
  let g:loaded_python_provider = 0
  let g:python3_host_prog=g:HOME . '/miniconda3/envs/neovim3/bin/python'
  let g:python_host_bin=g:HOME . '/miniconda3/envs/neovim3/bin'
  let g:python_host_prog=g:HOME . '/miniconda3/envs/neovim2/bin/python'
  " let g:node_host_prog=g:HOME . '/.nvm/versions/node/v13.11.0/bin/neovim-node-host'
endif "}}}

if &loadplugins " {{{
  if empty(glob('~/.config/nvim/autoload/plug.vim'))
    echo "No Vim-Plug available... Downloading and running PlugInstall"
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
          \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  endif
  call plug#begin('~/.vim/bundle') "{{{
  " Plug '/mytest-nvim'
  " Plug 'yuezk/vim-js'
  " Plug 'maxmellon/vim-jsx-pretty'
  " Plug 'epilande/vim-es2015-snippets'
  " Plug 'epilande/vim-react-snippets'

  " completion / LSP
  " Telescope:  https://github.com/nvim-lua/telescope.nvim
  " Plug 'nvim-lua/popup.nvim'
  " Plug 'nvim-lua/plenary.nvim'
  " Plug 'nvim-lua/telescope.nvim'
  Plug 'tjdevries/nlua.nvim'
  Plug 'neovim/nvim-lspconfig'
  Plug 'nvim-lua/completion-nvim'
  Plug 'nvim-lua/diagnostic-nvim'
  " Plug 'Shougo/neco-vim'
  " Plug 'neovim/nvim-lsp'
  " Plug 'nvim-treesitter/nvim-treesitter'

  " completion / LSP
  " Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'SirVer/ultisnips'                " XXX snippet engine
  Plug 'honza/vim-snippets'              " XXX snippets


  " Python
  Plug 'psf/black', { 'tag': '19.10b0' } " Plug 'psf/black'
  Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}  " better python syntax highlight
  Plug 'jupyter-vim/jupyter-vim'        " interact with qtconsole
  Plug 'heavenshell/vim-pydocstring', { 'do': 'make install' }  " easily create docstrings
  let g:pydocstring_enable_mapping=0

  Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
  Plug 'plasticboy/vim-markdown'
  Plug 'lervag/vimtex'       " XXX latex compiler, preview latex pdf, highlight and syntax. alot more.
  Plug 'mhinz/neovim-remote' " Needed for vimtex. Error: 'compiler_progranme=nvr' / '--remote'
  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

  " Filemanager
  Plug 'kyazdani42/nvim-tree.lua'
  Plug 'kyazdani42/nvim-web-devicons'
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
  " Plug 'tmux-plugins/vim-tmux-focus-events' " Focus events correctly triggered. Leaving/Returning to vim inside tmux
  let g:tmux_navigator_no_mappings = 1

  " Statusline
  Plug 'airblade/vim-gitgutter'          " XXX see git changes in file in the numberline
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  " Code Formatting / Syntax / Preview
  Plug 'norcalli/nvim-colorizer.lua'  " faster color disable coc-highlight

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
  call plug#end()
  " }}}
  lua require'colorizer'.setup()
  " Colorschemes are plugins so they must be in here
  " let g:material_terminal_italics = 1
  " let g:material_theme_style = 'darker'
  " material molokai monokai onedark Tomorrow-Night hybrid substrata nord wombat
  colorscheme gruvbox
endif "}}}


let g:background_color = synIDattr(hlID("Normal"), "bg")
let g:custom_focus=1  " enables custom focus in ./plugin/focus_background.vim

source $HOME/.files/nvim/settings.vim
source $HOME/.files/nvim/large_files.vim
source $HOME/.files/nvim/backups.vim
" source $HOME/.files/nvim/wildmenu.vim
lua require('lsp_settings')
