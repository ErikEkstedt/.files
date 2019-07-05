""".bib
inoremap ;a @article{<CR><Tab>author<Space>=<Space>"<++>",<CR>year<Space>=<Space>"<++>",<CR>title<Space>=<Space>"<++>",<CR>journal<Space>=<Space>"<++>",<CR>volume<Space>=<Space>"<++>",<CR>pages<Space>=<Space>"<++>",<CR>}<CR><++><Esc>8kA,<CR>url<Space>=<Space>{<++>},<Esc>i

inoremap ;b @book{<Enter><Tab>author<Space>=<Space>"<++>",<Enter>year<Space>=<Space>"<++>",<Enter>title<Space>=<Space>"<++>",<Enter>publisher<Space>=<Space>"<++>",<Enter>}<Enter><++><Esc>6kA,<Esc>i

inoremap ;c @incollection{<CR>author<Space>=<Space>"<++>",<CR>title<Space>=<Space>"<++>",<CR>booktitle<Space>=<Space>"<++>",<CR>editor<Space>=<Space>"<++>",<CR>year<Space>=<Space>"<++>",<CR>publisher<Space>=<Space>"<++>",<CR>}<CR><++><Esc>8kA,<Esc>i
