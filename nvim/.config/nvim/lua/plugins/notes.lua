-- 1. Search for file in $NOTE_DIR
-- 2. Open a note
-- 3. Create a new note
-- Zettelkasten functionality?
-- local M = {}

local NOTE_ROOT = vim.fn.expand("~/Notes")

local function NewNotes()
  local actions = require("telescope.actions")
  local action_state = require("telescope.actions.state")

  local function run_selection(prompt_bufnr, map)
    actions.select_default:replace(function()
      actions.close(prompt_bufnr)
      local selection = action_state.get_selected_entry()

      if selection == nil then
        print("No selection")
      else
        print("Selection: ", vim.inspect(action_state.get_current_line()))
      end
    end)
    return true
  end

  local opts = {
    cwd = NOTE_ROOT,
    attach_mappings = run_selection,
  }
  require("telescope.builtin").find_files(opts)
end

return {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = false,
  -- ft = "markdown",
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
  --   "BufReadPre path/to/my-vault/**.md",
  --   "BufNewFile path/to/my-vault/**.md",
  -- },
  dependencies = {
    "nvim-lua/plenary.nvim", -- Required.
    "hrsh7th/nvim-cmp",
    "nvim-telescope/telescope.nvim",
  },
  keys = {
    { "<space>fno", false },
    { "<space>fnw", false },
    { "<space>fno", "<cmd>:ObsidianQuickSwitch<CR>" },
    { "<space>fnw", "<cmd>:ObsidianSearch<CR>" },
    -- { "<space>fnn", "<cmd>:ObsidianNew<CR>" },
    {
      "<space>fnn",
      NewNotes,
    },
    { "<space>fnd", "<cmd>:ObsidianToday<CR>" },
  },
  opts = {
    workspaces = {
      {
        name = "Notes",
        path = NOTE_ROOT,
      },
    },
    daily_notes = {
      -- Optional, if you keep daily notes in a separate directory.
      folder = vim.fn.expand("~/Notes/daily"),
      -- Optional, if you want to change the date format for the ID of daily notes.
      date_format = "%Y-%m-%d",
      -- Optional, if you want to change the date format of the default alias of daily notes.
      alias_format = "%B %-d, %Y",
      -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
      template = nil,
    },
  },
}
