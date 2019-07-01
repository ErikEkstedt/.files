" vim-easy-motion
let g:EasyMotion_keys = 'abcdefghijklmnopqrstuvwxyz'
let g:EasyMotion_startofline = 1 " Linejumps puts cursor at start of line

" Mappings
" nmap <space><space> <Plug>(easymotion-bd-w)
nmap <space>a <Plug>(easymotion-bd-w)
nmap <space>e <Plug>(easymotion-bd-e)

nmap <space>l <Plug>(easymotion-lineforward)
nmap <space>h <Plug>(easymotion-linebackward)
nmap <space>j <Plug>(easymotion-j)
nmap <space>k <Plug>(easymotion-k)

nmap <space>f <Plug>(easymotion-overwin-f)

nmap <space>w <Plug>(easymotion-bd-wl)
nmap <space>i <Plug>(easymotion-bd-jk)

