" vim:fdm=marker

if exists("syntax_on")
  syntax reset
endif

let g:colors_name="one_dark"

let s:bg_color='#141619'
let s:bg_color_original='#282c34'
let s:bg_color_lighter='#171922'
let s:bg_color_darker='#121417'

let s:black        = '#010101'
let s:grey         = '#abb2bf'
let s:cursor_grey  = '#ab9c9c'
let s:comment_grey = '#4a4444'
let s:light_red    = '#e06c75'
let s:red          = '#be5046'
let s:green        = '#98c379'
let s:yellow       = '#e5c07b'
let s:dark_yellow  = '#b07e0f'
let s:orange       = '#d19a66'
let s:blue         = '#61afef'
let s:pink         = '#ff00f6'
let s:purple       = '#8f00ff'
let s:cyan         = '#56b6c2'
let s:dark_grey    = '#4b5263'
let s:light_grey   = '#5c6370'


" Selection menu colors
hi Pmenu guibg=#24282e guifg=#00fbff
hi PmenuSel guibg=#272a30 gui=NONE guifg=#ff00f3
hi PmenuSbar guibg=#000000
hi PmenuThumb guibg=#FF00DE

exe 'hi! StatusLine guibg=' . s:bg_color
exe 'hi! ColorColumn guibg=' . s:bg_color 
exe 'hi! Conceal guibg=' . s:bg_color_darker . ' guifg=#404040' 
exe 'hi! FoldColumn guibg=' . s:bg_color
exe 'hi! Folded guibg=' . s:bg_color . ' guifg=#148791'
exe 'hi! SignColumn guibg=' . s:bg_color
exe 'hi! LineNr guibg=' . s:bg_color . ' guifg=#25282e'
exe 'hi! CursorLineNr guibg=' s:bg_color . ' guifg=#5C6370'
exe 'hi! CursorLine guibg=' . s:bg_color_lighter


" Regular
" {{{
" call s:h("CursorIM", {}) " like Cursor, but used when in IME mode
" call s:h("Debug", {}) " debugging statements
" call s:h("Delimiter", {}) " character that needs attention
" call s:h("Ignore", {}) " left blank, hidden
" call s:h("ModeMsg", {}) " 'showmode' message (e.g., "-- INSERT --")
" call s:h("MoreMsg", {}) " more-prompt
" call s:h("QuickFixLine", { "fg": s:black, "bg": s:yellow }) " Current quickfix item in the quickfix window.
" call s:h("Search", { "fg": s:black, "bg": s:yellow }) " Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
" call s:h("Special", { "fg": s:blue }) " any special symbol
" call s:h("SpecialChar", {}) " special character in a constant
" call s:h("SpellBad", { "fg": s:red, "gui": "underline", "cterm": "underline" }) " Word that is not recognized by the spellchecker. This will be combined with the highlighting used otherwise.
" call s:h("String", { "fg": s:green, "gui": "italic", "cterm": "italic" }) " any comment
" call s:h("Tag", {}) " you can use CTRL-] on this
" call s:h("Terminal", { "fg": s:white, "bg": s:black }) " terminal window (see terminal-size-color)
" call s:h("Typedef", { "fg": s:yellow }) " A typedef
" call s:h("Underlined", { "gui": "underline", "cterm": "underline" }) " text that stands out, HTML links
" call s:h("Visual", { "fg": s:visual_black, "bg": s:visual_grey }) " Visual mode selection
" call s:h("WildMenu", { "fg": s:black, "bg": s:blue }) " current match in 'wildmenu' completion

exe 'hi! Comment guifg=' . s:comment_grey . ' gui=italic'

" a boolean constant: TRUE, false
exe 'hi! Boolean guifg=' .  s:dark_yellow  
" a character constant: 'c', '\n'
exe 'hi! Character guifg=' .  s:green  

" if, then, else, endif, switch, etc.
exe 'hi! Conditional guifg=' .  s:purple  

exe 'hi! Constant guifg=' .  s:cyan

" the character under the cursor
exe 'hi! Cursor guifg=' .  s:black .  ' guibg=' . s:blue

