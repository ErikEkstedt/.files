" imports
" PyTorch
inoremap ;to import torch<CR>import torch.nn as nn<CR>import torch.optim as optim<CR>from torch.autograd import Variable<CR>import torch.nn.functional as F<Esc>o<Esc>o
inoremap ;cl class (<++>):<CR>'''<++>'''<CR>def __init__(self,<++>):<CR>super(<++>,self).__init__()<Esc>3k6hi

" main
inoremap ;ma if __name__ == '__main__':<CR>

" main
inoremap ;in input('Press Enter to continue')<CR>


" main
inoremap ;ma if __name__ == '__main__':<CR>


" indentation for python
setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal expandtab
setlocal autoindent
setlocal foldmethod=indent
setlocal nowrap
