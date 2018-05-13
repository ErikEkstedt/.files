" vim: fdm=marker
" PLUGIN SETTINGS
"============== Deoplete ====================={{{
" Use deoplete.
if !exists('g:gui_oni')
	let g:deoplete#enable_at_startup = 1
else
	let g:deoplete#enable_at_startup = 0
endif

let g:loaded_neopairs = 1
let g:neopairs#enable = 1
let g:deoplete#max_abbr_width = 40
let g:deoplete#max_menu_width = 40
let g:deoplete#auto_complete_delay = 10

" deoplete tab/s-tab/c-j/c-k complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr><S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr><C-j> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr><C-k> pumvisible() ? "\<C-p>" : "\<S-Tab>"

nnoremap <leader>dd :call deoplete#toggle()<CR>

" Deoplete and vimtex
if !exists('g:deoplete#omni#input_patterns')
		let g:deoplete#omni#input_patterns = {}
endif

let g:deoplete#omni#input_patterns.tex = g:vimtex#re#deoplete

"close the preview window after completion is done.
autocmd CompleteDone * pclose!

call deoplete#custom#source('_', 'sorters', ['sorter_word'])
call deoplete#custom#source('ultisnips', 'rank', 9999)
call deoplete#custom#source('neosnippet', 'rank', 9999)
call deoplete#custom#source('_', 'converters', ['converter_auto_paren'])

"}}}
""============== Neosnippet ====================={{{
"" Plugin key-mappings.
"" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <leader><leader> <Plug>(neosnippet_expand_or_jump)
"smap <leader><leader> <Plug>(neosnippet_expand_or_jump)
"xmap <leader><leader> <Plug>(neosnippet_expand_target)

"imap <expr><C-l>
"\ neosnippet#expandable_or_jumpable() ?
"\ "\<Plug>(neosnippet_expand_or_jump)" : "\<C-n>"

"imap <expr><C-h>
"\ neosnippet#expandable_or_jumpable() ?
"\ "\<Plug>(neosnippet_expand_or_jump)" : "\<C-p>"

"le g:neosnippet#enable_snipmate_compatibility = 1
"let g:neosnippet#snippets_directory='~/.files/nvim/mysnippets'
"let g:neosnippet#enable_conceal_markers = 0

"" For conceal markers.
"if has('conceal')
"  set conceallevel=2 concealcursor=niv
"endif
""}}}
"============== UltiSnips ===================={{{
let g:UltiSnipsSnippetsDir = "~/.files/nvim/mysnippets" 
let g:UltiSnipsSnippetDirectories = ["UltiSnips", "snips", "~/.vim/bundle/vim-snippets/snippets"]

" let g:UltiSnipsSnippetsDir = "~/.vim/bundle/vim-snippets"
" let g:UltiSnipsSnippetDirectories = ["UltiSnips", "snips", "~/.files/nvim/mysnippets"]

" Trigger configuration.
let g:UltiSnipsExpandTrigger='<leader><leader>'
let g:UltiSnipsJumpForwardTrigger="<c-l>" 
let g:UltiSnipsJumpBackwardTrigger="<c-h>" 

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit='vertical'

" Use Python Version 
let g:UltiSnipsUsePythonVersion = 3

" augroup markdown 
" 	au! 
" 	au BufNewFile,BufRead *.md,*.markdown,*.mmd set filetype=markdown 
" 	au BufNewFile,BufRead *.md,*.markdown,*.mmd UltiSnipsAddFiletypes markdown 
" augroup END

"}}}
"============== FZF =========================={{{
" Customize fzf colors to match your color scheme
let g:fzf_colors = { 'fg': ['fg', 'Normal'], 
			\ 'bg':      ['bg', 'Normal'],
			\ 'hl':      ['fg', 'Comment'],
			\ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
			\ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
			\ 'hl+':     ['fg', 'Statement'],
			\ 'info':    ['fg', 'PreProc'],
			\ 'border':  ['fg', 'Ignore'],
			\ 'prompt':  ['fg', 'Conditional'],
			\ 'pointer': ['fg', 'Exception'],
			\ 'marker':  ['fg', 'Keyword'],
			\ 'spinner': ['fg', 'Label'],
			\ 'header':  ['fg', 'Comment']}

