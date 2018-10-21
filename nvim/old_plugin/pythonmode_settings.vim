" Python-Mode

if exists("g:pymode")
	let g:pymode_python = 'python3'

	" code running
	let g:pymode_run=0
	let g:pymode_run_bind='<F5>'
	let g:pymode_rope_lookup_project = 0

	" documentation
	let g:pymode_doc                   = 0
	let g:pymode_doc_bind              = '<leader>K'

	" lints (using ALE for this)
	let g:pymode_lint                  = 0

	" breakpoints
	let g:pymode_breakpoint            = 1
	let g:pymode_breakpoint_key        = '<leader>bp'

	" Bindings {{{
	let g:pymode_motion = 1

	" Go to next/previous method or class
	nnoremap gj :call pymode#motion#move('^\s*def\s', '')<CR>zz
	nnoremap gk :call pymode#motion#move('^\s*def\s', 'b')<CR>zz

	imap <F5> <Esc>:w<CR>:!clear;python %<CR>

	" }}}

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

	" syntax/indent/folds {{{

	" code folding
	let g:pymode_folding = 1

	" pep8 indents
	let g:pymode_indent=1

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

endif
