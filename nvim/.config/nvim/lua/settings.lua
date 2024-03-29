-- Settings

-- new option settings: https://github.com/neovim/neovim/pull/13479
vim.opt.expandtab = true
vim.opt.fileignorecase = true

---------------------------------------------------------
-- FOLDS
---------------------------------------------------------
-- If/when treesitter folding works well this should be
-- in another file i.e. lua/folds.lua
-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
-- function _G.custom_fold_text()
--   local line_count = vim.v.foldend - vim.v.foldstart + 1
--   local line = vim.fn.getline(vim.v.foldstart)
--   line = string.gsub(line, "^ +", " ")
--   return "-> " .. line .. ":" .. line_count .. " lines"
-- end
-- vim.opt.foldtext = "v:lua.custom_fold_text()"
vim.o.foldtext =
[[substitute(getline(v:foldstart),'\\t',repeat('\ ',&tabstop),'g').'...'.trim(getline(v:foldend)) . ' (' . (v:foldend - v:foldstart + 1) . ' lines)']]
-- vim.o.foldcolumn = "1"
vim.o.foldlevelstart = 99 -- 0: all fold, 99: no fold
vim.o.foldmethod = "indent"
vim.o.foldenable = true

vim.opt.pb = 0 -- transparency for popup, (default: 0)
vim.opt.cursorline = true

vim.opt.gdefault = true
vim.opt.hidden = true
vim.opt.ignorecase = true
vim.opt.inccommand = "nosplit" -- show incremental changes for |:substitute|, |:smagic|, |:snomagic|. |hl-Substitute|
vim.opt.mouse = "a" -- mouse functionality (default: empty)
vim.opt.scrolloff = 8 -- visual rows above and below cursor
vim.opt.showmode = false -- no extra --Insert--, --Replace-- etc
vim.opt.sidescrolloff = 5 -- visual columns on sides of cursor
vim.opt.signcolumn = "yes"
vim.opt.smartcase = true
vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

-- undotree
vim.opt.undofile = true -- Undo: keep undo persistent over buffer quits
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
-- vim.opt.swapfile = false -- Undo: keep undo persistent over buffer quits
-- vim.opt.backup = false

vim.opt.wrap = false
vim.opt.number = true -- set numbered lines
vim.opt.relativenumber = true -- set relative number

vim.opt.termguicolors = true -- Enable true color support.
vim.go.t_Co = "256" -- support 256 color

vim.opt.timeoutlen = 300
vim.opt.updatetime = 100
vim.opt.virtualedit = "block" -- onemore 'block' makes it possible to edit empty space in visualblock set cursorline
vim.o.sessionoptions = "buffers,help,tabpages,winsize,winpos,terminal"

-- Automatically resize when vim changes
vim.api.nvim_create_autocmd("VimResized", { command = [[exe "normal! \<c-w>="]] })

-- Highlight text when yank. Built in lua.
-- vim.cmd([[au! TextYankPost * silent! lua vim.highlight.on_yank {higroup="DiffAdd", timeout=500}]])
vim.api.nvim_create_autocmd(
  "TextYankPost",
  {
    command = [[silent! lua vim.highlight.on_yank {higroup="DiffAdd", timeout=500}]]
  }
)

-- Remember line on exit/start. :he last-jump-position
vim.api.nvim_create_autocmd(
  "BufReadPost",
  { command = [[if line("'\"") > 0 && line ("'\"") <= line("$") | exe "normal! g'\"zz" | endif ]] }
)

--global statusline
vim.api.nvim_create_autocmd("VimEnter", { command = [[set laststatus=3]], once = true })
vim.opt.fillchars = {
  horiz = "━",
  horizup = "┻",
  horizdown = "┳",
  vert = "┃",
  vertleft = "┫",
  vertright = "┣",
  verthoriz = "╋"
}

-- vim.opt.laststatus = 3
-- Shortmess
vim.opt.shortmess:append("m") -- Shortmess: help 'shortmess'. Vim default "filnxtToOF"
vim.opt.shortmess:append("x")
vim.opt.shortmess:append("c")

-- 'Sync' files between instances and ignore swap
-- https://youtu.be/fm33-Pas7vI?t=193
-- autocmd on focus, checktime, autoread
-- vim.cmd('set shortmess+=A')   -- ignoire annoying swapfile messages.
vim.opt.shortmess:append("A")
vim.o.autoread = true

vim.cmd([[au FocusGained * silent! checktime]])