" let g:fzf_colors = { 'border': ['fg', 'Normal']}

" Settings
" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" Mappings
nnoremap <Leader>fl :Files<CR>
nnoremap <Leader>fi :Files ~/<CR>
nnoremap <Leader>fc :Files ~/.files<CR>
nnoremap <Leader>fo :Files /opt/Oni<CR>
nnoremap <Leader>fr :Files /<CR>
nnoremap <Leader>ff :Rg<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>li :Lines<CR>
nnoremap <Leader>fli :FZFLines<CR>
nnoremap <Leader>gs :GFiles?<CR>
nnoremap <Leader>he :Helptags<CR>
nnoremap <Leader>fs :Snippets<CR>

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~50%' }

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Similarly, we can apply it to fzf#vim#grep. To use ripgrep instead of ag:
command! -bang -nargs=* Rg
			\ call fzf#vim#grep(
			\   'rg --column --line-number --no-heading --hidden --color=always '.shellescape(<q-args>), 1,
			\   <bang>0 ? fzf#vim#with_preview('up:60%')
			\           : fzf#vim#with_preview('right:50%:hidden', '?'),
			\   <bang>0)

" Likewise, Files command with preview window
command! -bang -nargs=? -complete=dir Files call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

" Search lines in all open vim buffers {{{

function! s:line_handler(l)
  let keys = split(a:l, ':\t')
  exec 'buf' keys[0]
  exec keys[1]
  normal! ^zz
endfunction

function! s:buffer_lines()
  let res = []
  for b in filter(range(1, bufnr('$')), 'buflisted(v:val)')
    call extend(res, map(getbufline(b,0,"$"), 'b . ":\t" . (v:key + 1) . ":\t" . v:val '))
  endfor
  return res
endfunction

command! FZFLines call fzf#run({
			\   'source':  <sid>buffer_lines(),
			\   'sink':    function('<sid>line_handler'),
			\   'options': '--extended --nth=3..',
			\   'down':    '60%'
			\}) "}}}

" This is the default extra key bindings
let g:fzf_action = {
			\ 'ctrl-t': 'tab split',
			\ 'ctrl-x': 'split',
			\ 'ctrl-v': 'vsplit',
			\ 'ctrl-o': 'edit',
			\ 'Enter': 'vsplit',
			\ 'Esc': 'exit', }
"}}}
"============== easy-motion =================={{{
let g:EasyMotion_keys = 'abcdefghijklmnopqrstuvwxyzåöä'
map <j <Plug>(easymotion-j)
map <k <Plug>(easymotion-k)
" map <h <Plug>(easymotion-linebackward)
" map <l <Plug>(easymotion-lineforward)

nmap <space> <Plug>(easymotion-bd-w)
nmap <leader>ee <Plug>(easymotion-bd-e)

map <f <Plug>(easymotion-bd-f)
nmap <s <Plug>(easymotion-overwin-f)

let g:EasyMotion_startofline = 1 " Linejumps puts cursor at start of line

"}}}
"============== Tmux-navigation =============={{{
let g:tmux_navigator_no_mappings = 1

if !exists('g:gui_oni')
	nnoremap <silent><Left> :TmuxNavigateLeft<cr>
	nnoremap <silent><Down> :TmuxNavigateDown<cr>
	nnoremap <silent><Up> :TmuxNavigateUp<cr>
	nnoremap <silent><Right> :TmuxNavigateRight<cr>
endif

"}}}
"============== Slimux ======================={{{
let g:slimux_python_use_ipython = 1
nnoremap <C-c><C-c> :SlimuxREPLSendLine<CR>
vnoremap <C-c><C-c> :SlimuxREPLSendLine<CR>gv<Esc>zz
nnoremap <C-c><C-x> :SlimuxREPLConfigure<CR>

