" Scratch

let g:scratch_insert_autohide = 0
let g:scratch_no_mappings = 1
let g:scratch_height = 10
let g:scratch_filetype = 'markdown'

" let g:scratch_persistence_file = ".scratch.md"

" nmap gs :ScratchPreview<CR>
nmap gs <plug>(scratch-insert-reuse)
nmap gS <plug>(scratch-insert-clear)

