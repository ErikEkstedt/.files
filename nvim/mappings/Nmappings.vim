" vim: fdm=marker
" MAPPINGS 
" Config files {{{
nnoremap <leader>ev  :tabnew ~/.files/nvim/init.vim<cr>
nnoremap <leader>ez   :tabnew ~/.zshrc<cr>
nnoremap <leader>eal   :tabnew ~/.files/aliases<cr>
nnoremap <leader>ei3  :tabnew ~/.config/i3/config<cr>
nnoremap <leader>er   :tabnew ~/.config/ranger/rc.conf<cr>
nnoremap <leader>ex   :tabnew ~/.xresources<cr>
nnoremap <leader>et   :tabnew ~/.tmux.conf<cr>
nnoremap <leader>ebib :tabnew ~/documents/latex/references.bib<cr>
nnoremap <leader>epy  :tabnew ~/.vim/ftplugin/python.vim<cr>
nnoremap <leader>ete  :tabnew ~/.vim/ftplugin/tex.vim<cr>
nnoremap <leader>ema  :tabnew ~/.vim/ftplugin/markdown.vim<cr>

" source config files
nnoremap <leader>sv  :source ~/.files/nvim/init.vim<cr>
nnoremap <leader>sz   :source ~/.zshrc<cr>
nnoremap <leader>sx   :!xrdb ~/.Xresources<cr>
nnoremap <leader>sot  :source ~/.tmux.conf<cr>
" }}}
" LEADER {{{

" open quickfix window for latest vim search term.
nnoremap <silent> <leader>/ :execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>

" toggle highlight search
nnoremap <leader><space> :set hlsearch!<cr>

" indent everything
nnoremap <leader>i gg=G<C-o>

" indent paragraphs
nnoremap <leader>mm vip=

" redraw 
nnoremap <leader><leader>r :redraw!<CR>

" Open Visdom
nnoremap <leader>vd :! firefox --new-window 192.168.0.104:8097 &<CR>
nnoremap <leader>vl :! firefox --new-window localhost:8097 &<CR>

" substitute word under cursor in entire file.
nnoremap <leader>sw :%s/<C-r><C-w>//g<Left><Left>

" Clean trailing whitespace
nnoremap <leader><backspace> mz:%s/\s\+$//<cr>:let @/=''<cr>`z

" Spell
nnoremap <leader>ge ]s
nnoremap <leader>gf z=1<CR>	
nnoremap <localleader>sv :set spelllang=sv<CR> 
nnoremap <localleader>en :set spelllang=en<CR>

" Some vim-diff settings
if &diff
	noremap <leader>1 :diffget LOCAL<CR>
	noremap <leader>2 :diffget BASE<CR>
	noremap <leader>3 :diffget REMOTE<CR>
	nnoremap <Leader>n ]c
	nnoremap <Leader>p [c
endif

" delete all bufers except current
" noremap <leader>bd :w | %bd | e#
noremap <leader>db :%bd<CR><C-O>:bd#<CR>

" }}}
" CTRL & TAB {{{
"indenting/unindenting 
nnoremap <tab> >>
nnoremap <s-tab> <lt><lt>

" standard saving options 
nnoremap <c-s> :w<cr>
nnoremap <c-q> :q!<cr>

" copy / paste 
set pastetoggle=<f2> " system clipboard pastes preserves indentation

" copy / paste from clipboard
nnoremap <c-p> "+p
nnoremap <c-y> "+yy
inoremap <c-p> <esc>"+pi

" Repeat last macro if in a normal buffer.
nnoremap <expr> <CR> empty(&buftype) ? '@@' : '<CR>'

" fuzzy search nmap and the chosen one is implemented
nmap <leader><tab> <plug>(fzf-maps-n)

" Windows 
" Move between windows
" Tmux now handles movement between windows and resizing
" Plugin 'edkolev/tmuxline.vim'
" Window Resizing
nnoremap <C-h> :vertical resize -3<cr>
nnoremap <C-l> :vertical resize +3<cr>
nnoremap <C-k> :resize +3<cr>
nnoremap <C-j> :resize -3<cr>

function! ChangeToLocalDir()
	lchdir %:p:h
	return ''
endfunction
nnoremap <expr> _c ChangeToLocalDir()

" Neovim: exit terminal
tnoremap <Esc> <C-\><C-n>

" Visual selection
nnoremap vv V
nnoremap V v$
nnoremap <leader>a ggvG$
nnoremap Y y$

" Search   
" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv
" Automatically resize when vim changes 
au VimResized * exe "normal! \<c-w>="

" when sudo rights are needed but you did not sudo.
cmap w!! %!sudo tee > /dev/null %

" visual select last yanked/del/pasted text
nnoremap <expr> gvp '`['.strpart(getregtype(), 0, 1).'`]i'

" Spellcheck
nnoremap <f10> :set relativenumber!<cr>
map <F6> :setlocal spell! spelllang=en_us<CR>

nnoremap gn *zz
nnoremap gN #zz

" next paren
nnoremap gp %
nnoremap gl f,a<CR><esc> 

" change word by put
nnoremap S viw"0p

" Movement 
" Buffers previous/next
nnoremap <b :bp<CR>
nnoremap <n :bn<CR>
nnoremap <h :bp<CR>
nnoremap <l :bn<CR>

" jump in jump list
nnoremap <i <C-I>zz
nmap <c-o> <c-o>zz

nmap G Gzz

" jump paragraph
nnoremap ö {
nnoremap ä }

" */# now stays on a 
nnoremap * *<c-o>
nnoremap # #<c-o>

" Toggle fold
nnoremap ga zA
nnoremap <leader>z zMzvzz

" natural end/beginning of line movement
nnoremap L $
nnoremap H 0

" Nerdtree uses 'o' to open "foldlike" dirs.
" I want to use 'o' to open closed folds but everywhere else it
" should work as regular (I use 'o' alot!)
" foldclosed('.') returns -1 if not a closed fold or the linenumber
" where the closed fold is.
nnoremap <silent> o @=(foldclosed('.')>0?'za':"o")<CR>
"}}}

function SetFold() "{{{
	:set foldtext=v:folddashes.substitute(getline(v:foldstart),'/\\*\\\|\\*/\\\|{{{\\d\\=','','g')
endfunction
nnoremap <leader>fo :call SetFold()
"}}}
