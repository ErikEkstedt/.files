" File:       monokai.vim
" Maintainer: Crusoe Xia (crusoexia)
" URL:        https://github.com/crusoexia/vim-monokai
" License:    MIT
"
" The colour palette is from http://www.colourlovers.com/
" The original code is from https://github.com/w0ng/vim-hybrid

" Initialisation
" --------------

if !has("gui_running") && &t_Co < 256
  finish
endif

if ! exists("g:monokai_gui_italic")
    let g:monokai_gui_italic = 1
endif

if ! exists("g:monokai_term_italic")
    let g:monokai_term_italic = 0
endif

let g:monokai_termcolors = 256 " does not support 16 color term right now.

set background=dark
hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "monokai"

function! s:h(group, style) "{{{
	let s:ctermformat = "NONE"
	let s:guiformat = "NONE"
	if has_key(a:style, "format")
		let s:ctermformat = a:style.format
		let s:guiformat = a:style.format
	endif
	if g:monokai_term_italic == 0
		let s:ctermformat = substitute(s:ctermformat, ",italic", "", "")
		let s:ctermformat = substitute(s:ctermformat, "italic,", "", "")
		let s:ctermformat = substitute(s:ctermformat, "italic", "", "")
	endif
	if g:monokai_gui_italic == 0
		let s:guiformat = substitute(s:guiformat, ",italic", "", "")
		let s:guiformat = substitute(s:guiformat, "italic,", "", "")
		let s:guiformat = substitute(s:guiformat, "italic", "", "")
	endif
	if g:monokai_termcolors == 16
		let l:ctermfg = (has_key(a:style, "fg") ? a:style.fg.cterm16 : "NONE")
		let l:ctermbg = (has_key(a:style, "bg") ? a:style.bg.cterm16 : "NONE")
	else
		let l:ctermfg = (has_key(a:style, "fg") ? a:style.fg.cterm : "NONE")
		let l:ctermbg = (has_key(a:style, "bg") ? a:style.bg.cterm : "NONE")
	end
	execute "highlight" a:group
				\ "guifg="   (has_key(a:style, "fg")      ? a:style.fg.gui   : "NONE")
				\ "guibg="   (has_key(a:style, "bg")      ? a:style.bg.gui   : "NONE")
				\ "guisp="   (has_key(a:style, "sp")      ? a:style.sp.gui   : "NONE")
				\ "gui="     (!empty(s:guiformat) ? s:guiformat   : "NONE")
				\ "ctermfg=" . l:ctermfg
				\ "ctermbg=" . l:ctermbg
				\ "cterm="   (!empty(s:ctermformat) ? s:ctermformat   : "NONE")
endfunction "}}}

let s:white       = { "gui": "#E8E8E3", "cterm": "252" }
let s:black       = { "gui": "#34352d", "cterm": "234" }
let s:lightblack  = { "gui": "#44453d", "cterm": "235" }
let s:lightblack2 = { "gui": "#383a3e", "cterm": "236" }
let s:darkblack   = { "gui": "#211F1C", "cterm": "233" }
let s:grey        = { "gui": "#8F908A", "cterm": "243" }
let s:lightgrey   = { "gui": "#575b61", "cterm": "237" }
let s:darkgrey    = { "gui": "#64645e", "cterm": "239" }
let s:warmgrey    = { "gui": "#75715E", "cterm": "59" }

let s:pink        = { "gui": "#F92772", "cterm": "197" }
let s:green       = { "gui": "#A6E22D", "cterm": "148" }
let s:aqua        = { "gui": "#66d9ef", "cterm": "81" }
let s:yellow      = { "gui": "#E6DB74", "cterm": "186" }
let s:dark_yellow = { "gui": "#968B24", "cterm": "186" }
let s:orange      = { "gui": "#FD9720", "cterm": "208" }
let s:purple      = { "gui": "#ae81ff", "cterm": "141" }
let s:red         = { "gui": "#e73c50", "cterm": "196" }
let s:darkred     = { "gui": "#5f0000", "cterm": "52" }

