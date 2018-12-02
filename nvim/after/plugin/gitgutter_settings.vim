" GitGutter

let g:gitgutter_sign_removed = '✖'
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '~'
let g:gitgutter_sign_modified_removed = '~_'
let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_realtime = 1
let g:gitgutter_eager = 1

hi GitGutterDelete guibg=#282c34 guifg=#AA0000
hi GitGutterChangeDelete guibg=#282c34
hi GitGutterAdd guibg=#282c34 guifg=#00ff52
hi GitGutterChange guibg=#282c34 guifg=#ff8200
