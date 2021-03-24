" vim: fdm=marker tw=0
" NeoVim
" This script contains all my plugins and settings
" The different settings for all plugins are located in ./after/plugin/
" Mappings are located in ./after/plugin/mappings/
" Unicode characters: https://www.w3schools.com/charsets/ref_utf_dingbats.asp

set number
set hidden
set signcolumn=yes
set laststatus=2  " always show status bar
set termguicolors " Enable true color support.
set background=dark
set hls           " highlighting!
filetype plugin indent on
syntax on

source $HOME/.files/nvim/settings.vim
source $HOME/.files/nvim/large_files.vim
source $HOME/.files/nvim/backups.vim
" source $HOME/.files/nvim/wildmenu.vim

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

  " completion / LSP
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'SirVer/ultisnips'                " XXX snippet engine
  Plug 'epilande/vim-es2015-snippets' " ES2015 code snippets
  Plug 'epilande/vim-react-snippets' " React code snippets
  Plug 'honza/vim-snippets'              " XXX snippets

  " Plug 'Shougo/neco-vim'

  " Languages
  " Plug 'psf/black', { 'tag': '19.10b0' } " Plug 'psf/black'
  Plug 'psf/black'  " Plug 'psf/black'
  Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}  " better python syntax highlight
  Plug 'jupyter-vim/jupyter-vim'        " interact with qtconsole
  Plug 'heavenshell/vim-pydocstring', { 'do': 'make install' }  " easily create docstrings
  let g:pydocstring_enable_mapping=0
  Plug 'yuezk/vim-js'
  Plug 'maxmellon/vim-jsx-pretty'

  " Plug 'prettier/vim-prettier', { 'do': 'yarn install', 'branch': 'release/0.x' }
  Plug 'plasticboy/vim-markdown'
  Plug 'lervag/vimtex'       " XXX latex compiler, preview latex pdf, highlight and syntax. alot more.
  Plug 'mhinz/neovim-remote' " Needed for vimtex. Error: 'compiler_progranme=nvr' / '--remote'
  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

  " Syntax
  Plug 'cespare/vim-toml'

  " Filemanager
  Plug 'kyazdani42/nvim-tree.lua'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'vimwiki/vimwiki'
  Plug 'tpope/vim-fugitive'              " XXX git tools

  " Tools
  Plug 'Raimondi/delimitMate'
  " Plug 'windwp/nvim-autopairs'
  Plug 'mg979/vim-visual-multi', {'branch': 'master'}
  Plug 'KabbAmine/vCoolor.vim'           " XXX pick color from menu
  " Plug 'Yggdroot/indentLine'             " XXX see where there is indent
  Plug 'lukas-reineke/indent-blankline.nvim', { 'branch': 'lua' }
  Plug 'tpope/vim-commentary'            " XXX commenting
  Plug 'tpope/vim-repeat'                " XXX repeat commands not repeatable by 'vanilla' vim
  Plug 'tpope/vim-surround'              " XXX Surround objects with quotes, brackets ...
  Plug 'wellle/targets.vim'              " XXX ci' works on (, [, {, < on entire line
  Plug 'phaazon/hop.nvim'
  Plug 'norcalli/nvim-colorizer.lua'     " faster color (disable coc-highlight)
  Plug 'junegunn/vim-easy-align'         " XXX better alignment than tabular
  Plug 'junegunn/vim-peekaboo'           " XXX when pressing quotes shows what's stored in the different registers
  Plug 'nelstrom/vim-visual-star-search' " * on visual select searches for the snippet
  Plug 'jpalardy/vim-slime'
  let g:slime_no_mappings=1  " don't set mappings
  Plug 'christoomey/vim-tmux-navigator'  " XXX navigate between vim and tmuz seemlessly
  " Plug 'tmux-plugins/vim-tmux-focus-events' " Focus events correctly triggered. Leaving/Returning to vim inside tmux
  let g:tmux_navigator_no_mappings = 1

  " Fuzzy Finding
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-telescope/telescope-fzf-writer.nvim'
  Plug 'nvim-telescope/telescope-fzy-native.nvim'
  " Plug 'sunjon/telescope-frecency'  " To try out

  Plug '~/.fzf'
  Plug 'junegunn/fzf.vim'                " XXX fuzzy filefinding
  Plug 'chengzeyi/fzf-preview.vim'
  " Plug 'alok/notational-fzf-vim'

  " Statusline
  Plug 'airblade/vim-gitgutter'          " XXX see git changes in file in the numberline
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  " Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}


  " Colorschemes
  Plug 'gruvbox-community/gruvbox'        " maintained fork of 'morhetz/gruvbox'
  Plug 'tjdevries/colorbuddy.vim'
  Plug 'tjdevries/gruvbuddy.nvim'
  " Plug 'ErikEkstedt/wombatbuddy.nvim'
  " Plug 'Th3Whit3Wolf/onebuddy'
  call plug#end()
  " }}}
  lua require'colorizer'.setup()
  lua require('colorbuddy').colorscheme('wombatbuddy')
  " tmp when using my custom colors
  nnoremap <leader>cc <cmd>e ~/.files/nvim/lua/wombatbuddy.lua<cr>
  " lua require('colorbuddy').colorscheme('gruvbuddy')
  " lua require('colorbuddy').colorscheme('onebuddy')
  " Colorschemes are plugins so they must be in here
  " let g:material_terminal_italics = 1
  " let g:material_theme_style = 'darker'
  " material molokai monokai onedark Tomorrow-Night hybrid substrata nord wombat
  " colorscheme gruvbox
endif "}}}

" Highlight text when yank. Built in lua.
if exists('##TextYankPost')
  au! TextYankPost * silent! lua vim.highlight.on_yank {higroup="DiffAdd", timeout=500}
endif

" lua << EOF
" require('nvim-autopairs').setup({
"   disable_filetype = { "TelescopePrompt"},
" })
" EOF

let g:background_color = synIDattr(hlID("Normal"), "bg")
let g:custom_focus=1  " enables custom focus in ./plugin/focus_background.vim

lua require('telescope_settings')
" lua require('galaxyline_settings')
source $HOME/.files/nvim/mappings/normal.vim
source $HOME/.files/nvim/mappings/insert.vim
source $HOME/.files/nvim/mappings/visual.vim
source $HOME/.files/nvim/mappings/selection.vim
source $HOME/.files/nvim/mappings/command.vim
source $HOME/.files/nvim/mappings/mouse.vim
