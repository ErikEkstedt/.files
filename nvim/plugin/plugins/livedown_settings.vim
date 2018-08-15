" Vim-livedown-markdown

" should markdown preview get shown automatically upon opening markdown buffer
let g:livedown_autorun = 0

" should the browser window pop-up upon previewing
let g:livedown_open = 1 

" the port on which Livedown server will run
let g:livedown_port = 1337

" the browser to use
let g:livedown_browser = g:BROWSER
" let g:livedown_browser = "firefox"

" mappings in ftplugin/markdown
" nnoremap <localleader>ll :LivedownToggle<CR>
" nnoremap <localleader>lv  :LivedownPreview<CR>