" the screen column that the cursor is in when 'cursorcolumn' is set
exe 'hi! CursorColumn guibg=' .  s:cursor_grey  

" preprocessor #define
exe 'hi! Define guifg=' .  s:purple  

" diff mode: Added line
exe 'hi! DiffAdd guibg=' .  s:gree . ' guifg=' . s:black

" diff mode: Changed line
exe 'hi! DiffChange guifg=' .  s:yellow . ' gui=underline

" diff mode: Deleted line
exe 'hi! DiffDelete guibg=' .  s:red .  ' guifg=' . s:black 

" diff mode: Changed text within a changed line
exe 'hi! DiffText guibg=' .  s:yellow . ' guifg=' . s:black 

" directory names (and other special names in listings)
exe 'hi! Directory guifg=' .  s:blue  

" any erroneous construct
exe 'hi! Error guifg=' .  s:red  

" error messages on the command line
exe 'hi! ErrorMsg guifg=' .  s:red  

" try, catch, throw
exe 'hi! Exception guifg=' .  s:purple  

" a floating point constant: 2.3e10
exe 'hi! Float guifg=' .  s:dark_yellow  

" function name (also: methods for classes)
exe 'hi! Function guifg=' .  s:blue  

" any variable name
exe 'hi! Identifier guifg=' .  s:red  

" 'incsearch' highlighting; also used for the text replaced with ":s///c"
exe 'hi! IncSearch guifg=' .  s:yellow . ' guibg=' . s:comment_grey 

" preprocessor #include
exe 'hi! Include guifg=' .  s:blue  
"
" any other keyword
exe 'hi! Keyword guifg=' .  s:red  

" case, default, etc.
exe 'hi! Label guifg=' .  s:purple  

" same as Define
exe 'hi! Macro guifg=' .  s:purple  

" The character under the cursor or just before it, if it is a paired bracket, and its match.
exe 'hi! MatchParen guifg=' .  s:blue . ' gui=underline

" '~' and '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line).
exe 'hi! NonText guifg=' .  s:special_grey  

" normal text
exe 'hi! Normal guifg=' .  s:white . ' guibg=' . s:black 

" a number constant: 234, 0xff
exe 'hi! Number guifg=' .  s:dark_yellow  

" sizeof", "+", "*", etc.
exe 'hi! Operator guifg=' .  s:purple  

" preprocessor #if, #else, #endif, etc.
exe 'hi! PreCondit guifg=' .  s:yellow  

" generic Preprocessor
exe 'hi! PreProc guifg=' .  s:yellow  

" hit-enter prompt and yes/no questions
exe 'hi! Question guifg=' .  s:purple  

" for, do, while, etc.
exe 'hi! Repeat guifg=' .  s:purple  

" special things inside a comment
exe 'hi! SpecialComment guifg=' .  s:comment_grey  

" Meta and special keys listed with ":map", also for text used to show unprintable characters in the text, 'listchars'. Generally: text that is displayed differently from what it really is.
exe 'hi! SpecialKey guifg=' .  s:special_grey  

" Word that should start with a capital. This will be combined with the highlighting used otherwise.
exe 'hi! SpellCap guifg=' .  s:dark_yellow  

" Word that is recognized by the spellchecker as one that is used in another region. This will be combined with the highlighting used otherwise.
exe 'hi! SpellLocal guifg=' .  s:dark_yellow  

" Word that is recognized by the spellchecker as one that is hardly ever used. spell This will be combined with the highlighting used otherwise.
exe 'hi! SpellRare guifg=' .  s:dark_yellow  

" any statement
exe 'hi! Statement guifg=' .  s:purple  

" static, register, volatile, etc.
exe 'hi! StorageClass guifg=' .  s:yellow  

" a string constant: "this is a string"
exe 'hi! String guifg=' .  s:green  

" struct, union, enum, etc.
exe 'hi! Structure guifg=' .  s:yellow  

" titles for output from ":set all", ":autocmd" etc.
exe 'hi! Title guifg=' .  s:green  

" anything that needs extra attention; mostly the keywords TODO FIXME and XXX
exe 'hi! Todo guifg=' .  s:purple  

