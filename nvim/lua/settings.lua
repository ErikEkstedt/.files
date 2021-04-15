-- Settings

vim.o.foldlevelstart=99  -- 0: all fold, 99: no fold
vim.o.hidden=true
vim.o.ignorecase=true
vim.o.inccommand='nosplit'     -- show incremental changes for |:substitute|, |:smagic|, |:snomagic|. |hl-Substitute|
vim.o.mouse='a'           -- mouse functionality (default: empty)
vim.o.pb=20             -- transparency for popup, (default: 0)
vim.o.scrolloff=3       -- visual rows above and below cursor
vim.o.showmode=false        -- no extra --Insert--, --Replace-- etc
vim.o.sidescrolloff=5   -- visual columns on sides of cursor
vim.o.smartcase=true
vim.o.splitbelow=true
vim.o.splitright=true
vim.o.t_Co="256"     -- support 256 color
vim.o.termguicolors=true     -- Enable true color support.
vim.o.virtualedit='block'      -- onemore 'block' makes it possible to edit empty space in visualblock set cursorline
vim.o.wrap=false
vim.wo.number=true -- set numbered lines
vim.wo.relativenumber=false -- set relative number
vim.o.gdefault=true

-- Can't set directly ? list over possible values?
vim.cmd('set undofile')       -- Undo: keep undo persistent over buffer quits
vim.cmd('set signcolumn=yes')
vim.cmd('set foldmethod=indent')
vim.cmd('set tabstop=2')
vim.cmd('set expandtab')
vim.cmd('set shiftwidth=2')
vim.cmd('set nowrap')
