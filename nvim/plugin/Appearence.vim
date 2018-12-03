" vim: fdm=marker
" APPEARENCE
set termguicolors " Enable true color support.

" COLORSCHEME 
let g:seoul256_background = 234

augroup ColorSchemeGroup
  autocmd!
  autocmd VimEnter,ColorScheme * call ColorPatches()
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
  let g:background_color = '#282C34'
  let g:status_background_color = '#010101'

  hi StatusLine guibg=g:status_background_color guifg=#00deff gui=bold
  exe 'hi! StatusLineNC guibg=' . g:status_background_color . ' guifg=#00a2ba'

  hi Comment gui=italic
  hi String gui=italic

  hi Conceal guibg=#282c34 guifg=#404040 
  hi LineNr guibg=g:background_color guifg=#5C6370
  hi SignColumn guibg=g:background_color
  hi FoldColumn guibg=g:background_color
  hi ColorColumn guibg=#24282e
  hi Folded guibg=g:background_color guifg=#148791
  hi EndOfBuffer guibg=g:background_color

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

  " VIM
  hi vimAugroup guifg=#4c03d4
  hi vimAugroupKey guifg=#4c03d4
  hi vimIsCommand guifg=#00bbff
  hi vimCommand guifg=#e400ff
  hi vimFunction guifg=#f043b5
  hi vimLineComment guifg=#5b6378
  hi vimVar guifg=#ff00d5
  hi vimHiGroup guifg=#56f482
  hi vimHighlight guifg=#a000ff
  hi vimLet guifg=#a000ff
  hi vimHiKeyList guifg=#9500df
  hi vimHiGuiFgBg guifg=#ff00b8

  " ZSH
  hi zshKeyword guifg=#6338e3
  hi zshCommands guifg=#ff008d
  hi zshFunction guifg=#ff00f6
  hi zshVariableDef guifg=#00ff8c
  hi zshBrackets guifg=#ff8000
  hi zshTypes guifg=#ff8000

  " GitGutter
  hi GitGutterDelete guibg=#282c34 guifg=#AA0000
  hi GitGutterChangeDelete guibg=#282c34
  hi GitGutterAdd guibg=#282c34 guifg=#00ff52
  hi GitGutterChange guibg=#282c34 guifg=#ff8200
  
  " Selection menu colors
  hi Pmenu guibg=#24282e guifg=#00fbff
  hi PmenuSel guibg=#272a30 gui=NONE guifg=#ff00f3
  hi PmenuSbar guibg=#000000
  hi PmenuThumb guibg=#FF00DE
endfunc  "}}}

function! Monokaipatch () "{{{
  let g:background_color = "#32332b"
  let g:monokai_gui_italic = 1
  let g:status_background_color = '#2d2e27'

  hi Comment guifg=#787d5f guibg=g:background_color
  hi String gui=italic

  exe 'hi! StatusLine guibg=' . g:status_background_color . ' guifg=#00deff gui=bold'
  exe 'hi! StatusLineNC guibg=' . g:status_background_color . ' guifg=#00a2ba gui=None'

  hi Normal guibg=#32332b
  hi Conceal guibg=g:background_color guifg=#75715E
  hi Folded guibg=g:background_color guifg=#73785b
  hi LineNr guibg=g:background_color guifg=#75715E
  hi CursorLineNr guibg=g:background_color guifg=#eba510
  hi SignColumn guibg=g:background_color
  hi FoldColumn guibg=g:background_color
  hi EndOfBuffer guibg=g:background_color
  hi CursorLine guibg=#404038
  hi ColorColumn guibg=#2d2e27
  hi vertsplit guibg=g:background_color

  " Selection menu colors
  hi Pmenu guibg=#24282e guifg=#00fbff
  hi PmenuSel guibg=#272a30 gui=NONE guifg=#ff00f3
  hi PmenuSbar guibg=#000000
  hi PmenuThumb guibg=#FF00DE

  " VIM
  hi vimLineComment guifg=#5f634b
  hi vimCommand guifg=#ae81ff
  hi vimFunction guifg=#A6E22D
  hi vimHighlight guifg=#e73c50
  hi vimVar guifg=#f92772
  hi vimLet guifg=#ae81ff
  hi vimHiGroup guifg=#A6E22D
  hi vimHiGuiFgBg guifg=#66d9ef
  hi vimAugroup guifg=#E6db74
  hi vimAugroupKey guifg=#E6db74

  " ZSH
  hi zshKeyword guifg=#6338e3
  hi zshCommands guifg=#ff008d
  hi zshFunction guifg=#ff00f6
  hi zshVariableDef guifg=#00ff8c
  hi zshBrackets guifg=#ff8000
  hi zshTypes guifg=#ff8000

  " GitGutter
  hi GitGutterDelete guifg=#AA0000
  hi GitGutterChangeDelete guibg=#E6DB74
  hi GitGutterAdd guifg=#A6E22D
  hi GitGutterChange guifg=#ff8200
  " call s:set_lightline_colorscheme('molokai')
endfunc "}}}

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

  call s:set_lightline_colorscheme('mywombat')
  hi NERDTreeDir guifg=#0c58d3
endfunc "}}}

function! Hydrangeapatch () "{{{
  hi Comment gui=italic
  hi String gui=italic
  hi Number guibg=#1e222c
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

