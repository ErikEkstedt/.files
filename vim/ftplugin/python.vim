" imports
" PyTorch
inoremap ;to import torch<CR>import torch.nn as nn<CR>import torch.optim as optim<CR>from torch.autograd import Variable<CR>import torch.nn.functional as F<Esc>o<Esc>o

" Keras
inoremap ;ke import keras<CR>import keras.backend as K<CR>import keras.layers as L<CR><Esc>o

" Chainer
inoremap ;chainer import chainer<CR>from chainer import cuda, Function, gradient_check, report, training, utils, Variable<CR>from chainer import datasets, iterators, optimizers, serializers<CR>from chainer import Link, Chain, ChainList<CR>import chainer.functions as F<CR>import chainer.links as L<CR>from chainer.training import extensions<CR><CR>

"Regular
inoremap ;nu import numpy as np<CR>import matplotlib.pyplot as plt<CR>

"--------------------------------------------------------------------------------------
"Def
inoremap ;def def (<++>):<CR><++><Esc>k0f(i

" Class
inoremap ;cl class (<++>):<CR>'''<++>'''<CR>def __init__(self,<++>):<CR>super(<++>,self).__init__()<Esc>3k6hi
" typing
inoremap ;pr print()<CR><++><Esc>k3li
" main
inoremap ;main if __name__ == '__main__':<CR>

" indentation for python
setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal expandtab
setlocal autoindent