" int, long, char, etc.
exe 'hi! Type guifg=' .  s:yellow  

" the column separating vertically split windows
exe 'hi! VertSplit guifg=' .  s:vertsplit  

" Visual mode selection when vim is "Not Owning the Selection". Only X11 Gui's gui-x11 and xterm-clipboard supports this.
exe 'hi! VisualNOS guibg=' .  s:visual_grey  

" warning messages
exe 'hi! WarningMsg guifg=' .  s:yellow  

" Lanugage

" VIM {{{
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
" "}}}
" ZSH {{{
hi zshKeyword guifg=#6338e3
hi zshCommands guifg=#ff008d
hi zshFunction guifg=#ff00f6
hi zshVariableDef guifg=#00ff8c
hi zshBrackets guifg=#ff8000
hi zshTypes guifg=#ff8000
" }}}
" Dosini{{{
hi DosiniHeader guifg=#FF00DE
hi DosiniLabel guifg=#56f482
hi DosiniString guifg=#ffff00
" }}}
" Tmux {{{
hi TmuxCommands guifg=#ff008d
hi tmuxOptions guifg=#ff00f6
hi tmuxFlags guifg=#00ff8c
hi tmuxKey guifg=#00ceff
hi tmuxString guifg=#72c089
hi tmuxVariable guifg=#00ff8c
hi tmuxFormatString guifg=#dba76f
" }}}
" JSON{{{
call s:h("jsonCommentError", { "fg": s:white })
call s:h("jsonKeyword", { "fg": s:red })
call s:h("jsonBoolean", { "fg": s:dark_yellow })
call s:h("jsonNumber", { "fg": s:dark_yellow })
call s:h("jsonQuote", { "fg": s:white })
call s:h("jsonMissingCommaError", { "fg": s:red, "gui": "reverse" })
call s:h("jsonNoQuotesError", { "fg": s:red, "gui": "reverse" })
call s:h("jsonNumError", { "fg": s:red, "gui": "reverse" })
call s:h("jsonString", { "fg": s:green })
call s:h("jsonStringSQError", { "fg": s:red, "gui": "reverse" })
call s:h("jsonSemicolonError", { "fg": s:red, "gui": "reverse" })
" }}}
" Markdown {{{
call s:h("markdownCode", { "fg": s:green })
call s:h("markdownCodeBlock", { "fg": s:green })
call s:h("markdownCodeDelimiter", { "fg": s:green })
call s:h("markdownRule", { "fg": s:comment_grey })
call s:h("markdownHeadingRule", { "fg": s:comment_grey })

hi markdownH1 guifg=#ef00d5
hi markdownH2 guifg=#c806b2
hi markdownH3 guifg=#a70a96
hi markdownH4 guifg=#8c0d7e
hi markdownH5 guifg=#760f6a
hi markdownH6 guifg=#63105a
hi markdownHeadingDelimiter guifg=#ef00d5
hi markdownListMarker guifg=#a000ff
hi markdownOrderedListMarker guifg=#00ffa7

