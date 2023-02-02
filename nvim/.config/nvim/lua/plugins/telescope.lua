local telescope = require("telescope")
local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local builtin = require("telescope.builtin")
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

-- I want one function to call when I need to find any (not media or weird) files
-- I want the more specific functions called in a specific directories

local file_ignore_patterns = {
  "node_modules/",
  "%.flac",
  "%.git",
  "%.jpeg",
  "%.mp3",
  "%.png",
  "%.sph",
  "%.swp",
  "%.wav",
  "%.zip",
  "%.pt",
  "%.npy",
  "%.chpt",
  "%.pdf",
  "%.pkl",
  "%out.tfevents",
  "%.ana",
  "%.trn",
  "%.txo",
  "%.xml",
  "%.txt",
  "%.text",
  "%.json",
  "%.csv",
  "%.TextGrid" -- new
}

local fd_find_command = {"fd", "--type", "file", "-E", "*.txt", "-E", "*.text", "-E", "*.csv", "--strip-cwd-prefix"}

-- }
--
-- TODO: add a mapping to search all kinds of files..
-- local function fzf_multi_select(prompt_bufnr)
--   local picker = action_state.get_current_picker(prompt_bufnr)
--   local num_selections = #picker:get_multi_selection()
--
--   if num_selections > 1 then
--     actions.send_selected_to_qflist(prompt_bufnr)
--     -- TODO: should open the first file, and qflist, but focus the first.
--     -- vim.cmd(":e!" .. picker:get_multi_selection()[1].value)
--     -- actions.select_default(prompt_bufnr)
--     actions.open_qflist()
--   else
--     -- actions.file_edit(prompt_bufnr)
--     actions.select_default(prompt_bufnr)
--   end
-- end

-- TODO: Good snippets from telescope.nvim - wiki
--local previewers = require("telescope.previewers")

-------------------------------------------------
-- Diable highlighting for certain files
-- local _bad = { ".*%.csv", ".*%.lua" } -- Put all filetypes that slow you down in this array
-- local bad_files = function(filepath)
--   for _, v in ipairs(_bad) do
--     if filepath:match(v) then
--       return false
--     end
--   end
--
--   return true
-- end
--
-- local new_maker = function(filepath, bufnr, opts)
--   opts = opts or {}
--   if opts.use_ft_detect == nil then opts.use_ft_detect = true end
--   opts.use_ft_detect = opts.use_ft_detect == false and false or bad_files(filepath)
--   previewers.buffer_previewer_maker(filepath, bufnr, opts)
-- end
-------------------------------------------------
-- Ignoire files bigger than threshold
-- local new_maker = function(filepath, bufnr, opts)
--   opts = opts or {}
--
--   filepath = vim.fn.expand(filepath)
--   vim.loop.fs_stat(
--     filepath,
--     function(_, stat)
--       if not stat then
--         return
--       end
--       if stat.size > 100000 then
--         return
--       else
--         previewers.buffer_previewer_maker(filepath, bufnr, opts)
--       end
--     end
--   )
-- end

telescope.setup {
  defaults = {
    prompt_prefix = ">",
    color_devicons = true,
    file_previewer = require("telescope.previewers").vim_buffer_bat,
    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
    file_ignore_patterns = file_ignore_patterns,
    sorting_strategy = "ascending",
    layout_config = {
      horizontal = {
        prompt_position = "top"
      }
    },
    mappings = {
      i = {
        ["<c-x>"] = false,
        ["<c-v>"] = false,
        ["<c-l>"] = actions.select_vertical,
        ["<c-j>"] = actions.select_horizontal,
        ["<C-q>"] = actions.send_to_qflist,
        ["<cr>"] = actions.select_default
      },
      n = {
        ["q"] = actions.close,
        ["<c-x>"] = false,
        ["<c-v>"] = false,
        ["<c-l>"] = actions.select_vertical,
        ["<c-j>"] = actions.select_horizontal,
        ["<C-q>"] = actions.close,
        ["<cr>"] = actions.select_default
      }
    },
    extensions = {
      fzf = {
        fuzzy = true, -- false will only do exact matching
        override_generic_sorter = true, -- override the generic sorter
        override_file_sorter = true, -- override the file sorter
        case_mode = "smart_case" -- or "ignore_case" or "respect_case"
      }
      -- bookmarks = {
      --   -- Available: 'brave', 'google_chrome', 'safari', 'firefox', 'firefox_dev'
      --   selected_browser = "brave",
      --   -- Either provide a shell command to open the URL
      --   url_open_command = "xdg-open"
      -- }
    }
  }
}

