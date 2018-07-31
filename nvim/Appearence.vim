" vim: fdm=marker
" APPEARENCE

" COLORSCHEME 
let g:seoul256_background = 234
" colorscheme seoul256
colorscheme onedark
augroup ColorSchemeGroup 
    autocmd!
    autocmd VimEnter,ColorScheme * call ColorPatches()
    " autocmd VimEnter,ColorScheme * call SyntaxColors()
augroup END 

function! ColorPatches() "{{{
    if g:colors_name =~ 'seoul256'
        call Seoulpatch()
    elseif g:colors_name =~ 'wombat25mod'
        call Wombat256patch()
    elseif g:colors_name =~ 'base16-monokai'
        call Monokaipatch()
    elseif g:colors_name =~ 'hydrangea'
        call Hydrangeapatch()
    elseif g:colors_name =~ 'onedark'
        call Onedarkpatch()
    endif
endfunc  "}}}

function! Onedarkpatch() "{{{
    call s:set_lightline_colorscheme('myonedark')
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
    let g:monokai_gui_italic = 1
    call s:set_lightline_colorscheme('molokai')
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

" TransparentBackground
let g:transparent_background = 0
function! TransparentBackground ()  " {{{
    if g:transparent_background 
        let g:transparent_background = 0
        execute 'colorscheme' g:colors_name
    else
        let g:transparent_background = 1
        hi Normal guibg=#000000
        hi Folded guibg=#000000
        hi LineNr guibg=#000000
        hi SignColumn guibg=#000000
        hi GitGutter guibg=#000000
        hi GitGutterAdd guibg=#000000
        hi GitGutterChange guibg=#000000
    endif
endfunc "}}}
nnoremap <C-t> :call TransparentBackground()<CR>