" }}}
"============== Vimpyter ========================{{{
autocmd Filetype ipynb nnoremap <silent><Leader>b :VimpyterInsertPythonBlock<CR>
" autocmd Filetype ipynb nnoremap <silent><localleader>ll :VimpyterStartNteract<CR>
autocmd Filetype ipynb nnoremap <silent><localleader>ll :VimpyterStartJupyter<CR>
"}}}
"============== Python-Mode =================={{{
" Bindings {{{
let g:pymode_motion = 1
" Go to next/previous method or class
nnoremap gj :call pymode#motion#move('^\s*def\s', '')<CR>zz
nnoremap gk :call pymode#motion#move('^\s*def\s', 'b')<CR>zz
nnoremap gJ :call pymode#motion#move('^\s*class\s', '')<CR>zz
nnoremap gK :call pymode#motion#move('^\s*class\s', 'b')<CR>zz

" }}}
let g:pymode_python = 'python3'
" rope {{{
let g:pymode_rope                            = 0
let g:pymode_rope_completion                 = 0
let g:pymode_rope_complete_on_dot            = 0
let g:pymode_rope_auto_project               = 0
let g:pymode_rope_autoimport_generate        = 0
let g:pymode_rope_guess_project              = 0

let g:pymode_rope_enable_autoimport          = 0
let g:pymode_rope_organize_imports_bind = '<C-c>ro'

"}}}

" documentation
let g:pymode_doc                   = 0
let g:pymode_doc_bind              = '<leader>K'

" lints (using ALE for this)
let g:pymode_lint                  = 0

" breakpoints
let g:pymode_breakpoint            = 1
let g:pymode_breakpoint_key        = '<leader>b'

" syntax highlight {{{
let python_highlight_all                     = 1
let g:pymode_syntax                          = 1
let g:pymode_syntax_slow_sync                = 1
let g:pymode_syntax_all                      = 1

let g:pymode_syntax_print_as_function        = g:pymode_syntax_all
let g:pymode_syntax_highlight_async_await    = g:pymode_syntax_all
let g:pymode_syntax_highlight_equal_operator = g:pymode_syntax_all
let g:pymode_syntax_highlight_stars_operator = g:pymode_syntax_all
let g:pymode_syntax_highlight_self           = g:pymode_syntax_all
let g:pymode_syntax_indent_errors            = g:pymode_syntax_all
let g:pymode_syntax_string_formatting        = g:pymode_syntax_all
let g:pymode_syntax_space_errors             = g:pymode_syntax_all
let g:pymode_syntax_string_format            = g:pymode_syntax_all
let g:pymode_syntax_string_templates         = g:pymode_syntax_all
let g:pymode_syntax_doctests                 = g:pymode_syntax_all
let g:pymode_syntax_builtin_objs             = g:pymode_syntax_all
let g:pymode_syntax_builtin_types            = g:pymode_syntax_all
let g:pymode_syntax_highlight_exceptions     = g:pymode_syntax_all
let g:pymode_syntax_docstrings               = g:pymode_syntax_all
"}}}

" code folding
let g:pymode_folding=0

" pep8 indents
let g:pymode_indent=1

" code running
let g:pymode_run=0
let g:pymode_run_bind='<F5>'
let g:pymode_rope_lookup_project = 0
imap <F5> <Esc>:w<CR>:!clear;python %<CR>

" }}}

"============== Vim-netrw ===================={{{
let g:netrw_banner = 0 "no banner
let g:netrw_liststyle = 3
let g:netrw_sort_sequence = '[\/]$,*' " sort is affecting only: directories on the top, files below
noremap <leader>ex :Explore<cr>
nnoremap <leader>vv :Vexplore<cr>
nnoremap <leader>hh :Hexplore<cr>
" }}}
"============== Vimtex ======================={{{
let g:vimtex_enabled = 1

let g:latex_view_general_viewer = 'zathura'
let g:vimtex_view_method = "zathura"

let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_complete_recursive_bib = 2
let g:vimtex_complete_enabled = 1
let g:vimtex_complete_close_braces = 1
let g:vimtex_fold_enabled = 1

augroup vimtex_event_1
	au!
	au User VimtexEventQuit     call vimtex#compiler#clean(0)
augroup END

" Close viewers on quit
function! CloseViewers()
	if executable('xdotool') && exists('b:vimtex')
			\ && exists('b:vimtex.viewer') && b:vimtex.viewer.xwin_id > 0
		call system('xdotool windowclose '. b:vimtex.viewer.xwin_id)
	endif