let s:addfg       = { "gui": "#d7ffaf", "cterm": "193" }
let s:addbg       = { "gui": "#5f875f", "cterm": "65" }
let s:delbg       = { "gui": "#f75f5f", "cterm": "167" }
let s:changefg    = { "gui": "#d7d7ff", "cterm": "189" }
let s:changebg    = { "gui": "#5f5f87", "cterm": "60" }

" +---------------------------------------------------------+
" | Syntax Groups (descriptions and ordering from `:h w18`) |
" +---------------------------------------------------------+{{{

call s:h("Boolean",        { "fg": s:purple })
call s:h("Character",      { "fg": s:yellow })
call s:h("ColorColumn",    { "bg": s:lightblack })
call s:h("Comment",        { "fg": s:warmgrey, "format": "italic" })
" " call s:h("Conceal",        { })
call s:h("Conditional",    { "fg": s:purple })
call s:h("Constant",       { "fg": s:aqua }) " any constant
call s:h("Cursor",         { "fg": s:black, "bg": s:white })
call s:h("CursorColumn",   { "bg": s:lightblack })
" call s:h("CursorIM",       { }) " like Cursor, but used when in IME mode
call s:h("CursorLine",     { "bg": s:lightblack })
call s:h("CursorLineNr",   { "fg": s:orange,     "bg": s:lightblack })
" call s:h("Debug",          { }) " debugging statements
call s:h("Define",         { "fg": s:pink })
call s:h("Delimiter",      { "fg": s:pink })
call s:h("DiffAdd",        { "fg": s:addfg,      "bg": s:addbg })
call s:h("DiffChange",     { "fg": s:changefg,   "bg": s:changebg })
call s:h("DiffDelete",     { "fg": s:black,      "bg": s:delbg })
call s:h("DiffText",       { "fg": s:black,      "bg": s:aqua })
call s:h("Directory",      { "fg": s:aqua })
call s:h("Error",          { "fg": s:red, "bg": s:darkred })
call s:h("ErrorMsg",       { "fg": s:black,      "bg": s:red, "format": "standout" })
call s:h("Exception",      { "fg": s:purple }) " try, catch, throw
call s:h("Float",          { "fg": s:purple })
call s:h("FoldColumn",     { "bg": s:darkblack })
call s:h("Folded",         { "fg": s:warmgrey,   "bg": s:black })
call s:h("Function",       { "fg": s:green })
call s:h("Identifier",     { "fg": s:white })
" call s:h("Ignore",         { })
call s:h("IncSearch",      { "fg": s:black, "bg": s:yellow })
call s:h("Include",        { "fg": s:pink })
call s:h("Keyword",        { "fg": s:aqua })
call s:h("Label",          { "fg": s:pink })
call s:h("LineNr",         { "fg": s:grey,       "bg": s:black })
call s:h("Macro",          { "fg": s:green })
call s:h("MatchParen",     { "fg": s:black,      "bg": s:purple })
call s:h("ModeMsg",        { "fg": s:yellow })
call s:h("MoreMsg",        { "fg": s:yellow })
call s:h("NonText",        { "fg": s:lightgrey }) " '~' and '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line).
call s:h("Normal",         { "fg": s:white,      "bg": s:black })
call s:h("Number",         { "fg": s:purple })
call s:h("Operator",       { "fg": s:pink })
call s:h("Pmenu",          { "fg": s:lightblack, "bg": s:white })
call s:h("PmenuSel",       { "fg": s:aqua,       "bg": s:black,        "format": "reverse,bold" })
call s:h("PmenuThumb",     { "fg": s:lightblack, "bg": s:grey })
call s:h("PreCondit",      { "fg": s:green })
call s:h("PreProc",        { "fg": s:green })
call s:h("Question",       { "fg": s:yellow })
call s:h("Repeat",         { "fg": s:yellow }) " for, do, while, etc.
call s:h("Search",         { "fg": s:black,      "bg": s:yellow })
call s:h("SignColumn",     { "bg": s:black })
call s:h("Special",        { "fg": s:purple })
call s:h("SpecialChar",    { "fg": s:pink })
call s:h("SpecialComment", { "fg": s:aqua })
call s:h("SpecialKey",     { "fg": s:pink }) " Meta and special keys listed with ":map", also for text used to show unprintable characters in the text, 'listchars'. Generally: text that is displayed differently from what it really is.
call s:h("SpellBad",       { "fg": s:red, "gui": "underline", "cterm": "underline" }) " Word that is not recognized by the spellchecker. This will be combined with the highlighting used otherwise.
call s:h("SpellCap",       { "fg": s:dark_yellow }) " Word that should start with a capital. This will be combined with the highlighting used otherwise.
call s:h("SpellLocal",     { "fg": s:dark_yellow }) " Word that is recognized by the spellchecker as one that is used in another region. This will be combined with the highlighting used otherwise.
call s:h("SpellRare",      { "fg": s:dark_yellow }) " Word that is recognized by the spellchecker as one that is hardly ever used. spell This will be combined with the highlighting used otherwise.
call s:h("Statement",      { "fg": s:pink })
call s:h("StatusLine",     { "fg": s:warmgrey,   "bg": s:black,        "format": "reverse" })
call s:h("StatusLineNC",   { "fg": s:darkgrey,   "bg": s:warmgrey,     "format": "reverse" })
call s:h("StorageClass",   { "fg": s:aqua })
call s:h("String",         { "fg": s:yellow })
call s:h("Structure",      { "fg": s:aqua })
call s:h("TabLine",        { "fg": s:white,      "bg": s:darkblack,    "format": "reverse" })
call s:h("TabLineFill",    { }) " tab pages line, where there are no labels
call s:h("TabLineSel",     { "fg": s:white }) " tab pages line, active tab page label
call s:h("Tag",            { "fg": s:pink })
call s:h("Tag",            { }) " you can use CTRL-] on this
call s:h("Title",          { "fg": s:yellow })
call s:h("Todo",           { "fg": s:orange,   "format": "bold,italic" })
call s:h("Type",           { "fg": s:aqua }) " int, long, char, etc.
call s:h("Typedef",        { "fg": s:aqua })
call s:h("Underlined",     { "fg": s:green })
call s:h("VertSplit",      { "fg": s:darkgrey,   "bg": s:black })
call s:h("Visual",         { "bg": s:lightgrey })
call s:h("VisualNOS",      { "bg": s:darkgrey }) " Visual mode selection when vim is "Not Owning the Selection". Only X11 Gui's gui-x11 and xterm-clipboard supports this.
call s:h("WarningMsg",     { "fg": s:red })
call s:h("WildMenu",       { }) " current match in 'wildmenu' completion
"}}}

