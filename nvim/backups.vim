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
  set undodir=~/.vim/tmp/undo
  set undofile  "use undo files
endif

" Automatically create those folders if they don't already exist.
if !isdirectory(expand(&undodir))
  call mkdir(expand(&undodir), "p")
endif
if !isdirectory(expand(&directory))
  call mkdir(expand(&directory), "p")
endif
