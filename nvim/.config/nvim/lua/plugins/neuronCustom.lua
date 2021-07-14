local Job = require("plenary/job")
local buf, win

local M = {}

-- Create a new zettelkasten/neuron file with a custom filename
function M.neuron_new()
  buf = vim.api.nvim_create_buf(false, true) -- create new emtpy buffer
  vim.api.nvim_buf_set_option(buf, 'bufhidden', 'wipe')
  vim.api.nvim_buf_set_lines(buf, 0, 1, false, {'Filename:'})

  -- get dimensions
  local width = vim.api.nvim_get_option("columns")
  local height = vim.api.nvim_get_option("lines")

  -- calculate our floating window size
  local win_height = 2
  local win_width = math.ceil(width * 0.8)

  -- and its starting position
  local row = math.ceil((height - win_height) / 2 - 1)
  local col = math.ceil((width - win_width) / 2)

  -- set some options
  local opts = {
    style = "minimal",
    border = "single",
    relative = "editor",
    width = win_width,
    height = win_height,
    row = row,
    col = col,
    noautocmd = true
  }

  -- and finally create it with buffer attached
  win = vim.api.nvim_open_win(buf, true, opts)

  function copy_and_exit()
    local filename = vim.api.nvim_get_current_line()
    if string.match(filename .. "$", ".md") then
      filename = string.gsub(filename, '.md', '')
    end
    print('Filename: ', filename)
    vim.api.nvim_win_close(win, true)

    -- Create the neuron with the provided filename
    Job:new {
      command = "neuron",
      args = {"new", filename},
      cwd = neuronDir,
      on_stdout = vim.schedule_wrap(function(error, data)
        assert(not error, error)
        vim.cmd("edit " .. data)
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("Go<CR>#<space>", true, true, true), "n", true)
      end),
    }:start()
  end
  -- vim.api.nvim_buf_set_keymap(0, "i", "<esc>", '<esc>:close<cr>', {})
  vim.api.nvim_buf_set_keymap(0, "i", "<CR>", '<esc><cmd>lua copy_and_exit()<CR>', {})
  vim.api.nvim_feedkeys("o", "n", false)
end

return M