" +---------------------+
" | Plugin Highlighting |
" +---------------------+ {{{

call s:h("gitcommitComment", { "fg": s:grey })
call s:h("gitcommitUnmerged", { "fg": s:green })
call s:h("gitcommitBranch", { "fg": s:purple })
call s:h("gitcommitDiscardedType", { "fg": s:red })
call s:h("gitcommitSelectedType", { "fg": s:green })
call s:h("gitcommitUntrackedFile", { "fg": s:aqua })
call s:h("gitcommitDiscardedFile", { "fg": s:red })
call s:h("gitcommitSelectedFile", { "fg": s:green })
call s:h("gitcommitUnmergedFile", { "fg": s:yellow })
hi link gitcommitNoBranch gitcommitBranch
hi link gitcommitUntracked gitcommitComment
hi link gitcommitDiscarded gitcommitComment
hi link gitcommitSelected gitcommitComment
hi link gitcommitDiscardedArrow gitcommitDiscardedFile
hi link gitcommitSelectedArrow gitcommitSelectedFile
hi link gitcommitUnmergedArrow gitcommitUnmergedFile

" GitGutter
call s:h("GitGutterAdd", { "fg": s:green })
call s:h("GitGutterChange", { "fg": s:yellow })
call s:h("GitGutterDelete", { "fg": s:red })
call s:h("GitGutterChangeDelete", { "fg": s:red })

