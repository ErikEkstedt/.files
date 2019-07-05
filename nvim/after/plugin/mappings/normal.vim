" vim: fdm=marker
" MAPPINGS

" Visual selection
nnoremap vv V
nnoremap V v$
nnoremap Y y$
" select everything (like ctrl-a, remember?)
nnoremap <leader>a ggvG$

" standard saving options
nnoremap <c-s> :w<cr>
nnoremap <c-q> :q!<cr>

"" indent paragraphs
nnoremap <leader>mm vip=

" Toggle conceallevel
nnoremap <leader>cc :exec &conceallevel ? "set conceallevel=0" : "set conceallevel=1"<CR>

"" redraw
nnoremap <leader><leader>r :redraw!<CR>

" open quickfix window for latest vim search term.
nnoremap <silent> <leader>/ :execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>

" Substitute word under cursor in entire file.
nnoremap <leader>sw :%s/<C-r><C-w>//g<Left><Left>

" Substitute word by put
nnoremap S viw"0p

" Clean trailing whitespace
nnoremap <leader><backspace> mz:%s/\s\+$//<cr>:let @/=''<cr>`z

" delete all bufers except current
" nnoremap <leader>bd :w | %bd | e#
nnoremap <leader>db :%bd<CR><C-O>:bd#<CR>

"indenting/unindenting
" nnoremap <tab> >>
nnoremap <s-tab> <lt><lt>

"--------------------------------------------------------
"--------------------- Movement -------------------------
"-------------------------------------------------------- {{{

" When vim wraps one line over several lines
" make j/k movie inside the line intuitively
nnoremap j gj
nnoremap k gk

" natural end/beginning of line movement (also in visual and selection)
nnoremap L $
nnoremap H ^

" jump paragraph (Swedish Keyboard)
map ö {
map ä }

" Windows
" Move between windows
" Tmux now handles movement between windows and resizing
" Plugin 'edkolev/tmuxline.vim'
" Window Resizing
nnoremap <C-h> :vertical resize -3<cr>
nnoremap <C-l> :vertical resize +3<cr>
nnoremap <C-k> :resize +3<cr>
nnoremap <C-j> :resize -3<cr>

" Buffers previous/next
nnoremap <space>b :bp<CR>
nnoremap <space>B :bf<CR>
nnoremap <space>p :bp<CR>
nnoremap <space>P :bf<CR>
nnoremap <space>n :bn<CR>
nnoremap <space>N :bl<CR>
nnoremap <space><space> :b#<CR>
nnoremap <space>d :bd<CR>
nnoremap <space>D :bd!<CR>

" Workflow [right] / Todo(work)[left]
nnoremap <h :leftabove vsplit ~/phd/ToDo.md<CR>:vertical resize 80<CR>
nnoremap <l :vsplit ~/.files/WorkFlow.md<CR>:vertical resize 80<CR>

" Create new window
nnoremap <space>J <c-w>n 
nnoremap <space>L <c-w>n<c-w>L

" Create new file in current buffer path
" nnoremap <C-W>n :vsplit %:h/

" Change current working directory
" http://vim.wikia.com/wiki/Set_working_directory_to_the_current_file
nnoremap ,pw :lcd %:p:h<CR>:pwd<CR>

function! ChangeToLocalDir()
	lchdir %:p:h
  :pwd
	return ''
endfunction
nnoremap ,cd :call ChangeToLocalDir()<CR>
" }}}

"--------------------------------------------------------
"--------------------- Copy/Paste -----------------------
"--------------------------------------------------------

" :set paste/nopaste
set pastetoggle=<f2> " system clipboard pastes preserves indentation

" copy / paste from clipboard
" yank/put +  -> clipboard
" nnoremap <c-p> "+p
" inoremap <c-p> <esc>"+pi
nnoremap ,pa "+p
nnoremap <c-y> "+yy

" Repeat last macro if in a normal buffer.
nnoremap <expr> <CR> empty(&buftype) ? '@@' : '<CR>'

"--------------------------------------------------------
"--------------------- Search   -------------------------
"--------------------------------------------------------

" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

" go to next under cursor
nnoremap gn *zz
nnoremap gN #zz


" */# now stays on current cursor position
nnoremap * *<c-o>
nnoremap # #<c-o>

" when sudo rights are needed but you did not sudo.
cmap w!! %!sudo tee > /dev/null %

" Spell
map <F6> :setlocal spell! spelllang=en_us<CR>
nnoremap <leader>ge ]s
nnoremap <leader>gf z=1<CR>
nnoremap <localleader>sv :set spelllang=sv<CR>
nnoremap <localleader>en :set spelllang=en<CR>

" next paren
nnoremap gp %
nnoremap gl f, a<CR><esc>
nnoremap gL f;a<CR><esc>
nnoremap g<space> f<space>a<CR><esc>


"--------------------------------------------------------
"--------------------- Folds    -------------------------
"--------------------------------------------------------
" Toggle fold
nnoremap ga zA
nnoremap <leader>z zMzvzz

" Nerdtree uses 'o' to open "foldlike" dirs.
" I want to use 'o' to open closed folds but everywhere else it
" should work as usual 
" foldclosed('.') returns -1 if not a closed fold or the linenumber
" where the closed fold is.
nnoremap <silent> o @=(foldclosed('.')>0?'za':"o")<CR>

" ----------- Seldom Use ---------------

" " visual select last yanked/del/pasted text
" nnoremap <expr> gvp '`['.strpart(getregtype(), 0, 1).'`]i'

" " toggle highlight search
" nnoremap <leader><space> :set hlsearch!<cr>

" " indent everything
" nnoremap <leader>i gg=G<C-o>

" " Open Tensorboard
" nnoremap <leader>tensb :! firefox --new-window localhost:6006 &<CR>
