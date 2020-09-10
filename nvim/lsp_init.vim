set hidden
set number
set termguicolors " Enable true color support.

let g:HOME = substitute(system('echo $HOME'), '\n', '', '') " Home directory
if has("unix")  "Python & Node
  let g:loaded_python_provider = 0
  let g:python3_host_prog=g:HOME . '/miniconda3/envs/neovim3/bin/python'
  let g:python_host_bin=g:HOME . '/miniconda3/envs/neovim3/bin'
  let g:python_host_prog=g:HOME . '/miniconda3/envs/neovim2/bin/python'
endif "}}}

if empty(glob('~/.config/nvim/autoload/plug.vim'))
  echo "No Vim-Plug available... Downloading and running PlugInstall"
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


call plug#begin('~/.vim/bundle') "{{{
" Builtin LSP
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/diagnostic-nvim'
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-lua/completion-nvim'

Plug 'gruvbox-community/gruvbox'        " maintained fork of 'morhetz/gruvbox'
" completion / LSP
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'SirVer/ultisnips'                " XXX snippet engine
Plug 'honza/vim-snippets'              " XXX snippets
call plug#end()

colorscheme gruvbox

" source $HOME/.files/nvim/wildmenu.vim
lua require('my_lsp_settings')
