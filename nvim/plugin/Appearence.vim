" vim: fdm=marker
" APPEARENCE
set termguicolors " Enable true color support.

" COLORSCHEME 
let g:seoul256_background = 234

augroup ColorSchemeGroup
  autocmd!
  autocmd VimEnter,ColorScheme * call ColorPatches()
  autocmd VimEnter,ColorScheme * call SyntaxColors()
augroup END

function! ColorPatches() "{{{
  if g:colors_name =~ 'seoul256'
    call Seoulpatch()
  elseif g:colors_name =~ 'wombat25mod'
    call Wombat256patch()
  elseif g:colors_name =~ 'monokai'
    call Monokaipatch()
  elseif g:colors_name =~ 'hydrangea'
    call Hydrangeapatch()
  elseif g:colors_name =~ 'onedark'
    call OnedarkPatch()
  endif
endfunc  "}}}

function! OnedarkPatch() "{{{
  let g:onedark_terminal_italics = 1
  hi Comment gui=italic
  hi String gui=italic
  hi Conceal guifg=#404040
  hi Conceal guibg=#282c34

  " Nerdtree
  hi Directory guifg=#414a59
  hi NERDTreeCWD guifg=#55b5be
  hi NERDTreeDir guifg=#5cade5
  hi NERDTreeDirSlash guifg=#55b5be
  hi NERDTreeFlags guifg=#55b5be
  hi NERDTreeGitStatusDirDirty guifg=#c678dd
  hi NERDTreeFile guifg=white
  hi NERDTreeBookmarksHeader guifg=#c678dd
  hi NERDTreeBookmarkName guifg=#abb2bf

  " call s:set_lightline_colorscheme('myonedark')
endfunc  "}}}

function! Seoulpatch() "{{{
  if &background == 'dark'
    hi Conceal guibg=g:seoul256_current_bg guifg=#404040
    hi Comment gui=italic
    hi String gui=italic

    hi Normal guibg=#242424
    hi StatuslineNC guifg=#060606 guibg=#707070 
    hi Statusline guifg=#060606 guibg=#A0A0A0

    hi SignColumn guibg=#333233
    hi GitGutterAdd guibg=#333233
    hi GitGutterChange guibg=#333233
    hi GitGutterDelete guibg=#333233
    hi GitGutterChangeDelete guibg=#333233
    hi SignColumn guibg=#333233

    hi VertSplit guifg=#060606 guibg=#060606
    hi NERDTreeDir guifg=#90a959 

    hi Pmenu guibg=#050505 guifg=#719872
    hi PmenuSel guifg=#dddd00 guibg=#1f82cd
    hi PmenuSbar guibg=#242424	
  endif
  call s:set_lightline_colorscheme('myseoul256')
  call NERDTreeColors()
endfunc  "}}}

function! Wombat256patch() "{{{
  hi Conceal guibg=#242424 guifg=#404040
  hi CursorLine guibg=#080808
  hi CursorLineNr guibg=#080808
  hi LineNr guibg=#333233
  hi Normal guibg=#242424

  hi GitGutterAdd guibg=#333233
  hi GitGutterChange guibg=#333233
  hi GitGutterDelete guibg=#333233
  hi GitGutterChangeDelete guibg=#333233
  hi SignColumn guibg=#333233
  hi ColorColumn guibg=#333233

  hi VertSplit guifg=#080808 guibg=#242424
  hi NonText guibg=#242424

  call NERDTreeColors()
  call s:set_lightline_colorscheme('mywombat')
  hi NERDTreeDir guifg=#0c58d3
endfunc "}}}

function! Monokaipatch () "{{{
  hi Comment gui=italic
  hi String gui=italic
  hi Conceal guifg=#404040
  hi Conceal guibg=#272822
  let g:monokai_gui_italic = 1
  " call s:set_lightline_colorscheme('molokai')
endfunc "}}}

function! Hydrangeapatch () "{{{
  hi Comment gui=italic
  hi String gui=italic
  hi Number guibg=#1e222c
endfunc "}}}

function! NERDTreeColors() "{{{
  hi Directory guifg=#404040
  hi NERDTreeCWD guifg=gray50
  hi NERDTreeFile guifg=white
  hi NERDTreeBookmarksHeader guifg=gray50
  hi NERDTreeBookmarkName guifg=gray50
endfunc "}}}

function! s:set_lightline_colorscheme(name) abort "{{{
  if !exists("g:gui_oni")
    let g:lightline.colorscheme = a:name
    call lightline#init()
    call lightline#colorscheme()
    call lightline#update()
  endif
endfunc "}}}

" NERDTree
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg) "{{{
  " overwrites colors for [✹] etc. looks dull
  " example:
  " call NERDTreeHighlightFile('py', 'green', 'none', 'PaleTurquoise', g:seoul256_background)
  exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
  exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction "}}}
" nnoremap <LocalLeader>n :call NERDTreeColors()<CR>

