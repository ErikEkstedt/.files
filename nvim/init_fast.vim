" vim: fdm=marker tw=0

" Problem
" I link this directory to ~/.vim and as such all files in plugin/, after/, etc are loaded.
" This is not ideal for trying out faster setups.

" Plug {{{
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  echo "No Vim-Plug available... Downloading and running PlugInstall"
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/bundle')
	" Standard
  Plug 'tpope/vim-commentary'            " XXX commenting
  Plug 'tpope/vim-repeat'                " XXX repeat commands not repeatable by 'vanilla' vim
  Plug 'tpope/vim-surround'              " XXX Surround objects with quotes, brackets ...
  Plug 'wellle/targets.vim'              " XXX ci' works on (, [, {, < on entire line
  Plug 'christoomey/vim-tmux-navigator'  " XXX navigate between vim and tmuz seemlessly
  Plug 'norcalli/nvim-colorizer.lua'     " faster color (disable coc-highlight)

  " completion / LSP
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'SirVer/ultisnips'                " XXX snippet engine
  Plug 'epilande/vim-es2015-snippets' " ES2015 code snippets
  Plug 'epilande/vim-react-snippets' " React code snippets
  Plug 'honza/vim-snippets'              " XXX snippets

	" Code Format
  Plug 'psf/black'  " Plug 'psf/black'
  Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}  " better python syntax highlight
  Plug 'yuezk/vim-js'
  Plug 'maxmellon/vim-jsx-pretty'

  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

  " Fuzzy Finding
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-telescope/telescope-fzf-writer.nvim'
  Plug 'nvim-telescope/telescope-fzy-native.nvim'

  Plug '~/.fzf'
  Plug 'junegunn/fzf.vim'                " XXX fuzzy filefinding
  Plug 'chengzeyi/fzf-preview.vim'

  " Statusline
  Plug 'airblade/vim-gitgutter'          " XXX see git changes in file in the numberline
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  " Colorschemes
  Plug 'gruvbox-community/gruvbox'        " maintained fork of 'morhetz/gruvbox'
  Plug 'tjdevries/colorbuddy.vim'
  Plug 'tjdevries/gruvbuddy.nvim'
call plug#end() " }}}
" Variables {{{
let mapleader = ','
let localleader = '\'

let g:tex_flavor = "latex"     " assuem *.tex are all latex files
let g:HOME = substitute(system('echo $HOME'), '\n', '', '') " Home directory
let g:UNAME = substitute(system('uname'), '\n', '', '') " Linux/Darwin
let g:BROWSER = "brave-browser"

if has("unix")  "Python & Node
  let g:loaded_python_provider = 0
  let g:python3_host_prog=g:HOME . '/miniconda3/envs/neovim3/bin/python'
  let g:python_host_bin=g:HOME . '/miniconda3/envs/neovim3/bin'
  let g:python_host_prog=g:HOME . '/miniconda3/envs/neovim2/bin/python'
endif " }}}
" Settings {{{
set number
set hidden
set termguicolors " Enable true color support.
set mouse=a       " mouse functionality (default: empty)
set splitbelow
set splitright
set foldlevelstart=99 " start with fold everything

" Automatically resize when vim changes
au VimResized * exe "normal! \<c-w>="

" Highlight text when yank. Built in lua.
if exists('##TextYankPost')
  au! TextYankPost * silent! lua vim.highlight.on_yank {higroup="DiffAdd", timeout=500}
endif

" Colorscheme
lua require'colorizer'.setup()
lua require('colorbuddy').colorscheme('wombatbuddy')

" LuaPlugins
lua require('telescope_settings')
" }}}
" Mappings Normal {{{
" Visual selection
nnoremap vv V
nnoremap V v$
nnoremap Y y$

" Copy to/from clipboard
nnoremap ,pa "+p
nnoremap <c-y> "+yy

" standard saving options
nnoremap <c-s> :w<cr>
nnoremap <c-q> :q!<cr>

" Store relative line number jumps in the jumplist if they exceed a threshold.
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : '') . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : '') . 'j'

" When vim wraps one line over several lines
" make j/k movie inside the line intuitively
nnoremap j gj
nnoremap k gk

" natural end/beginning of line movement
nnoremap L $
nnoremap H ^
nnoremap T H

" Buffers previous/next
nnoremap <space>b :bp<CR>
nnoremap <space>B :bf<CR>
nnoremap <space>p :bp<CR>
nnoremap <space>P :bf<CR>
nnoremap <space>n :bn<CR>
nnoremap <space>N :bl<CR>
nnoremap <space><space> :b#<CR>
nnoremap <space>d :bd<CR>
nnoremap <space>D :bd!<CR>

" Tmux now handles movement between windows and resizing
" Plugin 'edkolev/tmuxline.vim'
" Window Resizing
nnoremap <C-Left> :vertical resize -3<cr>
nnoremap <C-Right> :vertical resize +3<cr>
nnoremap <C-Down> :resize +3<cr>
nnoremap <C-Up> :resize -3<cr>

" Keep search matches in the middle of the window.
nnoremap n nzvzz
nnoremap N Nzvzz

" go to next under cursor
nnoremap gn *zvzz
nnoremap gN #zvzz

" */# now stays on current cursor position
nnoremap * *<c-o>
nnoremap # #<c-o>

" jump forward/back in jumplist but also center
nnoremap <C-O> <C-O>zz
nnoremap <C-i> <C-i>zz

" Folds
nnoremap <space>f za
nnoremap <space>a zA

" }}}
" Mappings Visual {{{
" Source lines
vnoremap <leader>sl y:@"<CR>:set hlsearch!<cr>

" increment 1 1 1 -> 2 3 4
vnoremap <leader>in g<C-a>

" Clipboard
vnoremap ,pa "+p
vnoremap <c-y> "+y

" indent/unindent with tab
vnoremap <s-tab> <gv
vnoremap <tab> >gv|

" natural end/beginning of line movement
vnoremap L $
vnoremap H ^
" }}}
" Mappings Insert {{{
" Use <Tab> and <S-Tab> for navigate completion list
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
imap <expr> <s-Tab> pumvisible() ? "\<C-P>" : "\<esc><<<left>i"
" }}}
" Mappings Selection {{{
" natural end/beginning of line movement
xnoremap L $
xnoremap H ^

xnoremap K {
xnoremap J }
" }}}
