-- MAPPINGS
local map = vim.keymap.set
local ns = { noremap = true, silent = true }
local no = { noremap = true }

-- mapleader/localleader is set in init.lua

-- TAB
map("v", "<Tab>", ">gv", ns)
map("v", "<S-Tab>", "<gv", ns)
-- keymap("n", "<Tab>", "v>gv<esc>", nosil)
-- keymap("n", "<S-Tab>", "v<gv<esc>", nosil)
map("i", "<S-Tab>", "<esc><<I", ns)

-- NORMAL
map("n", "vv", "V", ns)
map("n", "V", "v$", ns)
map("n", "<localleader>pa", '"+p', ns)
map("n", "<C-y>", "<cmd>lua require('utils').yank_current_line()<cr>", ns)
map("x", "<C-y>", "<cmd>lua require('utils').yank_current_line()<cr>", ns)

-- Sane wrap movement
-- map("n", "j", "gj", ns)
-- map("n", "k", "gk", ns)

-- when combining lines "J" the cursor stays at position (instead of going to end of line)
map("n", "J", "mzJ`z", ns)

-- Jumplist fix (wincent)
map("n", "k", [[(v:count > 5 ? "m'" . v:count : '') . 'k']], { expr = true, noremap = true, silent = true })
map("n", "j", [[(v:count > 5 ? "m'" . v:count : '') . 'j']], { expr = true, noremap = true, silent = true })

-- save/quit
map("n", "<C-s>", ":w<CR>", ns)
map("n", "<C-q>", ":q!<CR>", ns)
map("n", "<M-q>", ":qa!<CR>", ns)

-- Move between splits
-- see lua/plugins/tmux.lua
map("n", "<M-h>", "<cmd>lua require('custom.tmux').move_left()<CR>", ns)
map("n", "<M-j>", "<cmd>lua require('custom.tmux').move_down()<CR>", ns)
map("n", "<M-k>", "<cmd>lua require('custom.tmux').move_up()<CR>", ns)
map("n", "<M-l>", "<cmd>lua require('custom.tmux').move_right()<CR>", ns)

-- Move end/start of line
map("n", "L", "$", ns)
map("n", "H", "^", ns)

-- Buffer movement
map("n", "<Leader>b", ":bp<CR>", ns)
map("n", "<Leader>n", ":bn<CR>", ns)
map("n", "<Leader>B", ":bf<CR>", ns)
map("n", "<Leader>N", ":bl<CR>", ns)
map("n", "<Leader><Leader>", ":b#<CR>", ns)
map("n", "<Leader>D", ":bd<CR>", ns)

-- Resize
map("n", "<C-Left>", ":vertical resize -3<CR>", ns)
map("n", "<C-Right>", ":vertical resize +3<CR>", ns)
map("n", "<C-Down>", ":resize +3<CR>", ns)
map("n", "<C-Up>", ":resize -3<CR>", ns)

-- Jumplist focus
-- keymap("n", "<C-o>", "<C-o>zz", nosil)
-- keymap("n", "<C-i>", "<C-i>zz", nosil)
map("n", "<C-d>", "<C-d>zz", ns)
map("n", "<C-u>", "<C-u>zz", ns)

-- Goto next under cursor
map("n", "gn", "*zvzz", ns)
map("n", "gN", "#zvzz", ns)

-- */# stays on current word
map("n", "*", "*<C-o>", ns)
map("n", "#", "#<C-o>", ns)

-- split lines at ',', ';', ' '
map("n", "gl", "f, a<CR><esc>", ns)
map("n", "gL", "f;a<CR><esc>", ns)
map("n", "g<space>", "f<space>a<CR><esc>", ns)

-- Folds
map("n", "ga", "zA", ns)
-- keymap("n", "<Leader>f", "zazz", nosil)

-- INSERT

-- Visual
map("v", "<Leader>sl", 'y:@"<CR>', no)
map("v", "<LocalLeader>sl", 'y:@"<CR>', no)
map("v", "J", "}", no)
map("v", "K", "{", no)

-- Selection
map("x", "L", "$", no)
map("x", "H", "^", no)
map("x", "J", "}", no)
map("x", "K", "{", no)

-- Command
map("c", "<C-a>", "<Home>", no)

-- Zoom
map("n", "<Space>z", "<cmd>lua require('custom.zoom').maximize_current_split()<CR>", ns)
