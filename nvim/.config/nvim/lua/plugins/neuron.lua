local neuronDir = "~/zettelkasten"

local telescope = require("telescope")

local function open_obsidian()
  require("plenary/job"):new {
    command = "Obsidian",
    cwd = neuronDir
  }:start()
end

-- Create a new zettelkasten/neuron file with a custom filename
local function neuronNewCustom()
  print("HELLO")
  local buf = vim.api.nvim_create_buf(false, true) -- create new emtpy buffer
  vim.api.nvim_buf_set_option(buf, "bufhidden", "wipe")
  vim.api.nvim_buf_set_lines(buf, 0, 1, false, {"Filename:"})

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
  local win = vim.api.nvim_open_win(buf, true, opts)

  function copy_and_exit()
    local filename = vim.api.nvim_get_current_line()
    if string.match(filename .. "$", ".md") then
      filename = string.gsub(filename, ".md", "")
    end
    print("Filename: ", filename)
    vim.api.nvim_win_close(win, true)

    -- Create the neuron with the provided filename
    require("plenary/job"):new {
      command = "neuron",
      args = {"new", filename},
      cwd = neuronDir,
      on_stdout = vim.schedule_wrap(
        function(error, data)
          assert(not error, error)
          vim.cmd("edit " .. data)
          vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("Go<CR>#<space>", true, true, true), "n", true)
        end
      )
    }:start()
  end
  -- vim.api.nvim_buf_set_keymap(0, "i", "<esc>", '<esc>:close<cr>', {})
  vim.api.nvim_buf_set_keymap(0, "i", "<CR>", "<esc><cmd>lua copy_and_exit()<CR>", {})
  vim.api.nvim_feedkeys("o", "n", false)
end

-- MAPPINGS
-- See repo: https://github.com/oberblastmeister/neuron.nvim
-- " find the backlinks of the current note all the note that link this note
local no = {noremap = true, silent = true}
local keymap = vim.keymap.set
local buf_keymap = vim.api.nvim_buf_set_keymap

buf_keymap(0, "n", "gzb", "<cmd>lua require'neuron/telescope'.find_backlinks()<CR>", no)
-- " create a new note
-- keymap("n", "gzz", "<cmd>lua require('telescope.builtin').find_files{cwd='~/zettelkasten'}<cr>", no)
keymap("n", "gzN", string.format("<cmd>lua require'neuron/cmd'.new_edit( '%s' )<CR>", neuronDir), no)
-- " insert the id of the note that is found
keymap("n", "gzl", "<cmd>lua require'neuron/telescope'.find_zettels {insert = true}<CR>", no)
-- Server/GUI: start the neuron server and render markdown, auto reload on save
keymap("n", "gzs", "<cmd>lua require'neuron'.rib {address = '127.0.0.1:8200', verbose = true}<CR>", no)

-- Custom
-- New note
-- keymap("n", "gzn", "<cmd>lua require('plugins.neuron').neuronNewCustom()<CR>", {noremap = true})
keymap("n", "gzn", neuronNewCustom, no)
-- Start Obsidian from inside neovim
keymap("n", "gzo", open_obsidian, no)

-- click enter on [[my_link]] or [[[my_link]]] to enter it
-- vim.api.nvim_set_keymap("n", "<CR>", '<cmd>lua require"neuron".enter_link()<CR>', {noremap = true, silent = true})
-- " find your notes, click enter to create the note if there are not notes that match
-- vim.api.nvim_set_keymap(
--   "n",
--   "gzz",
--   '<cmd>lua require"neuron/telescope".find_zettels()<CR>',
--   {noremap = true, silent = true}
-- )
--
-- return M

return {
  "oberblastmeister/neuron.nvim",
  config = function()
    -- these are all the default values
    require("neuron").setup {
      virtual_titles = true,
      mappings = false,
      run = nil, -- function to run when in neuron dir
      neuron_dir = neuronDir, -- the directory of all of your notes, expanded by default (currently supports only one directory for notes, find a way to detect neuron.dhall to use any directory)
      leader = "gz" -- the leader key to for all mappings, remember with 'go zettel'
    }
  end
}