" }}}
" CSS {{{
call s:h("cssAttrComma", { "fg": s:purple })
call s:h("cssAttributeSelector", { "fg": s:green })
call s:h("cssBraces", { "fg": s:white })
call s:h("cssClassName", { "fg": s:dark_yellow })
call s:h("cssClassNameDot", { "fg": s:dark_yellow })
call s:h("cssDefinition", { "fg": s:purple })
call s:h("cssFontAttr", { "fg": s:dark_yellow })
call s:h("cssFontDescriptor", { "fg": s:purple })
call s:h("cssFunctionName", { "fg": s:blue })
call s:h("cssIdentifier", { "fg": s:blue })
call s:h("cssImportant", { "fg": s:purple })
call s:h("cssInclude", { "fg": s:white })
call s:h("cssIncludeKeyword", { "fg": s:purple })
call s:h("cssMediaType", { "fg": s:dark_yellow })
call s:h("cssProp", { "fg": s:white })
call s:h("cssPseudoClassId", { "fg": s:dark_yellow })
call s:h("cssSelectorOp", { "fg": s:purple })
call s:h("cssSelectorOp2", { "fg": s:purple })
call s:h("cssTagName", { "fg": s:red })
" }}}
" HTML {{{
call s:h("htmlTitle", { "fg": s:white })
call s:h("htmlArg", { "fg": s:dark_yellow })
call s:h("htmlEndTag", { "fg": s:white })
call s:h("htmlH1", { "fg": s:white })
call s:h("htmlLink", { "fg": s:purple })
call s:h("htmlSpecialChar", { "fg": s:dark_yellow })
call s:h("htmlSpecialTagName", { "fg": s:red })
call s:h("htmlTag", { "fg": s:white })
call s:h("htmlTagName", { "fg": s:red })
" }}}
" JavaScript {{{
call s:h("javaScriptBraces", { "fg": s:white })
call s:h("javaScriptFunction", { "fg": s:purple })
call s:h("javaScriptIdentifier", { "fg": s:purple })
call s:h("javaScriptNull", { "fg": s:dark_yellow })
call s:h("javaScriptNumber", { "fg": s:dark_yellow })
call s:h("javaScriptRequire", { "fg": s:cyan })
call s:h("javaScriptReserved", { "fg": s:purple })
" https://github.com/pangloss/vim-javascript
call s:h("jsArrowFunction", { "fg": s:purple })
call s:h("jsClassKeyword", { "fg": s:purple })
call s:h("jsClassMethodType", { "fg": s:purple })
call s:h("jsDocParam", { "fg": s:blue })
call s:h("jsDocTags", { "fg": s:purple })
call s:h("jsExport", { "fg": s:purple })
call s:h("jsExportDefault", { "fg": s:purple })
call s:h("jsExtendsKeyword", { "fg": s:purple })
call s:h("jsFrom", { "fg": s:purple })
call s:h("jsFuncCall", { "fg": s:blue })
call s:h("jsFunction", { "fg": s:purple })
call s:h("jsGenerator", { "fg": s:yellow })
call s:h("jsGlobalObjects", { "fg": s:yellow })
call s:h("jsImport", { "fg": s:purple })
call s:h("jsModuleAs", { "fg": s:purple })
call s:h("jsModuleWords", { "fg": s:purple })
call s:h("jsModules", { "fg": s:purple })
call s:h("jsNull", { "fg": s:dark_yellow })
call s:h("jsOperator", { "fg": s:purple })
call s:h("jsStorageClass", { "fg": s:purple })
call s:h("jsSuper", { "fg": s:red })
call s:h("jsTemplateBraces", { "fg": s:dark_red })
call s:h("jsTemplateVar", { "fg": s:green })
call s:h("jsThis", { "fg": s:red })
call s:h("jsUndefined", { "fg": s:dark_yellow })
" https://github.com/othree/yajs.vim
call s:h("javascriptArrowFunc", { "fg": s:purple })
call s:h("javascriptClassExtends", { "fg": s:purple })
call s:h("javascriptClassKeyword", { "fg": s:purple })
call s:h("javascriptDocNotation", { "fg": s:purple })
call s:h("javascriptDocParamName", { "fg": s:blue })
call s:h("javascriptDocTags", { "fg": s:purple })
call s:h("javascriptEndColons", { "fg": s:white })
call s:h("javascriptExport", { "fg": s:purple })
call s:h("javascriptFuncArg", { "fg": s:white })
call s:h("javascriptFuncKeyword", { "fg": s:purple })
call s:h("javascriptIdentifier", { "fg": s:red })
call s:h("javascriptImport", { "fg": s:purple })
call s:h("javascriptMethodName", { "fg": s:white })
call s:h("javascriptObjectLabel", { "fg": s:white })
call s:h("javascriptOpSymbol", { "fg": s:cyan })
call s:h("javascriptOpSymbols", { "fg": s:cyan })
call s:h("javascriptPropertyName", { "fg": s:green })
call s:h("javascriptTemplateSB", { "fg": s:dark_red })
call s:h("javascriptVariable", { "fg": s:purple })

" }}}

" Plugin

