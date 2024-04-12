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

return M
