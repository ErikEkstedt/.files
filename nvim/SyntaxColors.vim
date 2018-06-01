" Stolen from onedark-theme
" Sets all syntax colors. Plugins overwrites the colorscheme so I overwrite
" the plugins. THis could become a plugin. Mostly for training plugin in vim.
" It is really hacky as of now
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
if g:colors_name =~ 'monokai' "{{{
    echo 'Monokai'
    " Colors {{{
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
    " }}}
    " NERDTree {{{
    call s:h("NERDTreeOpenable", { "fg": s:addbg })
    call s:h("NERDTreeClosable", { "fg": s:addbg })
    " }}}
    " Language-Specific Highlighting {{{
    " PYTHON {{{
    call s:h("pythonClassParameter", { "fg": s:changebg })
    " call s:h("pythonAttribute", { "fg": s:orange })

    call s:h("pythonVars", { "fg": s:orange })
    call s:h("pythonParameters", { "fg": s:white })
    call s:h("pythonParam", { "fg": s:orange })
    call s:h("pythonSelf", { "fg": s:purple })
    " }}}
    "" CSS {{{
    call s:h("cssAttrRegion", { "fg": s:pink })
    call s:h("cssUnitDecorators", { "fg": s:pink })

    ""}}}
    "" HTML {{{
    call s:h("htmlTitle", { "fg": s:pink })
    call s:h("htmlEndTag", { "fg": s:white })
    ""}}}
    "" HTML.handlerbars mustache {{{
    call s:h("mustacheInside", { "fg": s:pink })
    call s:h("mustacheUnescape", { "fg": s:purple })
    ""}}}
    "" JavaScript {{{
    call s:h("javaScriptBraces", { "fg": s:white })
    call s:h("javaScriptFunction", { "fg": s:green })
    call s:h("javaScriptIdentifier", { "fg": s:aqua })
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
    call s:h("jsThis", { "fg": s:pink })
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
    call s:h("jsonCommentError", { "fg": s:warmgrey })
    call s:h("jsonKeyword", { "fg": s:yellow })
    call s:h("jsonBoolean", { "fg": s:pink })
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
    call s:h("markdownCode", { "fg": s:green })
    call s:h("markdownCodeBlock", { "fg": s:yellow })
    call s:h("markdownCodeDelimiter", { "fg": s:green })
    call s:h("markdownHeadingDelimiter", { "fg": s:pink })
    call s:h("markdownRule", { "fg": s:warmgrey })
    call s:h("markdownHeadingRule", { "fg": s:warmgrey })
    call s:h("markdownH1", { "fg": s:purple })
    call s:h("markdownH2", { "fg": s:yellow })
    call s:h("markdownH3", { "fg": s:yellow })
    call s:h("markdownH4", { "fg": s:yellow })
    call s:h("markdownH5", { "fg": s:yellow })
    call s:h("markdownH6", { "fg": s:yellow })
    call s:h("markdownBlockquote", { "fg": s:warmgrey })
    call s:h("markdownItalic", { "fg": s:yellow, "gui": "italic", "cterm": "italic" })
    call s:h("markdownBold", { "fg": s:yellow, "gui": "bold", "cterm": "bold" })
    "" }}}
    "}}}
" }}}
elseif g:colors_name =~ 'nord'  "{{{
    echo 'Nord Color Syntax set!'
    " Colors {{{
    let s:nord0_gui = { "gui": "#2E3440", "cterm": "252" }
    let s:nord1_gui = { "gui": "#3B4252", "cterm": "0" }
    let s:nord2_gui = { "gui": "#434C5E", "cterm": "235" }
    let s:nord3_gui = { "gui": "#4C566A", "cterm": "236" }
    let s:nord4_gui = { "gui": "#D8DEE9", "cterm": "233" }
    let s:nord5_gui = { "gui": "#E5E9F0", "cterm": "7" }
    let s:nord6_gui = { "gui": "#ECEFF4", "cterm": "15" }
    let s:nord7_gui = { "gui": "#8FBCBB", "cterm": "14" }
    let s:nord8_gui = { "gui": "#88C0D0", "cterm": "6" }
    let s:nord9_gui = { "gui": "#81A1C1", "cterm": "4"  }
    let s:nord10_gui= { "gui": "#5E81AC", "cterm": "12" }
    let s:nord11_gui= { "gui": "#BF616A", "cterm": "1" }
    let s:nord12_gui= { "gui": "#D08770", "cterm": "11" }
    let s:nord13_gui= { "gui": "#EBCB8B", "cterm": "3"  }
    let s:nord14_gui= { "gui": "#A3BE8C", "cterm": "2"  }
    let s:nord15_gui= { "gui": "#B48EAD", "cterm": "5"  }
    " }}}
    " NERDTree {{{
    call s:h("NERDTreeOpenable", { "fg": s:nord14_gui })
    call s:h("NERDTreeClosable", { "fg": s:nord14_gui })
    call s:h("NERDTreeCWD", { "fg": s:nord7_gui })
    call s:h("NERDTreeBookmark", { "fg": s:nord13_gui })
    call s:h("NERDTreeBookmarkName", { "fg": s:nord15_gui })
    " }}}
    " CSS
    call s:h("cssBoxProp", { "fg": s:nord8_gui })
    call s:h("cssDefinition", { "fg": s:nord8_gui })
    call s:h("cssPositioningProp", { "fg": s:nord8_gui })
    call s:h("cssPseudoClassId", { "fg": s:nord8_gui })
    call s:h("cssBackgroundProp", { "fg": s:nord8_gui })
    call s:h("cssTextProp", { "fg": s:nord8_gui })
    call s:h("cssFlexibleBoxProp", { "fg": s:nord8_gui })
    call s:h("cssListProp", { "fg": s:nord8_gui })
    call s:h("cssClassname", { "fg": s:nord13_gui })


endif "}}}"
endfunction "}}}


