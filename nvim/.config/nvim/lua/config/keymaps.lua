-- Tmux Movement
-- Moving from Tmuxinator vimscript
-- https://github.com/christoomey/vim-tmux-navigator
-- to -->
-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
-- SOURCE: https://github.com/nathom/tmux.nvim
-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

local M = {}

function Move(direction)
  -- Try to move to vim split
  local win_num_before = vim.fn.winnr()
  vim.cmd([[execute "wincmd ]] .. direction .. [["]])
  if vim.fn.winnr() == win_num_before then
    -- If the command did nothing, that means the current split
    -- is at the edge and we need to select the tmux pane
    MoveTmux(direction)
  end
end

function MoveTmux(direction)
  -- tmux selecttmux_move pane
  -- Convert from vim movement keys to Up, Left ... for tmux
  local tmux_map = { h = "L", j = "D", k = "U", l = "R" }
  local tmux_direction = tmux_map[direction]
  vim.cmd([[silent exec "!tmux selectp -]] .. tmux_direction .. [["]])
end

function M.move_left()
  Move("h")
end

function M.move_down()
  Move("j")
end

function M.move_right()
  Move("l")
end

function M.move_up()
  Move("k")
end

function M.zoom()
  local cur_win = vim.api.nvim_get_current_win()
  vim.api.nvim_set_var("non_float_total", 0)
  vim.cmd("windo if &buftype != 'nofile' | let g:non_float_total += 1 | endif")
  vim.api.nvim_set_current_win(cur_win)
  if vim.api.nvim_get_var("non_float_total") == 1 then
    if vim.fn.tabpagenr("$") == 1 then
      return
    end
    local last_cursor = vim.api.nvim_win_get_cursor(0)
    local cur_buf = vim.api.nvim_get_current_buf()
    vim.cmd("tabclose")
    if vim.api.nvim_get_current_buf() == cur_buf then
      vim.api.nvim_win_set_cursor(0, last_cursor)
    end
  else
    local last_cursor = vim.api.nvim_win_get_cursor(0)
    vim.cmd("tabedit %:p")
    vim.api.nvim_win_set_cursor(0, last_cursor)
  end
end

local ns = { silent = true }

-- Tmux movement
vim.keymap.set("n", "<C-w>z", M.zoom, ns)
vim.keymap.set("n", "<M-h>", M.move_left, ns)
vim.keymap.set("n", "<M-j>", M.move_down, ns)
vim.keymap.set("n", "<M-k>", M.move_up, ns)
vim.keymap.set("n", "<M-l>", M.move_right, ns)

-- Resize

-- Resize
vim.keymap.set("n", "<C-Left>", ":vertical resize -3<CR>", ns)
vim.keymap.set("n", "<C-Right>", ":vertical resize +3<CR>", ns)
vim.keymap.set("n", "<C-Down>", ":resize +3<CR>", ns)
vim.keymap.set("n", "<C-Up>", ":resize -3<CR>", ns)

-- General
vim.keymap.set("n", "<C-s>", "<cmd>w<CR>", ns)
vim.keymap.set("n", "<C-q>", "<cmd>q<CR>", ns)
vim.keymap.set("n", "<M-q>", "<cmd>qa!<CR>", ns)
vim.keymap.set("n", "ga", "zA", ns)
vim.keymap.set({ "n", "x" }, "<C-Y>", function()
  vim.api.nvim_command('normal! "+yy')
end, ns)
vim.keymap.set("n", "<leader>wr", ":set nowrap!<CR>", ns)

-- Move end/start of line
vim.keymap.set("n", "L", "$", ns)
vim.keymap.set("n", "H", "^", ns)
vim.keymap.set("x", "L", "$", ns)
vim.keymap.set("x", "H", "^", ns)
vim.keymap.set("x", "J", "}", ns)
vim.keymap.set("x", "K", "{", ns)

-- Goto next under cursor
vim.keymap.set("n", "gn", "*zvzz", ns)
vim.keymap.set("n", "gN", "#zvzz", ns)

-- */# stays on current word
vim.keymap.set("n", "*", "*<C-o>", ns)
vim.keymap.set("n", "#", "#<C-o>", ns)

-- TODO: macro?
-- split lines
vim.keymap.set("n", "gl", "f, a<CR><esc>", ns)

-- Buffers
vim.keymap.set("n", "<Leader><Leader>", ":b#<CR>", ns)
vim.keymap.set("n", "<Leader>D", ":bd<CR>", ns)
vim.keymap.set("n", "<Leader>b", ":bp<CR>", ns)
vim.keymap.set("n", "<Leader>B", ":bf<CR>", ns)
vim.keymap.set("n", "<Leader>p", ":bp<CR>", ns)
vim.keymap.set("n", "<Leader>P", ":bf<CR>", ns)
vim.keymap.set("n", "<Leader>n", ":bn<CR>", ns)
vim.keymap.set("n", "<Leader>N", ":bl<CR>", ns)

-- Fold
vim.keymap.set("n", "<Leader>z", "za", ns)

-- TAB
vim.keymap.set("v", "<Tab>", ">gv", ns)
vim.keymap.set("v", "<S-Tab>", "<gv", ns)
vim.keymap.set("i", "<S-Tab>", "<esc><<I", ns)
