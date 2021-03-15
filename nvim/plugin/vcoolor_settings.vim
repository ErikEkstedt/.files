" VCoolor

" sudo apt install yad
if g:UNAME == 'Linux'
  let g:vcoolor_custom_picker = 'yad --color --title "Vim Color"'
endif

let g:vcoolor_disable_mappings = 0
let g:vcoolor_lowercase = 1
let g:vcoolor_map = ',co'
