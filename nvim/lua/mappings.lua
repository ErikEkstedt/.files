-- MAPPINGS
-- mapleader/localleader is set in init.lua
local function t(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

function _G.smart_tab()
    return vim.fn.pumvisible() == 1 and t'<C-n>' or t'<Tab>'
end
function _G.smart_tab2()
    return vim.fn.pumvisible() == 1 and t'<C-p>' or t'<S-Tab>'
end

-- test leader mapping
vim.api.nvim_set_keymap('n', '<Leader>t', ':echo "testMapping"<CR>', {noremap=true})

-- NORMAL
vim.api.nvim_set_keymap('n', 'vv', 'V', {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', 'V', 'v$', {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', 'Y', 'y$', {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<localleader>pa', '"+p', {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<C-y>', '"+yy', {noremap=true, silent=true})

-- Sane wrap movement
vim.api.nvim_set_keymap('n', 'j', 'gj', {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', 'k', 'gk', {noremap=true, silent=true})

-- Jumplist fix (wincent)
-- Store relative line number jumps in the jumplist if they exceed a threshold.
vim.cmd([[
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : '') . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : '') . 'j'
]])

-- save/quit
vim.api.nvim_set_keymap('n', '<C-s>', ':w<CR>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<C-q>', ':q!<CR>', {noremap=true, silent=true})

-- Move end/start of line
vim.api.nvim_set_keymap('n', 'L', '$', {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', 'H', '^', {noremap=true, silent=true})

-- Buffer movement
vim.api.nvim_set_keymap('n', '<Leader>b', ':bp<CR>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<Leader>n', ':bn<CR>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<Leader>B', ':bf<CR>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<Leader>N', ':bl<CR>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<Leader><Leader>', ':b#<CR>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<Leader>d', ':bd<CR>', {noremap=true, silent=true})

-- Resize
vim.api.nvim_set_keymap('n', '<C-Left>', ':vertical resize -3<CR>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<C-Right>', ':vertical resize +3<CR>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<C-Down>', ':resize +3<CR>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<C-Up>', ':resize -3<CR>', {noremap=true, silent=true})

-- Jumplist focus
vim.api.nvim_set_keymap('n', '<C-o>', '<C-o>zz', {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<C-i>', '<C-i>zz', {noremap=true, silent=true})

-- Goto next under cursor
vim.api.nvim_set_keymap('n', 'gn', '*zvzz', {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', 'gN', '#zvzz', {noremap=true, silent=true})

-- */# stays on current word
vim.api.nvim_set_keymap('n', '*', '*<C-o>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '#', '#<C-o>', {noremap=true, silent=true})

-- Toggle highlight
vim.api.nvim_set_keymap('n', '<Leader>ss', ':set hlsearch!<CR>', {noremap=true, silent=true})

-- split lines at ',', ';', ' '
vim.api.nvim_set_keymap('n', 'gl', 'f, a<CR><esc>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', 'gL', 'f;a<CR><esc>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', 'g<space>', 'f<space>a<CR><esc>', {noremap=true, silent=true})

-- Folds
vim.api.nvim_set_keymap('n', 'ga', 'zA', {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<Leader>f', 'zazz', {noremap=true, silent=true})

-- INSERT
-- TODO: fix these
-- vim.cmd([[inoremap <expr><Tab> pumvisible() ? "\<C-N>" : "\<Tab>"]])
vim.api.nvim_set_keymap('i', '<Tab>', 'v:lua.smart_tab()', {expr = true, noremap = true})
vim.api.nvim_set_keymap('i', '<S-Tab>', 'v:lua.smart_tab2()', {expr = true, noremap = true})

-- Visual
vim.api.nvim_set_keymap('v', '<Leader>sl', 'y:@"<CR>', {noremap=true})
vim.api.nvim_set_keymap('v', '<LocalLeader>sl', 'y:@"<CR>', {noremap=true})

-- Selection
vim.api.nvim_set_keymap('x', 'L', '$', {noremap=true})
vim.api.nvim_set_keymap('x', 'H', '^', {noremap=true})
vim.api.nvim_set_keymap('x', 'K', '{', {noremap=true})
vim.api.nvim_set_keymap('x', 'H', '}', {noremap=true})

-- Command
vim.api.nvim_set_keymap('c', '<C-a>', '<Home>', {noremap=true})