endfunction

augroup vimtex_event_2
	au!
	au User VimtexEventQuit call CloseViewers()
augroup END

" }}}
"============== Fugitive ====================={{{
nnoremap <Leader>gst :Gstatus<CR>
nnoremap <Leader>gwr  :Gwrite<CR>
nnoremap <Leader>gcm :Gcommit<CR>
nnoremap <Leader>gcc  :Gwrite<CR>:Gcommit<CR>
nnoremap <Leader>gps :Gpush<CR>
nnoremap <Leader>gpl :Gpull<CR>

"  Clue 1.
"  * automerge diff track.
" <<<<<<< 
nnoremap <Leader>gdi  /<<<<<<<<CR>n<C-o>zz

" }}}
"============== Lightline ===================={{{
let g:lightline = {'colorscheme': 'myseoul256'} 
" let g:lightline = {'colorscheme': 'mymolokaicolor'} 
let g:lightline.inactive = {
			\	'left': [['absolutepath']],
			\ 	'middle': [['']],
			\ 	'right': [['']] }
let g:lightline.tab = {'active': ['tabnum', 'filename', 'modified'],
			\'inactive': [ 'tabnum', 'filename', 'modified' ]}
" " }}}
"============== NerdTree ====================={{{
" " open NERDTree on startup
if !exists("g:gui_oni")
	autocmd StdinReadPre * let s:std_in=1
	autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
endif
map <C-n> :NERDTreeToggle<CR>

let NERDTreeIgnore=['\.pyc$', '\.aux$', '\.out', '\.bbl$', '\.fls$', '\.blg$', '\.log$', '\.fdb_latexmk$','\.gz$']
let NERDTreeShowBookmarks = 1
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''
"
" Single-click to toggle directory nodes, double-click to open non-directory
" nodes.
let g:NERDTreeMouseMode=2
"PaleTurquoise1
" Put inside autocommand

if !exists("g:gui_oni")
	augroup NerdTreeHi
		autocmd!
		autocmd VimEnter,ColorScheme * if g:colors_name =~ 'seoul256'
			hi NERDTreeDir guifg=#90a959
			hi Directory guifg=#404040
			hi NERDTreeCWD guifg=gray90
			hi NERDTreeFile guifg=gray90
			hi NERDTreeUp guifg=gray90 guibg=gray20
			hi NERDTreeBookmarksHeader guifg=#90a959
			hi NERDTreeBookmarkName guifg=gray90 
	augroup END
endif
" }}}
"============== Indentline ==================={{{
let g:indentLine_fileTypeExclude=['help']
let g:indentLine_char = '┊'  
let g:indentLine_first_char = '┊'  " '│' This is the first indent and the above
" are for all other

" let g:indentLine_color_gui = '#242424'
" let g:indentLine_bgcolor_gui = '#000000'

" let g:indentLine_setColors = 0
" let g:indentLine_setConceal = 0
" let g:indentLine_showFirstIndentLevel=1

" }}}
"============== Vim-livedown-markdown ========{{{
" should markdown preview get shown automatically upon opening markdown buffer
let g:livedown_autorun = 0

" should the browser window pop-up upon previewing
let g:livedown_open = 1 

" the port on which Livedown server will run
let g:livedown_port = 1337

" the browser to use
let g:livedown_browser = g:BROWSER

" nnoremap <leader>gt :LivedownToggle<CR>
" nnoremap <leader>gp :LivedownPreview<CR>
"}}}
"============== Vim-surround ================{{{
nnoremap <leader>' :normal ysiW'<CR>
nnoremap <leader>" :normal ysiW"<CR>
nnoremap ( :normal ysiW)<CR>
nnoremap ) :normal ysiW)<CR>
nnoremap { :normal ysiW}<CR>
nnoremap } :normal ysiW}<CR>
nnoremap [ :normal ysiW]<CR>
nnoremap ] :normal ysiW]<CR>
" nnoremap <leader>B :normal ysiW}<CR>
" nnoremap <leader>r :normal ysiW]<CR>
"}}}
"============== GoYo ========================={{{ 
let g:goyo_width  = 100  " (default: 80)
let g:goyo_linenr = 0   " (default: 0)

