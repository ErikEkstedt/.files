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
inoremap ;i \item

" Figure
inoremap ;fi \begin{figure}<CR>\centering<CR>\includegraphics[]{<++>}<CR>\caption{<++>}<CR>\label{fig:<++>}<CR>\end{figure}<Esc>6k<Space><Space>

" Table
inoremap ;bta \begin{table}[h]<CR>\caption{<++>}<CR>\label{tab:<++>}<CR>\centering<CR>\begin{tabular}{lll} <CR>& <++> & <++>\\\hline<CR><BS><BS>\end{tabular}<CR>\end{table}<CR><CR><++><Esc>?aa<CR>"_c2l

" Equation
inoremap ;eq \begin{equation}<CR>\label{eq:<++>}<CR>\end{equation}<CR><CR><++><Esc>3kO

" url
inoremap ;url \url{} <++><Esc>5h

"}}}

" tpope/vim-surround
" 109=m, 105=i, 101=e, 102=f
let b:surround_109 = "\\( \r \\)"
let b:surround_105 = "\\textit{\r\}"
let b:surround_101 = "\\emph{\r\}"
let b:surround_102 = "\\textbf{\r\}"

nnoremap <leader>tb :normal ysiWf<CR> 
nnoremap <leader>ti :normal ysiWi<CR>
nnoremap <leader>te :normal ysiWe<CR>
nnoremap <leader>tm :normal ysiWm<CR>

" fix slowness
"normal :NoMatchParen
let g:vimtex_indent_enabled = 1
let g:vimtex_motion_matchparen = 1
let g:tex_fold_enabled=1
let g:indentLine_enabled = 1 

setlocal tw=80