" GitGutter {{{
exe 'hi! GitGutterDelete guibg=' . s:bg_color . ' guifg=#AA0000'
exe 'hi! GitGutterChangeDelete guibg=' . s:bg_color
exe 'hi! GitGutterAdd guibg=' . s:bg_color . ' guifg=#00ff52'
exe 'hi! GitGutterChange guibg=' . s:bg_color . ' guifg=#ff8200'
"}}}
" Nerdtree {{{
hi Directory guifg=#414a59
hi NERDTreeCWD guifg=#55b5be
hi NERDTreeDir guifg=#5cade5
hi NERDTreeDirSlash guifg=#55b5be
hi NERDTreeFlags guifg=#55b5be
hi NERDTreeGitStatusDirDirty guifg=#c678dd
hi NERDTreeFile guifg=white
hi NERDTreeBookmarksHeader guifg=#c678dd
hi NERDTreeBookmarkName guifg=#abb2bf
"}}}
" easymotion/vim-easymotion {{{
call s:h("EasyMotionTarget", { "fg": s:red, "gui": "bold", "cterm": "bold" })
call s:h("EasyMotionTarget2First", { "fg": s:yellow, "gui": "bold", "cterm": "bold" })
call s:h("EasyMotionTarget2Second", { "fg": s:dark_yellow, "gui": "bold", "cterm": "bold" })
call s:h("EasyMotionShade",  { "fg": s:comment_grey })
"}}}
" tpope/vim-fugitive {{{
call s:h("diffAdded", { "fg": s:green })
call s:h("diffRemoved", { "fg": s:red })
"}}}
" Git Highlighting {{{

call s:h("gitcommitComment", { "fg": s:comment_grey })
call s:h("gitcommitUnmerged", { "fg": s:green })
call s:h("gitcommitOnBranch", {})
call s:h("gitcommitBranch", { "fg": s:purple })
call s:h("gitcommitDiscardedType", { "fg": s:red })
call s:h("gitcommitSelectedType", { "fg": s:green })
call s:h("gitcommitHeader", {})
call s:h("gitcommitUntrackedFile", { "fg": s:cyan })
call s:h("gitcommitDiscardedFile", { "fg": s:red })
call s:h("gitcommitSelectedFile", { "fg": s:green })
call s:h("gitcommitUnmergedFile", { "fg": s:yellow })
call s:h("gitcommitFile", {})
call s:h("gitcommitSummary", { "fg": s:white })
call s:h("gitcommitOverflow", { "fg": s:red })

hi link gitcommitNoBranch gitcommitBranch
hi link gitcommitUntracked gitcommitComment
hi link gitcommitDiscarded gitcommitComment
hi link gitcommitSelected gitcommitComment
hi link gitcommitDiscardedArrow gitcommitDiscardedFile
hi link gitcommitSelectedArrow gitcommitSelectedFile
hi link gitcommitUnmergedArrow gitcommitUnmergedFile

" }}}
" Neovim terminal colors {{{

if has("nvim")
  let g:terminal_color_0 =  s:black.gui
  let g:terminal_color_1 =  s:red.gui
  let g:terminal_color_2 =  s:green.gui
  let g:terminal_color_3 =  s:yellow.gui
  let g:terminal_color_4 =  s:blue.gui
  let g:terminal_color_5 =  s:purple.gui
  let g:terminal_color_6 =  s:cyan.gui
  let g:terminal_color_7 =  s:white.gui
  let g:terminal_color_8 =  s:visual_grey.gui
  let g:terminal_color_9 =  s:dark_red.gui
  let g:terminal_color_10 = s:green.gui " No dark version
  let g:terminal_color_11 = s:dark_yellow.gui
  let g:terminal_color_12 = s:blue.gui " No dark version
  let g:terminal_color_13 = s:purple.gui " No dark version
  let g:terminal_color_14 = s:cyan.gui " No dark version
  let g:terminal_color_15 = s:comment_grey.gui
  let g:terminal_color_background = g:terminal_color_0
  let g:terminal_color_foreground = g:terminal_color_7
endif
" Must appear at the end of the file to work around this oddity:
" https://groups.google.com/forum/#!msg/vim_dev/afPqwAFNdrU/nqh6tOM87QUJ
" }}}
