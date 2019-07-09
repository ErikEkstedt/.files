" NerdTree

if !exists("loaded_nerd_tree")
    finish
endif

let NERDTreeIgnore=['\.pyc$', '\.aux$', '\.out', '\.bbl$', '\.fls$', '\.blg$', '\.fdb_latexmk$','\.gz$']
let NERDTreeShowBookmarks = 1
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''
let g:NERDTreeMouseMode=2  " Single-click to toggle directory nodes, double-click to open non-directory nodes.

" NERDTree on startup
" if !exists("g:gui_oni")
" 	autocmd StdinReadPre * let s:std_in=1
" 	autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" 	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" endif

" Mappings
nnoremap <leader>ne :NERDTreeToggle<CR>

augroup NerdTreeHi
  autocmd!
  autocmd VimEnter,ColorScheme * if g:colors_name =~ 'seoul256'
    hi NERDTreeDir guifg=#90a959
    hi Directory guifg=#404040
    hi NERDTreeCWD guifg=gray90
    hi NERDTreeFile guifg=gray90
    hi NERDTreeUp guifg=gray90 guibg=gray20
    hi NERDTreeBookmarksHeader guifg=#90a959
    hi NERDTreeBookmarkName guifg=gray90 
  autocmd VimEnter,ColorScheme * if g:colors_name =~ 'onedark'
    hi NERDTreeDir guifg=#ff32cd
    hi Directory guifg=#ff32cd
    hi NERDTreeCWD guifg=gray90
    hi NERDTreeFile guifg=#dedfde
    hi NERDTreeBookmarksHeader guifg=#90a959
    hi NERDTreeBookmarkName guifg=#7d00ad
augroup END
