" Consistent files over multiple nvim sessions (after save, may have different unwritten buffers)

" Inspiration: greg hurrell
" 'Settings V' speaking about `shortmess`: https://youtu.be/fm33-Pas7vI?t=197
" 'Terminus' speaking about focus events:  https://youtu.be/wRII9nHCixU?t=113

" Help
" FocusGained / FocusLost
"   - Tmux: requires 'set -g focus-events on'
" checktime
" autoread (default: on)
" shortmess=A  ignore swapfile messages

set shortmess+=A  " ignore swapfile messages
augroup focus
  au!
  au FocusGained * silent! checktime
augroup END

