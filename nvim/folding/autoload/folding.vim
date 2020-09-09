let s:middot='·'
let s:raquo='»'
let s:small_l='ℓ'

function! folding#foldtext() abort
  let l:line = getline(v:foldstart)
  let subs = substitute(line, '/\*\|\*/\|{{{\d\=', '', 'g')
	" remove quote
  let subs = substitute(subs, '"', '', 'g')
  let subs = substitute(subs, '#\ ', '', 'g')
  let subs = substitute(subs, '#', '', 'g')
  let subs = substitute(subs, '{', '', 'g')

  let l:first=substitute(getline(v:foldstart), '\v *', '', '')

  let l:lines='[' . (v:foldend - v:foldstart + 1) . s:small_l . ']'
  let l:dashes=substitute(v:folddashes, '-', s:middot, 'g')

  return s:raquo . '-- ' . l:subs . l:dashes . l:lines
endfunction
