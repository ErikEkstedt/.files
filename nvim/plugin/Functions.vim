" vim: fdm=marker
" FUNCTIONS 

function! NERDTreeColors() "{{{
    if g:colors_name =~ 'seoul256'
        hi NERDTreeDir guifg=#90a959 
        hi Directory guifg=#404040
        hi NERDTreeCWD guifg=gray50
        hi NERDTreeFile guifg=white
        hi NERDTreeBookmarksHeader guifg=gray50
        hi NERDTreeBookmarkName guifg=gray50
    elseif g:colors_name =~ 'monokai'
        " let l:aqua        = #66d9ef
        " let l:yellow      = #E6DB74
        " let l:orange      = #FD9720
        " let l:purple      = #ae81ff
        hi NERDTreeBookmarkName guifg=#a6e22d
        hi NERDTreeDir guifg=#a6e22d
        hi Directory guifg=white
        hi NERDTreeCWD guifg=#f92772
        hi NERDTreeBookmarksHeader guifg=#f92772
        hi NERDTreeBookmark guifg=#a6e22d
        hi NERDTreeBookmark guifg=white
        echo 'NerdTree got new colors'
    endif
endfunc
nnoremap <LocalLeader>n :call NERDTreeColors()<CR>
"}}}

function! ShowGlobalVariables()
    for k in keys(g:)
        echo k ':'  g:[k]
    endfor
endfunction

" Moving visual lines vertically (greg hurrell){{{
" function! s:Visual()
"     return visualmode() == 'V'
" endfunction

" function! Move_up() abort range
"     let l:at_top=a:firstline == 1
"     if s:Visual() && !l:at_top
"         '<,'>move '<-2
"         call feedkeys('gv=','n')
"     endif
"     call feedkeys('gv','n')
" endfunction

" function! Move_down() abort range
"     let l:at_bottom=a:lastline == line('$')
"     if s:Visual() && !l:at_bottom
"         '<,'>move '>+1
"         call feedkeys('gv=','n')
"     endif
"     call feedkeys('gv','n')
" endfunction

" xnoremap K :call Move_up()<CR>
" xnoremap J :call Move_down()<CR>
"}}}

function! ShowMaps() "{{{
    " Shows the current ma
    let old_reg = getreg("a")          " save the current content of register a
    let old_reg_type = getregtype("a") " save the type of the register as well
    try
        redir @a                           " redirect output to register a
        " Get the list of all key mappings silently, satisfy "Press ENTER to continue"
        " TODO: fix verbose mappings.  (without sort?)
        silent map | call feedkeys("\<CR>")
        redir END                          " end output redirection
        vnew                               " new buffer in vertical window
        put a                              " put content of register
        " Sort on 4th character column which is the key(s)
        %!sort -k1.4,1.4
    finally                              " Execute even if exception is raised
        call setreg("a", old_reg, old_reg_type) " restore register a
    endtry
endfunction
nnoremap \m :call ShowMaps()<CR>
" Map keys to call the function }}}

" Highlight/syntax group{{{
" Shows what highlight group the word under cursor belongs to.
function! <SID>SynStack() 
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
nmap <leader>sp :call <SID>SynStack()<CR>
" }}}


" }}}