-- Enable telescope fzf native, if installed
pcall(require("telescope").load_extension, "fzf")

-- telescope.load_extension("bookmarks")

local function search_dotfiles()
  builtin.find_files(
    {
      prompt_title = "< DotFiles >",
      cwd = vim.env.DOTFILES,
      hidden = true,
      find_command = fd_find_command
    }
  )
end

local function search_notes()
  builtin.find_files(
    {
      prompt_title = "< Notes >",
      cwd = "~/zettelkasten",
      hidden = false
    }
  )
end

local function search_projects()
  builtin.find_files(
    {
      prompt_title = "< CCConv >",
      cwd = "~/projects/CCConv",
      hidden = true,
      find_command = fd_find_command
    }
  )
end

local function search_buffers()
  builtin.buffers(
    {
      prompt_title = "< Buffers >",
      results_title = "Buffers",
      layout_strategy = "vertical",
      layout_config = {
        mirror = true,
        prompt_position = "top"
      }
    }
  )
end

local function search_cwd()
  local cwd = vim.loop.cwd():gsub(vim.env.HOME, "")
  builtin.find_files(
    {
      prompt_title = "<" .. cwd .. ">",
      results_title = "Files",
      hidden = false,
      find_command = fd_find_command
    }
  )
end

local function search_home()
  builtin.find_files(
    {
      prompt_title = "< Home >",
      cwd = "~/",
      find_command = {
        "fd",
        "--type",
        "file",
        "--follow",
        "--no-ignore",
        "--hidden",
        "--strip-cwd-prefix",
        "-E",
        ".git",
        "-E",
        "node_modules",
        "-E",
        "__pycache*",
        "-E",
        "*.text",
        "-E",
        "*.txt",
        "-E",
        "*.xml",
        "-E",
        "*.csv",
        "-E",
        "*.json",
        "-E",
        "*.png",
        "-E",
        "*.gif",
        "-E",
        "*.jpg",
        "-E",
        ".jpeg",
        "-E",
        "*.svg",
        "-E",
        "*.wav",
        "-E",
        "*.out.tfevents*",
        "-E",
        "*.pt",
        "-E",
        "*.spl",
        "-E",
        "*.sph",
        "-E",
        "*.chkpt",
        "-E",
        "*.npy",
        "-E",
        "*.sug",
        "-E",
        "*.mp3",
        "-E",
        "*.ckpt",
        "-E",
        "*.zip",
        "-E",
        "*.mp4",
        "-E",
        "*.so",
        "-E",
        "*.flac"
      },
      hidden = true
    }
  )
end

-- MAPPINGS
local prefix = "<Space>"
local km = {noremap = true, silent = true}
local key_map = vim.keymap.set
key_map("n", prefix .. "ff", search_cwd, km)
key_map("n", prefix .. "fcc", search_dotfiles, km)
key_map("n", prefix .. "fb", search_buffers, km)
key_map("n", prefix .. "fp", search_projects, km)
key_map("n", prefix .. "fi", search_home, km)
key_map("n", prefix .. "fn", search_notes, km)

-- builtin
key_map("n", prefix .. "fd", builtin.oldfiles, km)
key_map("n", prefix .. "fw", builtin.live_grep, km)
key_map("n", prefix .. "fco", builtin.commands, km)
key_map("n", prefix .. "fhe", builtin.help_tags, km)
key_map("n", prefix .. "fhi", builtin.highlights, km)
key_map("n", prefix .. "fma", builtin.keymaps, km)

-- handled by fzf for non-lagishness
-- key_map("n", prefix .. "fi", bi .. ".find_files{cwd='~', hidden=true}<cr>", km)
-- key_map("n", prefix .. "fp", bi .. ".find_files{cwd='~/projects'}<cr>", km)
