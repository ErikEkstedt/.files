local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local km = {noremap = true, silent = true}
local bi = "<cmd>lua require('telescope.builtin')"
local ex = "<cmd>lua require('telescope').extensions"
local key_map = vim.api.nvim_set_keymap
local prefix = "<Space>"
local file_ignore_patterns = {
  "node_modules/",
  "%.swp",
  "%.git",
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

local function fzf_multi_select(prompt_bufnr)
  local picker = action_state.get_current_picker(prompt_bufnr)
  local num_selections = #picker:get_multi_selection()

  if num_selections > 1 then
    actions.send_selected_to_qflist(prompt_bufnr)
    -- TODO: should open the first file, and qflist, but focus the first.
    -- vim.cmd(":e!" .. picker:get_multi_selection()[1].value)
    -- actions.select_default(prompt_bufnr)
    actions.open_qflist()
  else
    -- actions.file_edit(prompt_bufnr)
    actions.select_default(prompt_bufnr)
  end
end

local mappings = {
  -- To disable a keymap, put [map] = false
  i = {
    ["<c-x>"] = false,
    ["<c-v>"] = false,
    ["<C-q>"] = actions.close,
    ["<c-l>"] = actions.select_vertical,
    ["<c-j>"] = actions.select_horizontal,
    ["<cr>"] = fzf_multi_select
  },
  n = {
    ["q"] = actions.close,
    ["<C-q>"] = actions.close,
    ["<c-x>"] = false,
    ["<c-v>"] = false,
    ["<c-l>"] = actions.select_vertical,
    ["<c-j>"] = actions.select_horizontal,
    ["<cr>"] = fzf_multi_select
  }
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
      horizontal = {
        preview_cutoff = 120,
        prompt_position = "top"
      }
    }
  },
  extensions = {
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = "smart_case" -- or "ignore_case" or "respect_case"
    }
  }
}

require("telescope").load_extension("fzf")

-- MAPPINGS
-- FileFinding
key_map("n", "<LocalLeader>" .. "ff", bi .. ".find_files{hidden=true}<cr>", km)
key_map("n", prefix .. "fc", bi .. ".find_files{cwd='~/.files', hidden=true}<cr>", km)
key_map("n", prefix .. "co", bi .. ".commands()<cr>", km)
key_map("n", prefix .. "ff", bi .. ".find_files{hidden=true}<cr>", km)
key_map("n", prefix .. "fg", bi .. ".git_files()<cr>", km)
key_map("n", prefix .. "fl", bi .. ".current_buffer_fuzzy_find()<cr>", km)
key_map("n", prefix .. "fn", bi .. ".find_files{cwd='~/zettelkasten'}<cr>", km)
key_map("n", prefix .. "fw", bi .. ".live_grep()<cr>", km)
key_map("n", prefix .. "he", bi .. ".help_tags()<cr>", km)
key_map("n", prefix .. "hi", bi .. ".highlights()<cr>", km)
key_map("n", prefix .. "ma", bi .. ".keymaps()<cr>", km)
key_map("n", prefix .. "fx", ex .. ".notify.notify({})<cr>", km)
key_map("n", prefix .. "fz", bi .. ".find_files{cwd='~/zettelkasten'}<cr>", km)
key_map(
  "n",
  prefix .. "fb",
  [[<Cmd>lua require'telescope.builtin'.buffers({prompt_title = 'Find Buffer', results_title='Buffers', layout_strategy = 'vertical', layout_config = { width = 0.50, height = 0.55 }})<CR>]],
  km
)
key_map(
  "n",
  prefix .. "fv",
  bi ..
    ".find_files{cwd='~/.local/share/nvim/site/pack/packer', hidden=true, file_ignore_patterns={'%.swp', '.git'}}<cr>",
  km
)
-- key_map("n", prefix .. "fb", bi .. ".buffers()<cr>", km)
-- key_map(
--   "n",
--   prefix .. "fv",
--   bi .. '.find_files{opts={title="stdpath-data"}, cwd="' .. vim.fn.stdpath("data") .. '", hidden=true}<cr>',
--   km
-- )
-- handled by fzf for non-lagishness
-- key_map("n", prefix .. "fi", bi .. ".find_files{cwd='~', hidden=true}<cr>", km)
-- key_map("n", prefix .. "fp", bi .. ".find_files{cwd='~/projects'}<cr>", km)
