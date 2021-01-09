" Keep cursor position in files
" -----------------------------
" https://github.com/vim/vim/blob/eaf35241197fc6b9ee9af993095bf5e6f35c8f1a/runtime/defaults.vim#L108-L117
" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid, when inside an event handler
" (happens when dropping a file on gvim) and for a commit message (it's
" likely a different one than last time).
augroup vimStartup
  au!
  autocmd BufReadPost *
        \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
        \ |   exe "normal! g`\""
        \ | endif
augroup END


" Syntax for json comments (jsonc) (coc-vim)
autocmd FileType json syntax match Comment +\/\/.\+$+
autocmd BufNewFile,BufRead Dockerfile* set syntax=dockerfile


" Automatically resize when vim changes
au VimResized * exe "normal! \<c-w>="

" Settings
" --------
set hidden
set noshowmode                        " no extra --Insert--, --Replace-- etc
set pb=20           " transparency for popup, (default: 0)
set splitbelow
set splitright
set scrolloff=3            " visual rows above and below cursor
set sidescrolloff=5        " visual columns on sides of cursor

if has('windows')
  " ┃ line with no breaks between vertical splits
  set fillchars=vert:\│
endif

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
set shortmess+=c


" Tabs
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


set formatoptions+=n       " smart autoindenting inside numbered lists (I get defaut: jcroql)
set mouse=a                " mouse functionality (default: empty)
set virtualedit=block      " onemore 'block' makes it possible to edit empty space in visualblock
set timeoutlen=400         " ms to wait for command completion (default: 1000)
set smartcase
set ignorecase
set switchbuf=usetab       " look for open files

set inccommand=nosplit     " show incremental changes for |:substitute|, |:smagic|, |:snomagic|. |hl-Substitute|
set sessionoptions+=resize " changes effects of :mksession command.
set gdefault               " e.g. :%s/foo/bar -> :%s/foo/bar/g by default. ´g´ reverses its meaning.

" set ttimeoutlen=0              " don't wait for <esc> (default: 50)
" set ffs=unix,dos,mac                  " File Format (relevant to line ending type)
" set spelllang=sv,en_us                " US English spelling

" Folds
set foldmethod=indent
set foldlevelstart=99                 " start with fold everything
" set foldclosed=                        " all
" set foldtext=erik#settings#foldtext() " see nvim/autoload/erik/settings.vim


