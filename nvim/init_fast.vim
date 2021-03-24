" vim: fdm=marker tw=0

" Problem
" I link this directory to ~/.vim and as such all files in plugin/, after/, etc are loaded.
" This is not ideal for trying out faster setups.

"	Plug {{{
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  echo "No Vim-Plug available... Downloading and running PlugInstall"
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/bundle')

	" Standard
  Plug 'nvim-lua/plenary.nvim'
  Plug 'tpope/vim-commentary'            " XXX commenting
  Plug 'tpope/vim-repeat'                " XXX repeat commands not repeatable by 'vanilla' vim
  Plug 'tpope/vim-surround'              " XXX Surround objects with quotes, brackets ...
  Plug 'wellle/targets.vim'              " XXX ci' works on (, [, {, < on entire line
  Plug 'christoomey/vim-tmux-navigator'  " XXX navigate between vim and tmuz seemlessly
  let g:tmux_navigator_no_mappings = 1
  Plug 'norcalli/nvim-colorizer.lua'     " faster color (disable coc-highlight)
  Plug 'Raimondi/delimitMate'
  Plug 'KabbAmine/vCoolor.vim'           " XXX pick color from menu
  Plug 'nelstrom/vim-visual-star-search' " * on visual select searches for the snippet
	Plug 'wincent/loupe'
	let g:LoupeHighlightGroup='LoupeCurrentSearch'

  Plug 'jpalardy/vim-slime'
  let g:slime_no_mappings=1  " don't set mappings

  " completion / LSP
  " Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'neovim/nvim-lspconfig'
	Plug 'hrsh7th/nvim-compe'
	set completeopt=menuone,noselect
	inoremap <silent><expr> <CR>  compe#confirm({ 'keys': "\<Plug>delimitMateCR", 'mode': '' })
	inoremap <silent><expr> <C-e> compe#close('<C-e>')
	inoremap <silent><expr> <C-f> compe#scroll({ 'delta': +4 })
	inoremap <silent><expr> <C-d> compe#scroll({ 'delta': -4 })

  Plug 'SirVer/ultisnips'                " XXX snippet engine
	" set here to not overwrite <Tab> mappings below
	let g:UltiSnipsExpandTrigger='<leader><leader>'
	let g:UltiSnipsJumpForwardTrigger="<c-l>"
	let g:UltiSnipsJumpBackwardTrigger="<c-h>"

	" Snippets
  Plug 'epilande/vim-es2015-snippets' " ES2015 code snippets
  Plug 'epilande/vim-react-snippets' " React code snippets
  Plug 'honza/vim-snippets'              " XXX snippets


	" Code Format
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
	Plug 'psf/black'  " Plug 'psf/black'
	" Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}  " better python syntax highlight
	Plug 'yuezk/vim-js'
	Plug 'maxmellon/vim-jsx-pretty'

  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

  " Fuzzy Finding
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-telescope/telescope-fzf-writer.nvim'
  Plug 'nvim-telescope/telescope-fzy-native.nvim'

  Plug '~/.fzf'
  Plug 'junegunn/fzf.vim'                " XXX fuzzy filefinding
  Plug 'chengzeyi/fzf-preview.vim'

  " Statusline
  " Plug 'airblade/vim-gitgutter'          " XXX see git changes in file in the numberline
	Plug 'lewis6991/gitsigns.nvim'
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
set scrolloff=3            " visual rows above and below cursor
set sidescrolloff=5        " visual columns on sides of cursor
set foldlevelstart=99 " start with fold everything
set nowrap
set noshowmode                        " no extra --Insert--, --Replace-- etc
set pb=20           " transparency for popup, (default: 0)
set ignorecase
set smartcase
set signcolumn=yes

source $HOME/.files/nvim/backups.vim
" }}}

" AU {{{
" Keep cursor position in files
" https://github.com/vim/vim/blob/eaf35241197fc6b9ee9af993095bf5e6f35c8f1a/runtime/defaults.vim#L108-L117
augroup vimStartup
  au!
  autocmd BufReadPost *
        \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
        \ |   exe "normal! g`\""
        \ | endif
augroup END

" Automatically resize when vim changes
au VimResized * exe "normal! \<c-w>="

" Highlight text when yank. Built in lua.
if exists('##TextYankPost')
  au! TextYankPost * silent! lua vim.highlight.on_yank {higroup="DiffAdd", timeout=500}
endif
" }}}

" LuaPlugins {{{
lua require('colorizer').setup()
lua require('gitsigns').setup()
lua require('telescope_settings')
lua require('treesitter_settings')
lua require('compe_settings')
lua require('lsp_settings')

" sign define LspDiagnosticsSignError text=! texthl=LspDiagnosticsSignError linehl= numhl=LspDiagnosticsSignError
" sign define LspDiagnosticsSignWarning text=? texthl=LspDiagnosticsSignWarning linehl= numhl=LspDiagnosticsSignWarning
" sign define LspDiagnosticsSignInformation text=I texthl=LspDiagnosticsSignInformation linehl= numhl=
" sign define LspDiagnosticsSignHint text= texthl=LspDiagnosticsSignHint linehl= numhl=


" Colorscheme
lua require('colorbuddy').colorscheme('wombatbuddy')
nnoremap <leader>cc <cmd>vsp ~/.files/nvim/lua/wombatbuddy.lua<CR>
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

" Toggle hlsearch
nnoremap <silent><space>ss :set hlsearch!<CR>

" jump forward/back in jumplist but also center
nnoremap <C-O> <C-O>zz
nnoremap <C-i> <C-i>zz

" Folds
nnoremap <space>f za
nnoremap <space>a zA
nnoremap ga zA

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
vnoremap <S-Tab> <gv
vnoremap <Tab> >gv

" indent paragraphs
nnoremap <leader>mm vip=

" natural end/beginning of line movement
vnoremap L $
vnoremap H ^
" }}}
" Mappings Insert {{{
" Use <Tab> and <S-Tab> for navigate completion list
inoremap <expr> <Tab> pumvisible() ? "\<C-N>" : "\<Tab>"
imap <expr> <s-Tab> pumvisible() ? "\<C-P>" : "\<esc><<<left>i"
" }}}
" Mappings Command {{{
cnoremap <c-a> <Home>
" }}}
" Mappings Selection {{{
" natural end/beginning of line movement
xnoremap L $
xnoremap H ^

xnoremap K {
xnoremap J }
" }}}
