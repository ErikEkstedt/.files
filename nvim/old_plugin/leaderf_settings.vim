finish
" popup mode
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_ShowHidden= 1

let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "DejaVu Sans Mono for Powerline" }

let g:Lf_WildIgnore = {
        \ 'dir': ['.svn','.git','.hg'],
        \ 'file': ['*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.py[co]']
        \}

let g:Lf_PreviewResult = {
        \ 'File': 1,
        \ 'Buffer': 1,
        \ 'Mru': 0,
        \ 'Tag': 0,
        \ 'BufTag': 1,
        \ 'Function': 1,
        \ 'Line': 0,
        \ 'Colorscheme': 0,
        \ 'Rg': 0,
        \ 'Gtags': 0
        \}

" let g:Lf_ShortcutF = "<leader>ff"
noremap <leader>ff :LeaderfFile<CR>
noremap <leader>fc :LeaderfFile ~/.files<CR>
noremap <leader>fi :LeaderfFile ~/<CR>
noremap <leader>ft :LeaderfFile ~/TurnTaking/turntaking<CR>
noremap <leader>fh :LeaderfHelp<CR>
noremap <leader>fu :LeaderfFunction<CR>

" noremap <leader>fb :LeaderfBuffer<CR>
" noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
" noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
" noremap <leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
" noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>


let g:Lf_CommandMap = {
      \'<C-K>': ['<C-P>'],
      \'<C-J>': ['<C-N>'],
      \'<C-]>': ['<C-L>'],
      \'<C-X>': ['<C-J>'],
      \'<C-P>': ['<C-C>']
      \}

let g:Lf_NormalMap = {"File":   [["<ESC>", '<Tab>']]}
