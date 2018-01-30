"Comomn tex writings
" Text
inoremap ;bf \textbf{} <++><Esc>5hi
inoremap ;ci \cite{} <++><Esc>5hi
inoremap ;re \ref{} <++><Esc>5hi
inoremap ;em \emph{} <++><Esc>5hi
inoremap ;noi \noindent<CR>
inoremap ;ma \(\) <++><Esc>6hi

" Sections
inoremap ;se \section{}<CR>%{{{<CR><++><Esc>kk6li
inoremap ;su \subsection{}<CR>%{{{<CR><++><Esc>kk9li
inoremap ;ss \subsubsection{}<CR>%{{{<CR><++><Esc>kk12li
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
inoremap ;url \url{} <++><Esc>5hi

" fix slowness
"normal :NoMatchParen
let g:vimtex_indent_enabled = 1
let g:vimtex_motion_matchparen = 1
let g:tex_fold_enabled=1
let g:indentLine_enabled = 1 


