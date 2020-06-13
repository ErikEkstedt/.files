" FUNCTIONS 

" function! ShowGlobalVariables()
"   for k in keys(g:)
"     echo k ':'  g:[k]
"   endfor
" endfunction

function! ShowHighlights()
  let old_reg = getreg("a")                 " save the current content of register a
  let old_reg_type = getregtype("a")        " save the type of the register as well
  try
    redir @a                                " redirect output to register a
    silent :highlight
    redir END                               " end output redirection
    vnew                                    " new buffer in vertical window
    setlocal ft=conf
    put a
    silent %!sort
  finally                                   " Execute even if exception is raised
    call setreg("a", old_reg, old_reg_type) " restore register a
  endtry
endfunction


function! ShowGlobalVariables()
  let old_reg = getreg("a")                 " save the current content of register a
  let old_reg_type = getregtype("a")        " save the type of the register as well
  try
    redir @a                                " redirect output to register a
    silent let g:
    redir END                               " end output redirection
    vnew                                    " new buffer in vertical window
    put a
    silent %!sort
  finally                                   " Execute even if exception is raised
    call setreg("a", old_reg, old_reg_type) " restore register a
  endtry
endfunction


function! ShowMaps()
  let old_reg = getreg("a")                 " save the current content of register a
  let old_reg_type = getregtype("a")        " save the type of the register as well
  try
    redir @a                                " redirect output to register a
  " Get the list of all key mappings silently, satisfy "Press ENTER to continue"
  " TODO: fix verbose mappings.  (without sort?)
    silent map | call feedkeys("\<CR>")
    redir END                               " end output redirection
    vnew                                    " new buffer in vertical window
    put a                                   " put content of register
                                            " Sort on 4th character column which is the key(s)
    %!sort -k1.4,1.4
  finally                                   " Execute even if exception is raised
    call setreg("a", old_reg, old_reg_type) " restore register a
  endtry
endfunction
" nnoremap \m :call ShowMaps()<CR>
" Map keys to call the function

" Highlight/syntax group
" Shows what highlight group the word under cursor belongs to.
function! <SID>SynStack() 
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
nmap <leader>sp :call <SID>SynStack()<CR>


" Change the background
function! ChangeBackground(bg_color)
  let l:bg_color='#' . string(a:bg_color)
  exe 'hi! StatusLine guibg=' . l:bg_color
  exe 'hi! Normal guibg=' . l:bg_color
  exe 'hi! LineNr guibg=' . l:bg_color
  exe 'hi! Folded guibg=' . l:bg_color
endfunc
