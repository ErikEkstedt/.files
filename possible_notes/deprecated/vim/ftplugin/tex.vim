"Comomn tex writings
" Insert Mappings {{{
" Text
inoremap ;bf \textbf{} <++><Esc>5hi
inoremap ;ci \cite{} <++><Esc>5hi
inoremap ;re \ref{} <++><Esc>5hi
inoremap ;em \emph{} <++><Esc>5hi
inoremap ;noi \noindent<CR>
inoremap ;ma \(\) <++><Esc>6hi

" Sections
inoremap ;se \section{}<CR>hi
inoremap ;su \subsection{}<CR>hi
inoremap ;ss \subsubsection{}<CR>hi
inoremap ;line %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%<CR><Esc>

" Itemize
inoremap ;i \item<space>

" Figure

" url
inoremap ;url \url{} <++><Esc>5hi

"}}}

" tpope/vim-surround
" 109=m, 105=i, 101=e, 102=f
let b:surround_109 = "\\(\r\\)"
let b:surround_105 = "\\textit{\r\}"
let b:surround_101 = "\\emph{\r\}"
let b:surround_102 = "\\textbf{\r\}"
nnoremap <leader>tb :normal ysiWf<CR> 
nnoremap <leader>ti :normal ysiWi<CR>
nnoremap <leader>te :normal ysiWe<CR>
nnoremap <leader>tm :normal ysiWm<CR>
inoremap <c-space> <esc>/<++><CR>c4l
nnoremap <c-space> <esc>/<++><CR>c4l

" nnoremap <buffer> <leader>ll <plug>(vimtex-compile)
" nnoremap <buffer> <leader>lv <plug>(vimtex-view)

" Use easy align plugin to align table
nnoremap <leader>ta vip:EasyAlign<CR>*&

" fix slowness - disable these
"normal :NoMatchParen
let g:vimtex_indent_enabled = 1
let g:vimtex_motion_matchparen = 1
let g:tex_fold_enabled=1
let g:indentLine_enabled = 1 

setlocal tw=80
