-- MAPPINGS
local keymap = vim.api.nvim_set_keymap
local nosil = {noremap = true, silent = true}
local no = {noremap = true}

-- mapleader/localleader is set in init.lua

-- TAB
keymap("v", "<Tab>", ">gv", nosil)
keymap("v", "<S-Tab>", "<gv", nosil)
-- keymap("n", "<Tab>", "v>gv<esc>", nosil)
-- keymap("n", "<S-Tab>", "v<gv<esc>", nosil)
keymap("i", "<S-Tab>", "<esc><<I", nosil)

-- NORMAL
keymap("n", "vv", "V", nosil)
keymap("n", "V", "v$", nosil)
keymap("n", "<localleader>pa", '"+p', nosil)
keymap("n", "<C-y>", "<cmd>lua require('utils').yank_current_line()<cr>", nosil)
keymap("x", "<C-y>", "<cmd>lua require('utils').yank_current_line()<cr>", nosil)

-- Sane wrap movement
keymap("n", "j", "gj", nosil)
keymap("n", "k", "gk", nosil)

-- Jumplist fix (wincent)
-- Store relative line number jumps in the jumplist if they exceed a threshold.
vim.cmd(
  [[
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : '') . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : '') . 'j'
]]
)

-- save/quit
keymap("n", "<C-s>", ":w<CR>", nosil)
keymap("n", "<C-q>", ":q!<CR>", nosil)
keymap("n", "<M-q>", ":qa!<CR>", nosil)

-- Move between splits
-- see lua/plugins/tmux.lua
keymap("n", "<M-h>", "<cmd>lua require('tmux').move_left()<CR>", nosil)
keymap("n", "<M-j>", "<cmd>lua require('tmux').move_down()<CR>", nosil)
keymap("n", "<M-k>", "<cmd>lua require('tmux').move_up()<CR>", nosil)
keymap("n", "<M-l>", "<cmd>lua require('tmux').move_right()<CR>", nosil)

-- Move end/start of line
keymap("n", "L", "$", nosil)
keymap("n", "H", "^", nosil)

-- Buffer movement
keymap("n", "<Leader>b", ":bp<CR>", nosil)
keymap("n", "<Leader>n", ":bn<CR>", nosil)
keymap("n", "<Leader>B", ":bf<CR>", nosil)
keymap("n", "<Leader>N", ":bl<CR>", nosil)
keymap("n", "<Leader><Leader>", ":b#<CR>", nosil)
keymap("n", "<Leader>D", ":bd<CR>", nosil)

-- Resize
keymap("n", "<C-Left>", ":vertical resize -3<CR>", nosil)
keymap("n", "<C-Right>", ":vertical resize +3<CR>", nosil)
keymap("n", "<C-Down>", ":resize +3<CR>", nosil)
keymap("n", "<C-Up>", ":resize -3<CR>", nosil)

-- Jumplist focus
-- keymap("n", "<C-o>", "<C-o>zz", nosil)
-- keymap("n", "<C-i>", "<C-i>zz", nosil)

-- Goto next under cursor
keymap("n", "gn", "*zvzz", nosil)
keymap("n", "gN", "#zvzz", nosil)

-- */# stays on current word
keymap("n", "*", "*<C-o>", nosil)
keymap("n", "#", "#<C-o>", nosil)

-- Toggle highlight
keymap("n", "<Leader>ss", ":set hlsearch!<CR>", nosil)

-- split lines at ',', ';', ' '
keymap("n", "gl", "f, a<CR><esc>", nosil)
keymap("n", "gL", "f;a<CR><esc>", nosil)
keymap("n", "g<space>", "f<space>a<CR><esc>", nosil)

-- Folds
keymap("n", "ga", "zA", nosil)
-- keymap("n", "<Leader>f", "zazz", nosil)

-- INSERT

-- Visual
keymap("v", "<Leader>sl", 'y:@"<CR>', no)
keymap("v", "<LocalLeader>sl", 'y:@"<CR>', no)
keymap("v", "J", "}", no)
keymap("v", "K", "{", no)

-- Selection
keymap("x", "L", "$", no)
keymap("x", "H", "^", no)
keymap("x", "J", "}", no)
keymap("x", "K", "{", no)

-- Command
keymap("c", "<C-a>", "<Home>", no)
