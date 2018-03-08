" PLUGIN SETTINGS
"============== Tmux-navigation =============={{{
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <Left> :TmuxNavigateLeft<cr>
nnoremap <silent> <Down> :TmuxNavigateDown<cr>
nnoremap <silent> <Up> :TmuxNavigateUp<cr>
nnoremap <silent> <Right> :TmuxNavigateRight<cr>

"}}}
"============== Slimux ======================={{{
let g:slimux_python_use_ipython = 1
nnoremap <C-c><C-c> :SlimuxREPLSendLine<CR>
vnoremap <C-c><C-c> :SlimuxREPLSendLine<CR>gv<Esc>zz
nnoremap <C-c><C-x> :SlimuxREPLConfigure<CR>
vnoremap <C-c><C-x> :SlimuxREPLConfigure<CR>
" }}}
"============== Vim-netrw ===================={{{
let g:netrw_banner = 0 "no banner
let g:netrw_liststyle = 3
let g:netrw_sort_sequence = '[\/]$,*' " sort is affecting only: directories on the top, files below
noremap <leader>ex :Explore<cr>
nnoremap <leader>vv :Vexplore<cr>
nnoremap <leader>hh :Hexplore<cr>
" }}}
"============== Calendar ====================={{{
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1

nnoremap <leader>cm :Calendar -view=month<CR>
nnoremap <leader>cw :Calendar -view=week<CR>
nnoremap <leader>cd :Calendar -view=day<CR>

" }}}
"============== Vimtex ======================={{{
let g:vimtex_enabled = 1

" let g:latex_view_general_viewer = 'general'
" let g:vimtex_view_method = "general"

let g:latex_view_general_viewer = 'zathura'
let g:vimtex_view_method = "zathura"

let g:vimtex_complete_recursive_bib = 2
let g:vimtex_complete_enabled = 1
let g:vimtex_complete_close_braces = 1
let g:vimtex_fold_enabled = 1
map <leader>ll <plug>(vimtex-compile-ss)

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
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
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
" }}}
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
"============== Indentline ==================={{{
let g:indentLine_fileTypeExclude=['help']
let g:indentLine_char = '┊'  
let g:indentLine_first_char = '┊'  " '│' This is the first indent and the above
" are for all other

let g:indentLine_setColors = 0
let g:indentLine_setConceal = 0
let g:indentLine_showFirstIndentLevel=1
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
nnoremap <leader>b :normal ysiW)<CR>
nnoremap <leader>B :normal ysiW}<CR>
nnoremap <leader>r :normal ysiW]<CR>
"}}}
"============== FZF =========================={{{
" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
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
	\ 'header':  ['fg', 'Comment'] }

" Settings
" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" Mappings
nnoremap <Leader>fi :Files ~/<CR>
nnoremap <Leader>fc :Files ~/.files<CR>
nnoremap <Leader>fl :Files<CR>
nnoremap <Leader>ff :Ag<CR>
nnoremap <Leader>fb :Buffers<CR>
nnoremap <Leader>li :Lines<CR>
nnoremap <Leader>gs :GFiles?<CR>
nnoremap <Leader>he :Helptags<CR>
nnoremap <Leader>fs :Snippets<CR>

" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit',
  \ 'ctrl-o': 'edit',
  \ 'Enter': 'vsplit',
  \ 'Esc': 'exit', }
"}}}
"============== UltiSnips ===================={{{
let g:UltiSnipsSnippetsDir = "~/.vim/bundle/vim-snippets"
let g:UltiSnipsSnippetDirectories = ["UltiSnips", "snips", "~/.files/nvim/mysnippets"]

" Trigger configuration.
let g:UltiSnipsExpandTrigger='<leader><leader>'
let g:UltiSnipsJumpForwardTrigger="<c-l>" 
let g:UltiSnipsJumpBackwardTrigger="<c-h>" 

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit='vertical'

" Use Python Version 
let g:UltiSnipsUsePythonVersion = 3
let g:ultisnips_python_style="google"

" augroup markdown 
" 	au! 
" 	au BufNewFile,BufRead *.md,*.markdown,*.mmd set filetype=markdown 
" 	au BufNewFile,BufRead *.md,*.markdown,*.mmd UltiSnipsAddFiletypes markdown 
" augroup END

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
nnoremap <leader>gg :Goyo<CR>

"}}}
"============== ALE =========================={{{
" Start of, toggle to init
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
"\   'python': ['pylint', 'pycodestyle', 'yapf', 'isort'],
let g:ale_linters = {
\   'python': ['pylint', 'yapf', 'isort', 'mccabe'],
\}

" Mappings
nmap ge <Plug>(ale_next_wrap)
nmap gr <Plug>(ale_previous_wrap)

nmap <leader>at <Plug>(ale_toggle)

"}}}
"============== Deoplete ====================={{{
" Use deoplete.
let g:deoplete#enable_at_startup = 1
let g:loaded_neopairs = 1
let g:neopairs#enable = 1
let g:deoplete#max_abbr_width = 40
let g:deoplete#max_menu_width = 40

" deoplete tab/s-tab/c-j/c-k complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr><S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr><C-j> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr><C-k> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Deoplete and vimtex
if !exists('g:deoplete#omni#input_patterns')
		let g:deoplete#omni#input_patterns = {}
endif
let g:deoplete#omni#input_patterns.tex = g:vimtex#re#deoplete

"close the preview window after completion is done.
autocmd CompleteDone * pclose!

call deoplete#custom#set('_', 'sorters', ['sorter_word'])
call deoplete#custom#set('ultisnips', 'rank', 9999)
call deoplete#custom#source('_', 'converters', ['converter_auto_paren'])


"}}}
"============== Jedi-vim ====================={{{
let g:jedi#completions_command = ""
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
"============== vim-json ====================={{{
" trick to format json
"  :%!python -m json.tool  
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
" Start interactive EasyAlign in visual mode (e.g. vipga=, vapga", ...)
vmap ga <Plug>(EasyAlign)

" Align a markdown table -> hidden in autocommand ?
vmap t <Plug>(EasyAlign)*\|

" Start interactive EasyAlign for a motion/text object (e.g. gaip) 
nmap <leader>ga <Plug>(EasyAlign)

"}}}
"============== vim-after-object ============={{{
autocmd VimEnter * call after_object#enable('=', ':', '-', '#', ' ', '+', '*', '{')
" ca=				change after '='
"}}}
"============== easy-motion =================={{{
let g:EasyMotion_keys = 'abcdefghijklmnopqrstuvwxyz'
map <l <Plug>(easymotion-lineforward)
map <j <Plug>(easymotion-j)
map <k <Plug>(easymotion-k)
map <h <Plug>(easymotion-linebackward)
nmap <space> <Plug>(easymotion-bd-w)

map <f <Plug>(easymotion-bd-f)
nmap <s <Plug>(easymotion-overwin-f)

let g:EasyMotion_startofline = 1 " Linejumps puts cursor at start of line

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
"============== Language Server Protocol ========================{{{
" let g:LanguageClient_serverCommands = {
"     \ 'python': ['pyls'],
"     \ 'javascript': ['javascript-typescript-stdio'],
"     \ 'javascript.jsx': ['javascript-typescript-stdio'],
" 	\ }
" nnoremap <leader><leader>K :call LanguageClient_textDocument_hover()<CR>
" nnoremap <leader><leader>gd :call LanguageClient_textDocument_definition()<CR>
" nnoremap <leader><leader><F2> :call LanguageClient_textDocument_rename()<CR>

"}}}