" Functions Goyo and tmux
function! s:goyo_enter()
  silent !tmux set status off
  " silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  set noshowmode
  set noshowcmd
	set cursorline
endfunction

function! s:goyo_leave()
  silent !tmux set status on
  " silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  set showcmd
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" mappings
nnoremap <silent> <leader>gg :Goyo<CR>

"}}}
"============== ALE =========================={{{
let g:ale_enabled = 0

" Use quickfix list. Open list
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_open_list = 1

" Appearance
" characters might messup appearance
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '?'
let g:ale_sign_column_always = 1

" highlight ALEWarningSign guibg=303030 guifg=
" highlight ALEErrorSign guibg=303030 guifg=


let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%][%severity%] %s'

" pylint
let g:ale_linters = { 'python': ['pylint', 'yapf', 'isort', 'mccabe'],}

" Mappings
nmap ge <Plug>(ale_next_wrap)
nmap gr <Plug>(ale_previous_wrap)
nmap <leader>at <Plug>(ale_toggle)

"}}}
"============== Jedi-vim ====================={{{
let g:jedi#completions_command = ""
" let g:jedi#goto_command = "<leader><leader>d"
" let g:jedi#goto_assignments_command = "<leader><leader>g"
" let g:jedi#goto_definitions_command = ""
" let g:jedi#documentation_command = "<leader><leader>K"
" let g:jedi#usages_command = "<leader><leader>n"
" let g:jedi#rename_command = "<leader><leader>r"

"}}}
"============== Scratch ======================{{{
let g:scratch_insert_autohide = 0
let g:scratch_no_mappings = 1

" nmap gs :ScratchPreview<CR>
nmap gs <plug>(scratch-insert-reuse)
nmap gS <plug>(scratch-insert-clear)

let g:scratch_height = 10
let g:scratch_filetype = 'markdown'
" let g:scratch_persistence_file = ".scratch.md"
"}}}
"============== luochen1990/rainbow =========={{{
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle
let g:rainbow_conf = {
			\	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
			\	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
			\	'operators': '_,_',
			\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
			\	'separately': {
			\		'*': {},
			\		'tex': {
			\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
			\		},
			\		'lisp': {
			\			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
			\		},
			\		'vim': {
			\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
			\		},
			\		'html': {
			\			'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
			\		},
			\		'css': 0,
			\	}
			\}
au VimEnter * RainbowToggleOn
"}}}
"============== GitGutter ===================={{{
let g:gitgutter_sign_removed = '-'
let g:gitgutter_override_sign_column_highlight = 0

let g:gitgutter_realtime = 1
let g:gitgutter_eager = 1
"}}}
"============== highlight-yank ==============={{{
let g:highlightedyank_highlight_duration = 1000
"}}}
"============== vim-easy-align ==============={{{

" Align a markdown table -> hidden in autocommand ?
autocmd FileType markdown vmap t <Plug>(EasyAlign)*\|
autocmd FileType latex vmap t <Plug>(EasyAlign)*\&

" Start interactive EasyAlign in visual mode (e.g. vipea=, vapea", ...)
vmap ea <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. ,eaip) 
nmap <leader>ea <Plug>(EasyAlign)

"}}}
"============== vim-after-object ============={{{
autocmd VimEnter * call after_object#enable('=', ':', '-', '#', ' ', '+', '*', '{')
" ca=				change after '='
"}}}
"============== vim-peekaboo ============={{{
let g:peekaboo_window="vert bo 50new"
"}}}
"============== Gundo ========================{{{
let g:gundo_prefer_python3 = 1
nnoremap gu :GundoToggle<CR>
"}}}
"============== Matlab ========================{{{
let g:matlab_auto_mappings = 0 "automatic mappings disabled
let g:matlab_server_launcher = 'tmux' "launch the server in a tmux split
let g:matlab_server_split = 'horizontal' "launch the server in a horizontal split

"}}}
"============== vim-javascript ========================{{{
augroup javascript
    au!
    au FileType javascript setlocal foldmethod=syntax
augroup END

"}}}
"============== vim-polyglot ========================{{{
let g:polyglot_disabled = ['latex', 'markdown']
"}}}
