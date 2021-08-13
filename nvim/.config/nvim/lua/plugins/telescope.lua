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

local vimgrep_arguments = {
  "rg",
  "--color=never",
  "--no-heading",
  "--with-filename",
  "--line-number",
  "--column",
  "--smart-case"
}

local file_ignore_patterns = {
  "node_modules",
  ".git",
  "%.pt",
  "%.npy",
  "%.chpt",
  "%.ckpt",
  "%data/%/",
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
    vimgrep_arguments = vimgrep_arguments,
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
    },
    mappings = mappings,
    file_sorter = require "telescope.sorters".get_fzy_sorter,
    file_ignore_patterns = file_ignore_patterns,
    generic_sorter = require "telescope.sorters".get_generic_fuzzy_sorter,
    path_display = {},
    winblend = 0,
    border = {},
    borderchars = {"─", "│", "─", "│", "╭", "╮", "╯", "╰"},
    color_devicons = true,
    use_less = true,
    set_env = {["COLORTERM"] = "truecolor"}, -- default { }, currently unsupported for shells like cmd.exe / powershell.exe
    file_previewer = require "telescope.previewers".cat.new, -- For buffer previewer use `require'telescope.previewers'.vim_buffer_cat.new`
    grep_previewer = require "telescope.previewers".vimgrep.new, -- For buffer previewer use `require'telescope.previewers'.vim_buffer_vimgrep.new`
    qflist_previewer = require "telescope.previewers".qflist.new, -- For buffer previewer use `require'telescope.previewers'.vim_buffer_qflist.new`
    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require "telescope.previewers".buffer_previewer_maker
  },
  extensions = {
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true
    },
    fzf_writer = {
      minimum_grep_characters = 2,
      minimum_files_characters = 3,
      -- Disabled by default.
      -- Will probably slow down some aspects of the sorter, but can make color highlights.
      -- I will work on this more later.
      use_highlighter = true
    }
  }
}

require("telescope").load_extension("fzy_native")
require("telescope").load_extension("fzf_writer")

-- MAPPINGS
local km = {noremap = true, silent = true}
local bi = "<cmd>lua require('telescope.builtin')"

-- FileFinding
vim.api.nvim_set_keymap("n", "<LocalLeader>ff", bi .. ".find_files{hidden=true}<cr>", km)
vim.api.nvim_set_keymap("n", "<LocalLeader>fg", bi .. ".git_files()<cr>", km)
vim.api.nvim_set_keymap("n", "<LocalLeader>fb", bi .. ".buffers()<cr>", km)
vim.api.nvim_set_keymap("n", "<LocalLeader>fc", bi .. ".find_files{cwd='~/.files', hidden=true}<cr>", km)
vim.api.nvim_set_keymap("n", "<LocalLeader>fl", bi .. ".current_buffer_fuzzy_find()<cr>", km)

-- Misc
vim.api.nvim_set_keymap("n", "<LocalLeader>he", bi .. ".help_tags()<cr>", km)
vim.api.nvim_set_keymap("n", "<LocalLeader>ma", bi .. ".keymaps()<cr>", km)
vim.api.nvim_set_keymap("n", "<LocalLeader>hi", bi .. ".highlights()<cr>", km)
vim.api.nvim_set_keymap("n", "<LocalLeader>cc", bi .. ".commands()<cr>", km)