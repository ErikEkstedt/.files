local actions = require("telescope.actions")

local mappings = {
  -- To disable a keymap, put [map] = false
  i = {
    ["<c-x>"] = false,
    ["<c-v>"] = false,
    ["<c-l>"] = actions.select_vertical,
    ["<c-j>"] = actions.select_horizontal
  },
  n = {
    ["<c-x>"] = false,
    ["<c-v>"] = false,
    ["<c-l>"] = actions.select_vertical,
    ["<c-j>"] = actions.select_horizontal
  }
}

local file_ignore_patterns = {
  "node_modules/",
  ".git",
  "%.pt",
  "%.npy",
  "%.chpt",
  "%.ckpt",
  "%.pdf",
  "%.zip",
  "%out.tfevents",
  "%.png",
  "%.jpeg",
  "%.mp3",
  "%.wav",
  "%.flac",
  "%.sph"
}

require("telescope").setup {
  defaults = {
    mappings = mappings,
    file_ignore_patterns = file_ignore_patterns,
    prompt_prefix = ">",
    selection_strategy = "reset",
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    layout_config = {
      height = 0.8,
      width = 0.8,
      preview_width = 0.5,
      horizontal = {
        preview_cutoff = 120,
        prompt_position = "top"
      }
    }
  },
  extensions = {
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = false, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = "smart_case" -- or "ignore_case" or "respect_case"
    }
  }
}

require("telescope").load_extension("fzf")

-- MAPPINGS
local km = {noremap = true, silent = true}
local bi = "<cmd>lua require('telescope.builtin')"

-- FileFinding
vim.api.nvim_set_keymap("n", "<LocalLeader>ff", bi .. ".find_files{hidden=true}<cr>", km)
vim.api.nvim_set_keymap("n", "<LocalLeader>fg", bi .. ".git_files()<cr>", km)
vim.api.nvim_set_keymap("n", "<LocalLeader>fb", bi .. ".buffers()<cr>", km)
vim.api.nvim_set_keymap("n", "<LocalLeader>fc", bi .. ".find_files{cwd='~/.files', hidden=true}<cr>", km)
vim.api.nvim_set_keymap("n", "<LocalLeader>fl", bi .. ".current_buffer_fuzzy_find()<cr>", km)

vim.api.nvim_set_keymap("n", "<LocalLeader>fw", bi .. ".live_grep()<cr>", km)
-- vim.api.nvim_set_keymap("n", "<LocalLeader>fi", bi .. ".find_files{cwd='~', hidden=true}<cr>", km)
-- vim.api.nvim_set_keymap("n", "<LocalLeader>fp", bi .. ".find_files{cwd='~/projects'}<cr>", km)

-- Misc
vim.api.nvim_set_keymap("n", "<LocalLeader>he", bi .. ".help_tags()<cr>", km)
vim.api.nvim_set_keymap("n", "<LocalLeader>ma", bi .. ".keymaps()<cr>", km)
vim.api.nvim_set_keymap("n", "<LocalLeader>hi", bi .. ".highlights()<cr>", km)
vim.api.nvim_set_keymap("n", "<LocalLeader>cc", bi .. ".commands()<cr>", km)