" NerdTree
" --------
call s:h("NERDTreeOpenable",        { "fg": s:green })
call s:h("NERDTreeClosable",        { "fg": s:green })
call s:h("NERDTreeHelp",            { "fg": s:yellow })
call s:h("NERDTreeBookmarksHeader", { "fg": s:pink })
call s:h("NERDTreeBookmarksLeader", { "fg": s:green })
call s:h("NERDTreeBookmarkName",    { "fg": s:green })
call s:h("NERDTreeCWD",             { "fg": s:pink })
call s:h("NERDTreeUp",              { "fg": s:white })
call s:h("NERDTreeDirSlash",        { "fg": s:grey })
call s:h("NERDTreeDir",             { "fg": s:white })

" Syntastic
" ---------

hi! link SyntasticErrorSign Error
call s:h("SyntasticWarningSign",    { "fg": s:lightblack, "bg": s:orange })
" }}}

"+--------------------------------+
"| Language-Specific Highlighting |
""+--------------------------------+ {{{
""" CSS {{{
""call s:h("cssAttrComma", { "fg": s:purple })
""call s:h("cssAttributeSelector", { "fg": s:green })
""call s:h("cssBraces", { "fg": s:white })
""call s:h("cssClassName", { "fg": s:dark_yellow })
""call s:h("cssClassNameDot", { "fg": s:dark_yellow })
""call s:h("cssDefinition", { "fg": s:purple })
""call s:h("cssFontAttr", { "fg": s:dark_yellow })
""call s:h("cssFontDescriptor", { "fg": s:purple })
""call s:h("cssFunctionName", { "fg": s:blue })
""call s:h("cssIdentifier", { "fg": s:blue })
""call s:h("cssImportant", { "fg": s:purple })
""call s:h("cssInclude", { "fg": s:white })
""call s:h("cssIncludeKeyword", { "fg": s:purple })
""call s:h("cssMediaType", { "fg": s:dark_yellow })
""call s:h("cssProp", { "fg": s:white })
""call s:h("cssPseudoClassId", { "fg": s:dark_yellow })
""call s:h("cssSelectorOp", { "fg": s:purple })
""call s:h("cssSelectorOp2", { "fg": s:purple })
""call s:h("cssTagName", { "fg": s:red })
"""}}}
""" HTML {{{
""call s:h("htmlTitle", { "fg": s:white })
""call s:h("htmlArg", { "fg": s:dark_yellow })
""call s:h("htmlEndTag", { "fg": s:white })
""call s:h("htmlH1", { "fg": s:white })
""call s:h("htmlLink", { "fg": s:purple })
""call s:h("htmlSpecialChar", { "fg": s:dark_yellow })
""call s:h("htmlSpecialTagName", { "fg": s:red })
""call s:h("htmlTag", { "fg": s:white })
""call s:h("htmlTagName", { "fg": s:red })
"""}}}
""" JavaScript {{{
"call s:h("javaScriptBraces", { "fg": s:white })
"call s:h("javaScriptFunction", { "fg": s:green })
"call s:h("javaScriptIdentifier", { "fg": s:white })
"call s:h("javaScriptNull", { "fg": s:dark_yellow })
"call s:h("javaScriptNumber", { "fg": s:purple })
"call s:h("javaScriptRequire", { "fg": s:aqua })
"call s:h("javaScriptReserved", { "fg": s:purple })
"call s:h("javascriptArrowFunc", { "fg": s:purple })
"call s:h("javascriptClassExtends", { "fg": s:purple })
"call s:h("javascriptClassKeyword", { "fg": s:purple })
"call s:h("javascriptDocNotation", { "fg": s:purple })
"call s:h("javascriptDocParamName", { "fg": s:blue })
"call s:h("javascriptDocTags", { "fg": s:purple })
"call s:h("javascriptEndColons", { "fg": s:white })
"call s:h("javascriptExport", { "fg": s:purple })
"call s:h("javascriptFuncArg", { "fg": s:white })
"call s:h("javascriptFuncKeyword", { "fg": s:purple })
"call s:h("javascriptIdentifier", { "fg": s:red })
"call s:h("javascriptImport", { "fg": s:purple })
"call s:h("javascriptObjectLabel", { "fg": s:white })
"	call s:h("javascriptOpSymbol", { "fg": s:aqua })
"call s:h("javascriptOpSymbols", { "fg": s:aqua })
"call s:h("javascriptPropertyName", { "fg": s:green })
"call s:h("javascriptTemplateSB", { "fg": s:darkred })
"call s:h("javascriptVariable", { "fg": s:purple })
""
"call s:h("jsArrowFunction", { "fg": s:purple })
"call s:h("jsClassKeywords", { "fg": s:purple })
"call s:h("jsDocParam", { "fg": s:blue })
"call s:h("jsDocTags", { "fg": s:purple })
"call s:h("jsFuncBlock", { "fg": s:green })
"call s:h("jsFuncCall", { "fg": s:aqua })
"call s:h("jsFuncArgs", { "fg": s:orange })
"call s:h("jsObject", { "fg": s:orange })
"call s:h("jsObjectBraces", { "fg": s:orange })
"call s:h("jsParen", { "fg": s:orange })
"call s:h("jsParens", { "fg": s:orange })
"call s:h("jsRepeatBlock", { "fg": s:orange })
"call s:h("jsParenIfElse", { "fg": s:orange })
""call s:h("jsFunction", { "fg": s:purple })
"call s:h("jsGlobalObjects", { "fg": s:yellow })
"call s:h("jsDestructuringArray", { "fg": s:orange })
"call s:h("jsDestructuringPropertyValue", { "fg": s:orange })
""call s:h("jsModuleWords", { "fg": s:purple })
""call s:h("jsModules", { "fg": s:purple })
""call s:h("jsNull", { "fg": s:dark_yellow })
""call s:h("jsOperator", { "fg": s:purple })
"call s:h("jsStorageClass", { "fg": s:purple })
""call s:h("jsTemplateBraces", { "fg": s:darkred })
""call s:h("jsTemplateVar", { "fg": s:green })
""call s:h("jsThis", { "fg": s:red })
""call s:h("jsUndefined", { "fg": s:dark_yellow })
"""}}}
""" JSON {{{
"call s:h("jsonCommentError", { "fg": s:white })
"call s:h("jsonKeyword", { "fg": s:red })
"call s:h("jsonBoolean", { "fg": s:dark_yellow })
"call s:h("jsonNumber", { "fg": s:purple })
"call s:h("jsonQuote", { "fg": s:white })
"call s:h("jsonMissingCommaError", { "fg": s:red, "gui": "reverse" })
"call s:h("jsonNoQuotesError", { "fg": s:red, "gui": "reverse" })
"call s:h("jsonNumError", { "fg": s:red, "gui": "reverse" })
"call s:h("jsonString", { "fg": s:green })
"call s:h("jsonStringSQError", { "fg": s:red, "gui": "reverse" })
"call s:h("jsonSemicolonError", { "fg": s:red, "gui": "reverse" })
""" }}}
""" Markdown {{{
""call s:h("markdownCode", { "fg": s:green })
""call s:h("markdownCodeBlock", { "fg": s:green })
""call s:h("markdownCodeDelimiter", { "fg": s:green })
""call s:h("markdownHeadingDelimiter", { "fg": s:red })
""call s:h("markdownRule", { "fg": s:warmgrey })
""call s:h("markdownHeadingRule", { "fg": s:warmgrey })
""call s:h("markdownH1", { "fg": s:red })
""call s:h("markdownH2", { "fg": s:red })
""call s:h("markdownH3", { "fg": s:red })
""call s:h("markdownH4", { "fg": s:red })
""call s:h("markdownH5", { "fg": s:red })
""call s:h("markdownH6", { "fg": s:red })
""call s:h("markdownIdDelimiter", { "fg": s:purple })
""call s:h("markdownId", { "fg": s:purple })
""call s:h("markdownBlockquote", { "fg": s:warmgrey })
""call s:h("markdownItalic", { "fg": s:purple, "gui": "italic", "cterm": "italic" })
""call s:h("markdownBold", { "fg": s:dark_yellow, "gui": "bold", "cterm": "bold" })
""call s:h("markdownListMarker", { "fg": s:red })
""call s:h("markdownOrderedListMarker", { "fg": s:red })
""call s:h("markdownIdDeclaration", { "fg": s:blue })
""call s:h("markdownLinkText", { "fg": s:blue })
""call s:h("markdownLinkDelimiter", { "fg": s:white })
""call s:h("markdownUrl", { "fg": s:purple })
""" }}}
""" Ruby{{{
""call s:h("rubyBlockParameter", { "fg": s:red})
""call s:h("rubyBlockParameterList", { "fg": s:red })
""call s:h("rubyClass", { "fg": s:purple})
""call s:h("rubyConstant", { "fg": s:yellow})
""call s:h("rubyControl", { "fg": s:purple })
""call s:h("rubyEscape", { "fg": s:red})
""call s:h("rubyFunction", { "fg": s:blue})
""call s:h("rubyGlobalVariable", { "fg": s:red})
""call s:h("rubyInclude", { "fg": s:blue})
""call s:h("rubyIncluderubyGlobalVariable", { "fg": s:red})
""call s:h("rubyInstanceVariable", { "fg": s:red})
""call s:h("rubyInterpolation", { "fg": s:aqua })
""call s:h("rubyInterpolationDelimiter", { "fg": s:red })
""call s:h("rubyInterpolationDelimiter", { "fg": s:red})
""call s:h("rubyRegexp", { "fg": s:aqua})
""call s:h("rubyRegexpDelimiter", { "fg": s:aqua})
""call s:h("rubyStringDelimiter", { "fg": s:green})
""call s:h("rubySymbol", { "fg": s:aqua})
""" }}}
""" Sass {{{
""call s:h("sassAmpersand", { "fg": s:red })
""call s:h("sassClass", { "fg": s:dark_yellow })
""call s:h("sassControl", { "fg": s:purple })
""call s:h("sassExtend", { "fg": s:purple })
""call s:h("sassFor", { "fg": s:white })
""call s:h("sassFunction", { "fg": s:aqua })
""call s:h("sassId", { "fg": s:blue })
""call s:h("sassInclude", { "fg": s:purple })
""call s:h("sassMedia", { "fg": s:purple })
""call s:h("sassMediaOperators", { "fg": s:white })
""call s:h("sassMixin", { "fg": s:purple })
""call s:h("sassMixinName", { "fg": s:blue })
""call s:h("sassMixing", { "fg": s:purple })
""" }}}
""" TypeScript {{{
""call s:h("typescriptReserved", { "fg": s:purple })
""call s:h("typescriptEndColons", { "fg": s:white })
""call s:h("typescriptBraces", { "fg": s:white })
""" }}}
""" XML{{{
""call s:h("xmlAttrib", { "fg": s:dark_yellow })
""call s:h("xmlEndTag", { "fg": s:red })
""call s:h("xmlTag", { "fg": s:red })
""call s:h("xmlTagName", { "fg": s:red })
""" }}}
""}}}

" +------------------------+
" | Neovim terminal colors |
" +------------------------+

if has("nvim") "{{{
	let g:terminal_color_0 =  s:black.gui
	let g:terminal_color_1 =  s:red.gui
	let g:terminal_color_2 =  s:green.gui
	let g:terminal_color_3 =  s:yellow.gui
	let g:terminal_color_4 =  s:blue.gui
	let g:terminal_color_5 =  s:purple.gui
	let g:terminal_color_6 =  s:aqua.gui
	let g:terminal_color_7 =  s:white.gui
	let g:terminal_color_8 =  s:grey.gui
	let g:terminal_color_9 =  s:darkred.gui
	let g:terminal_color_10 = s:green.gui " No dark version
	let g:terminal_color_11 = s:dark_yellow.gui
	let g:terminal_color_12 = s:blue.gui " No dark version
	let g:terminal_color_13 = s:purple.gui " No dark version
	let g:terminal_color_14 = s:aqua.gui " No dark version
	let g:terminal_color_15 = s:warmgrey.gui
	let g:terminal_color_background = g:terminal_color_0
	let g:terminal_color_foreground = g:terminal_color_7
endif " }}}
