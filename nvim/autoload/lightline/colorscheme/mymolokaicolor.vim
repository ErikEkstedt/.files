" =============================================================================
" Filename: autoload/lightline/colorscheme/mymolokaicolor.vim
" Author: Erik
" License: MIT License
" =============================================================================

let s:black  = [ '#232526', 233 ]
let s:gray   = [ '#808080', 244 ]
let s:white  = [ '#f8f8f2', 234 ]
let s:cyan   = [ '#66d9ef', 81 ]
let s:green  = [ '#a6e22e', 118 ]
let s:orange = [ '#ef5939', 166 ]
let s:pink   = [ '#f92672', 161 ]
let s:red    = [ '#ff0000', 160 ]
let s:yellow = [ '#e6db74', 229 ]
let s:gray2  = [ '#49483e', 250 ]

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}

let s:p.normal.left     = [ [ s:gray, s:cyan ], [ s:orange, s:gray2 ] ]
let s:p.normal.middle   = [ [ s:orange, s:gray2 ] ]
let s:p.normal.right    = [ [ s:pink, s:black ], [ s:black, s:pink ] ]
let s:p.normal.error    = [ [ s:pink, s:black ] ]
let s:p.normal.warning  = [ [ s:yellow, s:black ] ]

let s:p.insert.left     = [ [ s:black, s:green ], [ s:green, s:black ] ]
let s:p.visual.left     = [ [ s:black, s:yellow ], [ s:yellow, s:black ] ]

let s:p.replace.left    = [ [ s:black, s:red ], [ s:red, s:black ] ]
let s:p.inactive.left   = [ [ s:black, s:gray2 ], [ s:white, s:black ] ]
let s:p.inactive.middle = [ [ s:black, s:gray2 ] ]
let s:p.inactive.right  = [ [ s:white, s:pink ], [ s:pink, s:black ] ]
let s:p.tabline.left    = [ [ s:pink, s:black ] ]
let s:p.tabline.middle  = [ [ s:yellow, s:black] ]
let s:p.tabline.right   = copy(s:p.normal.right)
let s:p.tabline.tabsel  = [ [ s:black, s:pink ] ]

let g:lightline#colorscheme#mymolokaicolor#palette = lightline#colorscheme#flatten(s:p)
