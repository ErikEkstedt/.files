" TabLine		tab pages line, not active tab page label
" TabLineFill	tab pages line, where there are no labels
" TabLineSel	tab pages line, active tab page label
" Title		titles for output from ":set all", ":autocmd" etc.

hi TabLine guibg=#1e2126 guifg=#0fc5cf
hi TabLineSel guifg=#00f2ff
hi TabLineFill guibg=#1e2126
hi Title guibg=#282C34

" Then define the MyTabLine() function to list all the tab pages labels.  A
" convenient method is to split it in two parts:  First go over all the tab
" pages and define labels for them.  Then get the label for each tab page. >
function MyTabLine()
  let s = ''
  for i in range(tabpagenr('$'))
    " select the highlighting
    if i + 1 == tabpagenr()
      let s .= '%#TabLineSel#'
    else
      let s .= '%#TabLine#'
    endif

    " set the tab page number (for mouse clicks)
    let s .= '%' . (i + 1) . 'T'

    " the label is made by MyTabLabel()
    let s .= ' %{MyTabLabel(' . (i + 1) . ')} '
  endfor

  " after the last tab fill with TabLineFill and reset tab page nr
  let s .= '%#TabLineFill#%T'

  " right-align the label to close the current tab page
  if tabpagenr('$') > 1
    let s .= '%=%#TabLine#%999X CLOSE '
  endif

  return s
endfunction

function MyTabLabel(n)
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  " Return only filename
  return split(bufname(buflist[winnr - 1]), '/')[-1]
endfunction

set tabline=%!MyTabLine()

" GUITAB
" set guitablabel=%N\ %f
