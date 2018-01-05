" MAPPINGS 

" Config files
nnoremap <leader>ev   :tabnew ~/.vimrc<cr>
nnoremap <leader>env  :tabnew ~/.files/nvim/init.vim<cr>
nnoremap <leader>ez   :tabnew ~/.zshrc<cr>
nnoremap <leader>ea   :tabnew ~/.files/aliases<cr>
nnoremap <leader>ei3  :tabnew ~/.config/i3/config<cr>
nnoremap <leader>er   :tabnew ~/.config/ranger/rc.conf<cr>
nnoremap <leader>ex   :tabnew ~/.xresources<cr>
nnoremap <leader>et   :tabnew ~/.tmux.conf<cr>
nnoremap <leader>ebib :tabnew ~/documents/latex/references.bib<cr>
nnoremap <leader>epy  :tabnew ~/.vim/ftplugin/python.vim<cr>
nnoremap <leader>ete  :tabnew ~/.vim/ftplugin/tex.vim<cr>
nnoremap <leader>ema  :tabnew ~/.vim/ftplugin/markdown.vim<cr>

" source config files
nnoremap <leader>snv  :source ~/.config/nvim/init.vim<cr>
nnoremap <leader>sv   :source ~/.vimrc<cr>
nnoremap <leader>sz   :source ~/.zshrc<cr>
nnoremap <leader>sx   :!xrdb ~/.Xresources<cr>
nnoremap <leader>sot  :source ~/.tmux.conf<cr>

" Neovim: exit terminal
tnoremap <Esc> <C-\><C-n>

" Open Visdom
nnoremap <leader>vd :! firefox --new-window 192.168.0.104:8097 &<CR>
nnoremap <leader>vl :! firefox --new-window localhost:8097 &<CR>

" Visual selection
nnoremap vv V
nnoremap V v$
nnoremap <leader>a ggvG$
nnoremap Y y$

" Source lines
vnoremap <leader>vs y:@"<CR>

" Search   
" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

" open quickfix window for latest vim search term.
nnoremap <silent> <leader>/ :execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>

" toggle highlight search
nnoremap <leader><space> :set hlsearch!<cr>

" standard saving options 
nnoremap <c-s> :w<cr>
inoremap <c-s> <esc>:w<cr>
nnoremap <c-q> :q!<cr>
inoremap <c-q> <esc>:wq<cr>

"indenting/unindenting 
inoremap <s-tab> <esc><lt><lt>i
nnoremap <tab> >>
nnoremap <s-tab> <lt><lt>
vnoremap <s-tab>   <gv
vnoremap <tab> >gv|

inoremap <leader>i <esc>gg=G<C-o>
nnoremap <leader>i gg=G<C-o>

" indent paragraphs
inoremap <leader>mm <esc>vip=
nnoremap <leader>mm vip=

" copy / paste 
set pastetoggle=<f2> " system clipboard pastes preserves indentation

" copy / paste from clipboard
nnoremap <c-p> "+p
inoremap <c-p> <esc>"+pi
vnoremap <c-p> "+p
nnoremap <c-y> "+yy
vnoremap <c-y> "+y

 
" increment/decrement vis. selected numbers
vnoremap <leader>aa <C-a>
vnoremap <leader>AA <C-x>
vnoremap ga g<C-a>

" substitute word under cursor in entire file.
nnoremap <leader>sw :%s/<C-r><C-w>//g<Left><Left>


" Clean trailing whitespace
nnoremap <leader><backspace> mz:%s/\s\+$//<cr>:let @/=''<cr>`z

" when sudo rights are needed but you did not sudo.
cmap w!! %!sudo tee > /dev/null %

" tab
nnoremap <silent> <c-t> :<c-u>tabnew<cr>
inoremap <silent> <c-t> <esc>:<c-u>tabnew<cr>
nnoremap <silent> g0 :<c-u>tabfirst<cr>
nnoremap <silent> g$ :<c-u>tablast<cr>

" visual select last yanked/del/pasted text
nnoremap <expr> gvp '`['.strpart(getregtype(), 0, 1).'`]i'

"Spellcheck
map <F6> :setlocal spell! spelllang=en_us<CR>

nnoremap <f10> :set relativenumber!<cr>

" Some vim-diff settings
if &diff
	noremap <leader>1 :diffget LOCAL<CR>
	noremap <leader>2 :diffget BASE<CR>
	noremap <leader>3 :diffget REMOTE<CR>
	nnoremap <Leader>n ]c
	nnoremap <Leader>p [c
endif

" change word by put
nnoremap S viw"0p

" Marker line
nnoremap <leader>mA :TComment<CR>A{{{<esc>
nnoremap <leader>me :TComment<CR>A}}}<esc>

" Movement 
" Buffers previous/next
nnoremap <b :bp<CR>
nnoremap <n :bn<CR>

nmap G Gzz

" jump in jump list
nnoremap <i <C-I>zz
nmap <c-o> <c-o>zz

" jump paragraph
map ö {
map ä }

" */# now stays on a 
nnoremap * *<c-o>
nnoremap # #<c-o>
nnoremap gn *zz
nnoremap gN #zz

" [cmd] break lines by
" gq{motion} % format the line that {motion} moves over
" {Visual}gq % format the visually selected area
" gqq        % format the current line

" Go to next/previous Python method or class (PyMode)
nnoremap gj :call pymode#motion#move('^\s*def\s', '')<CR>zz
nnoremap gk :call pymode#motion#move('^\s*def\s', 'b')<CR>zz
nnoremap gJ :call pymode#motion#move('^\s*class\s', '')<CR>zz
nnoremap gK :call pymode#motion#move('^\s*class\s', 'b')<CR>zz

" next paren
nnoremap gp %

" go next spell error
nnoremap gs ]s

" move up and down naturally even if lines
" extends over multiple rows
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" natural end/beginning of line movement
nnoremap L $
nnoremap H 0

" Toggle fold
nnoremap ga zA
nnoremap <leader>z zMzvzz

" Nerdtree uses 'o' to open "foldlike" dirs.
" I want to use 'o' to open closed folds but everywhere else it
" should work as regular (I use 'o' alot!)
" foldclosed('.') returns -1 if not a closed fold or the linenumber
" where the closed fold is.
nnoremap <silent> o @=(foldclosed('.')>0?'za':"o")<CR>

" Windows 
" Move between windows
" Tmux now handles movement between windows and resizing
" Plugin 'edkolev/tmuxline.vim'
" Window Resizing
nnoremap <C-h> :vertical resize -3<cr>
nnoremap <C-l> :vertical resize +3<cr>
nnoremap <C-k> :resize +3<cr>
nnoremap <C-j> :resize -3<cr>
" Automatically resize when vim changes 
au VimResized * exe "normal! \<c-w>="


"============== Macros/ longer cmds =========={{{
" find , and make new line | todo: 2gl -> execute command 2 times, etc.
nnoremap gl f,a<CR><esc> 

" save current buffer, close all buffers, open the buffer I was on
" noremap <leader>bd :w | %bd | e#
noremap <leader>bd :%bd<CR><C-O>:bd#<CR>
" whitespace around operator nnoremap <leader>. f+i <esc>la <esc>0

"}}}
