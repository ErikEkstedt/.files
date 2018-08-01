" =============================================================================
" Filename: autoload/lightline/colorscheme/myonedark.vim
" Author: Erik
" License: MIT License
" =============================================================================

" let s:black  = [ '#232526', 233 ]
let s:black  = [ '#000000', 233 ]
let s:black2  = [ '#000000', 233 ]
let s:gray   = [ '#282c34', 244 ]
let s:gray2  = [ '#49483e', 250 ]
let s:white  = [ '#f8f8f2', 234 ]
let s:cyan   = [ '#66d9ef', 81 ]
let s:cyan2   = [ '#129B9B', 81 ]
let s:green  = [ '#a6e22e', 118 ]
let s:orange = [ '#c678dd', 166 ]
let s:pink   = [ '#f92672', 161 ]
let s:red    = [ '#ff0000', 160 ]
let s:yellow = [ '#e6db74', 229 ]

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}

let s:p.normal.error    = [ [ s:pink, s:black ] ]
let s:p.normal.warning  = [ [ s:yellow, s:black ] ]

let s:p.normal.left     = [ [ s:gray, s:cyan ], [ s:cyan, s:black ] ]
let s:p.normal.middle   = [ [ s:cyan, s:black ], [ s:black, s:cyan ] ]
let s:p.normal.right    = [ [ s:black, s:cyan ], [ s:black, s:cyan ] ]

let s:p.insert.left     = [ [ s:black, s:green ], [ s:green, s:black ] ]
let s:p.insert.middle   = [ [ s:green, s:black ], [ s:black, s:green ] ]
let s:p.insert.right    = [ [ s:black, s:green ], [ s:black, s:green ] ]

let s:p.visual.left     = [ [ s:black, s:yellow ], [ s:yellow, s:black ] ]
let s:p.visual.middle   = [ [ s:yellow, s:black ], [ s:black, s:yellow ] ]
let s:p.visual.right    = [ [ s:black, s:yellow ], [ s:black, s:yellow ] ]

let s:p.replace.left    = [ [ s:black, s:red ], [ s:red, s:black ] ]
let s:p.replace.middle  = [ [ s:black, s:red ], [ s:red, s:black ] ]
let s:p.replace.right   = [ [ s:black, s:red ], [ s:red, s:black ] ]

let s:p.inactive.left   = [ [ s:pink, s:black ], [ s:white, s:black ] ]
let s:p.inactive.middle = [ [ s:black, s:black ] ]
let s:p.inactive.right  = [ [ s:pink, s:black ], [ s:pink, s:black ] ]

let s:p.tabline.left    = [ [ s:pink, s:black ] ]
let s:p.tabline.middle  = [ [ s:yellow, s:black] ]
let s:p.tabline.right   = [ [ s:black, s:pink ] ]

let s:p.tabline.tabsel  = [ [ s:black, s:pink ] ]

let g:lightline#colorscheme#myonedark#palette = lightline#colorscheme#flatten(s:p)