" Stolen from onedark-theme
" Sets all syntax colors. Plugins overwrites the colorscheme so I overwrite
" the plugins. 
" TODO: Need to automate this
function! SyntaxColors() "{{{
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

	" Monokai
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

	" Language-Specific Highlighting {{{
	" Vim
	call s:h("vimFunction", { "fg": s:green })

	"" CSS {{{

	"call s:h("cssAttrComma", { "fg": s:purple })
	"call s:h("cssAttributeSelector", { "fg": s:green })
	call s:h("cssAttrRegion", { "fg": s:pink })
	"call s:h("cssBraces", { "fg": s:white })
	"call s:h("cssClassName", { "fg": s:dark_yellow })
	"call s:h("cssClassNameDot", { "fg": s:dark_yellow })
	"call s:h("cssDefinition", { "fg": s:purple })
	"call s:h("cssFontAttr", { "fg": s:dark_yellow })
	"call s:h("cssFontDescriptor", { "fg": s:purple })
	"call s:h("cssFunctionName", { "fg": s:aqua })
	"call s:h("cssIdentifier", { "fg": s:aqua })
	"call s:h("cssImportant", { "fg": s:purple })
	"call s:h("cssInclude", { "fg": s:white })
	"call s:h("cssIncludeKeyword", { "fg": s:purple })
	"call s:h("cssMediaType", { "fg": s:dark_yellow })
	call s:h("cssUnitDecorators", { "fg": s:pink })
	"call s:h("cssProp", { "fg": s:white })
	"call s:h("cssPseudoClassId", { "fg": s:dark_yellow })
	"call s:h("cssSelectorOp", { "fg": s:purple })
	"call s:h("cssSelectorOp2", { "fg": s:purple })
	"call s:h("cssTagName", { "fg": s:red })

	""}}}
	"" HTML {{{
	"call s:h("htmlTitle", { "fg": s:white })
	"call s:h("htmlArg", { "fg": s:dark_yellow })
	"call s:h("htmlEndTag", { "fg": s:white })
	"call s:h("htmlH1", { "fg": s:white })
	"call s:h("htmlLink", { "fg": s:purple })
	"call s:h("htmlSpecialChar", { "fg": s:dark_yellow })
	"call s:h("htmlSpecialTagName", { "fg": s:red })
	"call s:h("htmlTag", { "fg": s:white })
	"call s:h("htmlTagName", { "fg": s:red })
	""}}}
	"" JavaScript {{{
	call s:h("javaScriptBraces", { "fg": s:white })
	call s:h("javaScriptFunction", { "fg": s:green })
	call s:h("javaScriptIdentifier", { "fg": s:white })
	call s:h("javaScriptNull", { "fg": s:dark_yellow })
	call s:h("javaScriptNumber", { "fg": s:purple })
	call s:h("javaScriptRequire", { "fg": s:aqua })
	call s:h("javaScriptReserved", { "fg": s:purple })
	call s:h("javascriptArrowFunc", { "fg": s:purple })
	call s:h("javascriptClassExtends", { "fg": s:purple })
	call s:h("javascriptClassKeyword", { "fg": s:purple })
	call s:h("javascriptDocNotation", { "fg": s:purple })
	call s:h("javascriptDocParamName", { "fg": s:aqua })
	call s:h("javascriptDocTags", { "fg": s:purple })
	call s:h("javascriptEndColons", { "fg": s:white })
	call s:h("javascriptExport", { "fg": s:purple })
	call s:h("javascriptFuncArg", { "fg": s:white })
	call s:h("javascriptFuncKeyword", { "fg": s:purple })
	call s:h("javascriptIdentifier", { "fg": s:red })
	call s:h("javascriptImport", { "fg": s:purple })
	call s:h("javascriptObjectLabel", { "fg": s:white })
		call s:h("javascriptOpSymbol", { "fg": s:aqua })
	call s:h("javascriptOpSymbols", { "fg": s:aqua })
	call s:h("javascriptPropertyName", { "fg": s:green })
	call s:h("javascriptTemplateSB", { "fg": s:darkred })
	call s:h("javascriptVariable", { "fg": s:purple })

	"call s:h("jsFunction", { "fg": s:purple })
	"call s:h("jsModuleWords", { "fg": s:purple })
	"call s:h("jsModules", { "fg": s:purple })
	"call s:h("jsNull", { "fg": s:dark_yellow })
	"call s:h("jsTemplateBraces", { "fg": s:darkred })
	"call s:h("jsTemplateVar", { "fg": s:green })
	"call s:h("jsThis", { "fg": s:red })
	"call s:h("jsUndefined", { "fg": s:dark_yellow })
	call s:h("jsArrowFunction", { "fg": s:purple })
	call s:h("jsClassKeywords", { "fg": s:purple })
	call s:h("jsDestructuringArray", { "fg": s:orange })
	call s:h("jsDestructuringPropertyValue", { "fg": s:orange })
	call s:h("jsDocParam", { "fg": s:aqua })
	call s:h("jsDocTags", { "fg": s:purple })
	call s:h("jsFuncArgs", { "fg": s:orange })
	call s:h("jsFuncBlock", { "fg": s:white })
	call s:h("jsFuncCall", { "fg": s:green })
	call s:h("jsGlobalObjects", { "fg": s:yellow })
	call s:h("jsObject", { "fg": s:orange })
	call s:h("jsObjectBraces", { "fg": s:orange })
	call s:h("jsObjectKey", { "fg": s:orange })
	call s:h("jsOperator", { "fg": s:pink })
	call s:h("jsParen", { "fg": s:orange })
	call s:h("jsParenIfElse", { "fg": s:orange })
	call s:h("jsParens", { "fg": s:white })
	call s:h("jsRepeat", { "fg": s:pink })
	call s:h("jsRepeatBlock", { "fg": s:orange })
	call s:h("jsStorageClass", { "fg": s:purple })

	""}}}
	"" JSON {{{
	call s:h("jsonCommentError", { "fg": s:white })
	call s:h("jsonKeyword", { "fg": s:red })
	call s:h("jsonBoolean", { "fg": s:dark_yellow })
	call s:h("jsonNumber", { "fg": s:purple })
	call s:h("jsonQuote", { "fg": s:white })
	call s:h("jsonMissingCommaError", { "fg": s:red, "gui": "reverse" })
	call s:h("jsonNoQuotesError", { "fg": s:red, "gui": "reverse" })
	call s:h("jsonNumError", { "fg": s:red, "gui": "reverse" })
	call s:h("jsonString", { "fg": s:green })
	call s:h("jsonStringSQError", { "fg": s:red, "gui": "reverse" })
	call s:h("jsonSemicolonError", { "fg": s:red, "gui": "reverse" })
"" }}}
"" Markdown {{{
"call s:h("markdownCode", { "fg": s:green })
"call s:h("markdownCodeBlock", { "fg": s:green })
"call s:h("markdownCodeDelimiter", { "fg": s:green })
"call s:h("markdownHeadingDelimiter", { "fg": s:red })
"call s:h("markdownRule", { "fg": s:warmgrey })
"call s:h("markdownHeadingRule", { "fg": s:warmgrey })
"call s:h("markdownH1", { "fg": s:red })
"call s:h("markdownH2", { "fg": s:red })
"call s:h("markdownH3", { "fg": s:red })
"call s:h("markdownH4", { "fg": s:red })
"call s:h("markdownH5", { "fg": s:red })
"call s:h("markdownH6", { "fg": s:red })
"call s:h("markdownIdDelimiter", { "fg": s:purple })
"call s:h("markdownId", { "fg": s:purple })
"call s:h("markdownBlockquote", { "fg": s:warmgrey })
"call s:h("markdownItalic", { "fg": s:purple, "gui": "italic", "cterm": "italic" })
"call s:h("markdownBold", { "fg": s:dark_yellow, "gui": "bold", "cterm": "bold" })
"call s:h("markdownListMarker", { "fg": s:red })
"call s:h("markdownOrderedListMarker", { "fg": s:red })
"call s:h("markdownIdDeclaration", { "fg": s:aqua })
"call s:h("markdownLinkText", { "fg": s:aqua })
"call s:h("markdownLinkDelimiter", { "fg": s:white })
"call s:h("markdownUrl", { "fg": s:purple })
"" }}}
"" Ruby{{{
"call s:h("rubyBlockParameter", { "fg": s:red})
"call s:h("rubyBlockParameterList", { "fg": s:red })
"call s:h("rubyClass", { "fg": s:purple})
"call s:h("rubyConstant", { "fg": s:yellow})
"call s:h("rubyControl", { "fg": s:purple })
"call s:h("rubyEscape", { "fg": s:red})
"call s:h("rubyFunction", { "fg": s:aqua})
"call s:h("rubyGlobalVariable", { "fg": s:red})
"call s:h("rubyInclude", { "fg": s:aqua})
"call s:h("rubyIncluderubyGlobalVariable", { "fg": s:red})
"call s:h("rubyInstanceVariable", { "fg": s:red})
"call s:h("rubyInterpolation", { "fg": s:aqua })
"call s:h("rubyInterpolationDelimiter", { "fg": s:red })
"call s:h("rubyInterpolationDelimiter", { "fg": s:red})
"call s:h("rubyRegexp", { "fg": s:aqua})
"call s:h("rubyRegexpDelimiter", { "fg": s:aqua})
"call s:h("rubyStringDelimiter", { "fg": s:green})
"call s:h("rubySymbol", { "fg": s:aqua})
"" }}}
"" Sass {{{
"call s:h("sassAmpersand", { "fg": s:red })
"call s:h("sassClass", { "fg": s:dark_yellow })
"call s:h("sassControl", { "fg": s:purple })
"call s:h("sassExtend", { "fg": s:purple })
"call s:h("sassFor", { "fg": s:white })
"call s:h("sassFunction", { "fg": s:aqua })
"call s:h("sassId", { "fg": s:aqua })
"call s:h("sassInclude", { "fg": s:purple })
"call s:h("sassMedia", { "fg": s:purple })
"call s:h("sassMediaOperators", { "fg": s:white })
"call s:h("sassMixin", { "fg": s:purple })
"call s:h("sassMixinName", { "fg": s:aqua })
"call s:h("sassMixing", { "fg": s:purple })
"" }}}
"" TypeScript {{{
"call s:h("typescriptReserved", { "fg": s:purple })
"call s:h("typescriptEndColons", { "fg": s:white })
"call s:h("typescriptBraces", { "fg": s:white })
"" }}}
"" XML{{{
"call s:h("xmlAttrib", { "fg": s:dark_yellow })
"call s:h("xmlEndTag", { "fg": s:red })
"call s:h("xmlTag", { "fg": s:red })
"call s:h("xmlTagName", { "fg": s:red })
"" }}}
"}}}
endfunction "}}}

" change text font color to white
inoremap <leader>å <esc>:hi normal ctermfg=255 guifg=white<cr>
nnoremap <leader>å :hi normal ctermfg=255 guifg=white<cr>

" Toggle conceallevel
map <LocalLeader>c :exec &conceallevel ? "set conceallevel=0" : "set conceallevel=1"<CR>

