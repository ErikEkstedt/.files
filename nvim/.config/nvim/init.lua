-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.python2_host_prog = vim.fn.expand("$HOME/miniconda2/bin/python")
vim.g.python_host_bin = vim.fn.expand("$HOME/miniconda3/bin")

-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
-- vim.opt.clipboard = "unnamedplus"

vim.opt.breakindent = true -- Enable break indent
vim.opt.confirm = true -- Confirm to save changes before exiting modified buffer
vim.opt.cursorline = true -- Show which line your cursor is on
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.fillchars = [[eob: ,fold:·,foldopen:,foldsep: ,foldclose:]]
vim.opt.formatoptions = "jcroqlnt" -- tcqj
vim.opt.grepformat = "%f:%l:%c:%m"
vim.opt.grepprg = "rg --vimgrep"
vim.opt.hlsearch = true -- Set highlight on search
vim.opt.ignorecase = true -- Case-insensitive searching UNLESS \C or capital in search
vim.opt.inccommand = "split" -- Preview substitutions live, as you type!
vim.opt.laststatus = 3 -- global statusline
vim.opt.linebreak = true
vim.opt.mouse = "a" -- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.number = true
vim.opt.pumblend = 0 -- Popup blend
vim.opt.pumheight = 40 -- Maximum number of entries in a popup
vim.opt.scrolloff = 5 -- Minimal number of screen lines to keep above and below the cursor.
vim.opt.showmode = false -- Don't show the mode, since it's already in status line
vim.opt.sidescrolloff = 8 -- Columns of context
vim.opt.signcolumn = "yes" -- Keep signcolumn on by default
vim.opt.smartcase = true
vim.opt.smartindent = true -- Insert indents automatically
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.termguicolors = true -- True color support
vim.opt.timeoutlen = 300
vim.opt.undofile = true -- Save undo history
vim.opt.updatetime = 250
vim.opt.timeoutlen = 400 -- Time in milliseconds to wait for a mapped sequence to complete.
vim.opt.virtualedit = "block"
vim.opt.wrap = false

-- options to save for persistent session
vim.opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "winpos", "help", "globals", "skiprtp", "folds" }

-- Sets how neovim will display certain whitespace in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Folds
vim.opt.foldmethod = "indent"
vim.opt.foldtext =
  [[substitute(getline(v:foldstart),'\\t',repeat('\ ',&tabstop),'g').'...'.trim(getline(v:foldend)) . ' (' . (v:foldend - v:foldstart + 1) . ' lines)']]
-- vim.opt.foldcolumn = "0" -- '0' is not bad
-- vim.opt.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
-- vim.opt.foldlevelstart = 99
-- vim.opt.foldenable = true

-- vim.cmd([[let &t_Cs = "\e[4:3m"]])
-- vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- [[ Keymaps ]]
--  See `:help vim.keymap.set()`

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- TAB
vim.keymap.set("v", "<Tab>", ">gv", { silent = true })
vim.keymap.set("v", "<S-Tab>", "<gv", { silent = true })
-- vim.keymap.set("i", "<S-Tab>", "<esc><<I", { silent = true })
vim.keymap.set("i", "<S-Tab>", "<C-D>", { silent = true }) -- trying out

-- DIAGNOSTICS
-- Diagnostic keymaps
vim.keymap.set("n", "<leader>dk", vim.diagnostic.goto_prev, { desc = "Diagnostic Go to previous message" })
vim.keymap.set("n", "<leader>dj", vim.diagnostic.goto_next, { desc = "Diagnostic Go to next message" })
vim.keymap.set("n", "<space>dd", vim.diagnostic.open_float, { desc = "Diagnostic Float" })
vim.keymap.set("n", "<space>qq", vim.diagnostic.setloclist, { desc = "Diagnostic LocList" })

-- Configure diagostics border
vim.diagnostic.config({
  float = {
    border = "rounded",
  },
})

for type, icon in pairs({
  Error = " ",
  Warn = " ",
  Hint = " ",
  Info = " ",
}) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- Tmux Movement
-- Moving from Tmuxinator vimscript
-- https://github.com/christoomey/vim-tmux-navigator
-- to -->
-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
-- SOURCE: https://github.com/nathom/tmux.nvim
-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

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

local M = {}
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
vim.keymap.set("n", "<C-Left>", ":vertical resize -3<CR>", ns)
vim.keymap.set("n", "<C-Right>", ":vertical resize +3<CR>", ns)
vim.keymap.set("n", "<C-Down>", ":resize +3<CR>", ns)
vim.keymap.set("n", "<C-Up>", ":resize -3<CR>", ns)

-- General
vim.keymap.set("n", "<C-s>", "<cmd>w<CR>", ns)
vim.keymap.set("n", "<C-q>", "<cmd>q<CR>", ns)
vim.keymap.set("n", "<M-q>", "<cmd>qa!<CR>", ns)
vim.keymap.set("n", "<space>D", "<cmd>qa!<CR>", ns)
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
vim.keymap.set("n", "<space><space>", ":b#<CR>", ns)
vim.keymap.set("n", "<space>D", ":bd<CR>", ns)
vim.keymap.set("n", "<space>b", ":bp<CR>", ns)
vim.keymap.set("n", "<space>B", ":bf<CR>", ns)
vim.keymap.set("n", "<space>p", ":bp<CR>", ns)
vim.keymap.set("n", "<space>P", ":bf<CR>", ns)
vim.keymap.set("n", "<space>n", ":bn<CR>", ns)
vim.keymap.set("n", "<space>N", ":bl<CR>", ns)

-- Fold
vim.keymap.set("n", "<Leader>z", "za", ns)

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`
-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- go to last loc when opening a buffer
vim.api.nvim_create_autocmd("BufReadPost", {
  group = vim.api.nvim_create_augroup("kickstart-last-loc", { clear = true }),
  callback = function(event)
    local exclude = { "gitcommit" }
    local buf = event.buf
    if vim.tbl_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].lazyvim_last_loc then
      return
    end
    vim.b[buf].lazyvim_last_loc = true
    local mark = vim.api.nvim_buf_get_mark(buf, '"')
    local lcount = vim.api.nvim_buf_line_count(buf)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- Auto create dir when saving a file, in case some intermediate directory does not exist
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  group = vim.api.nvim_create_augroup("kickstart-auto-create-dir", { clear = true }),
  callback = function(event)
    if event.match:match("^%w%w+://") then
      return
    end
    local file = vim.loop.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
  end,
})

-- Check if we need to reload the file when it changed
vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
  group = vim.api.nvim_create_augroup("kickstart-checktime", { clear = true }),
  command = "checktime",
})

-- Vim-slime
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "python", "bash", "zsh" },
  callback = function()
    -- TODO: conditional to make sure vim-slime is installed
    vim.keymap.set("n", "<CR>", "<Plug>SlimeParagraphSend", { buffer = true })
    vim.keymap.set("x", "<CR>", "<Plug>SlimeRegionSend", { buffer = true })
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "python" },
  callback = function()
    vim.keymap.set("n", "<Space>al", "gg0v/if __name__<CR>k", { buffer = true })
    vim.keymap.set("n", "gm", "/if __name__<CR>:nohl<CR>j", { buffer = true })
  end,
})

-- Custom things

-- Catppuccin
-- https://github.com/catppuccin/nvim/discussions/323
local gruvbox = {
  rosewater = "#ffc6be",
  flamingo = "#fb4934",
  pink = "#ff75a0",
  mauve = "#f2594b",
  red = "#f2594b",
  maroon = "#fe8019",
  peach = "#FFAD7D",
  yellow = "#e9b143",
  green = "#b0b846",
  teal = "#8bba7f",
  sky = "#7daea3",
  sapphire = "#689d6a",
  blue = "#80aa9e",
  lavender = "#e2cca9",
  text = "#e2cca9",
  subtext1 = "#e2cca9",
  subtext0 = "#e2cca9",
  overlay2 = "#8C7A58",
  overlay1 = "#735F3F",
  overlay0 = "#806234",
  surface2 = "#665c54",
  surface1 = "#3c3836",
  surface0 = "#32302f",
  base = "#282828",
  mantle = "#1d2021",
  crust = "#1b1b1b",
}

local gruv = {
  rosewater = "#ea6962",
  flamingo = "#ea6962",
  red = "#ea6962",
  maroon = "#ea6962",
  pink = "#d3869b",
  mauve = "#d3869b",
  peach = "#e78a4e",
  yellow = "#d8a657",
  green = "#a9b665",
  teal = "#89b482",
  sky = "#89b482",
  sapphire = "#89b482",
  blue = "#7daea3",
  lavender = "#7daea3",
  text = "#ebdbb2",
  subtext1 = "#d5c4a1",
  subtext0 = "#bdae93",
  overlay2 = "#a89984",
  overlay1 = "#928374",
  overlay0 = "#595959",
  surface2 = "#4d4d4d",
  surface1 = "#404040",
  surface0 = "#292929",
  base = "#1d2021",
  mantle = "#191b1c",
  crust = "#141617",
}

local test = {
  rosewater = "#ffc0b9",
  flamingo = "#f5aba3",
  pink = "#f592d6",
  mauve = "#c0afff",
  red = "#ea746c",
  maroon = "#ff8595",
  peach = "#fa9a6d",
  yellow = "#ffe081",
  green = "#99d783",
  teal = "#47deb4",
  sky = "#00d5ed",
  sapphire = "#00dfce",
  blue = "#00baee",
  lavender = "#abbff3",
  text = "#cccccc",
  subtext1 = "#bbbbbb",
  subtext0 = "#aaaaaa",
  overlay2 = "#999999",
  overlay1 = "#888888",
  overlay0 = "#777777",
  surface2 = "#666666",
  surface1 = "#555555",
  surface0 = "#444444",
  base = "#202020",
  mantle = "#222222",
  crust = "#333333",
}

local material = {
  --     main = {
  --     xwhite      = "#EEFFFF",
  --     xgray       = "#717CB4",
  --     xblack      = "#000000",
  --     xred        = "#F07178",
  --     xgreen      = "#C3E88D",
  --     xyellow     = "#FFCB6B",
  --     xblue       = "#82AAFF",
  --     xpaleblue   = "#B0C9FF",
  --     xcyan       = "#89DDFF",
  --     xpurple     = "#C792EA",
  --     xorange     = "#F78C6C",
  --     xpink       = "#FF9CAC",
  --     xdarkred    = "#DC6068",
  --     xdarkgreen  = "#ABCF76",
  --     xdarkyellow = "#E6B455",
  --     xdarkblue   = "#6E98EB",
  --     xdarkcyan   = "#71C6E7",
  --     xdarkpurple = "#B480D6",
  --     xdarkorange = "#E2795B",
  -- },
  rosewater = "#FF9CAC", --"#ffc6be",
  flamingo = "#F07178", --"#fb4934",
  pink = "#ff75a0",
  mauve = "#82AAFF", -- "#f2594b",
  red = "#DC6068", -- "#f2594b",
  maroon = "#E6B455", -- "#fe8019",
  peach = "#FFCB6B", --"#FFAD7D",
  yellow = "#6E98EB", --"#e9b143",
  green = "#C3E88D", -- "#b0b846",
  teal = "#ABCF76", -- "#8bba7f",
  sky = "#71C6E7", --"#7daea3",
  sapphire = "#689d6a",
  blue = "#89DDFF", -- "#71C6E7", -- "#80aa9e",
  lavender = "#B0BED5", --"#e2cca9",
  text = "#eeffff",
  subtext1 = "#8C8B8B", -- "#e2cca9",
  subtext0 = "#404040", -- "#e2cca9",
  overlay2 = "#8C7A58",
  overlay1 = "#735F3F",
  overlay0 = "#806234",
  surface2 = "#665c54",
  surface1 = "#3c3836",
  surface0 = "#32302f",
  base = "#212121",
  mantle = "#1A1A1A",
  crust = "#11111b",
  -- DEFAULTS
  -- pink = "#f5c2e7",
  -- red = "#f38ba8",
  -- maroon = "#eba0ac",
  -- yellow = "#f9e2af",
  -- green = "#a6e3a1",
  -- teal = "#94e2d5",
  -- blue = "#89b4fa",
  -- lavender = "#b4befe",
  -- rosewater = "#f5e0dc",
  -- flamingo = "#f2cdcd",
  -- mauve = "#cba6f7",
  -- peach = "#fab387",
  -- sky = "#89dceb",
  -- sapphire = "#74c7ec",
  -- text = "#cdd6f4",
  -- subtext1 = "#bac2de",
  -- subtext0 = "#a6adc8",
  -- overlay2 = "#9399b2",
  -- overlay1 = "#7f849c",
  -- overlay0 = "#6c7086",
  -- surface2 = "#585b70",
  -- surface1 = "#45475a",
  -- surface0 = "#313244",
  -- base = "#1e1e2e",
  -- mantle = "#181825",
  -- crust = "#11111b",
}

-- LAZY
-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  "tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically
  { "mbbill/undotree", event = "BufEnter" },
  { "wellle/targets.vim", event = "BufEnter" },
  { "fladson/vim-kitty", ft = "kitty" },
  { "folke/todo-comments.nvim", event = "VimEnter", dependencies = { "nvim-lua/plenary.nvim" }, opts = { signs = false } },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function()
      require("noice").setup({
        lsp = {
          progress = { enabled = false }, -- use fidget
          -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
          signature = { enabled = true },
        },
        cmdline = {
          enabled = true,
          format = {
            -- conceal: (default=true) This will hide the text in the cmdline that matches the pattern.
            -- view: (default is cmdline view)
            -- opts: any options passed to the view
            -- icon_hl_group: optional hl_group for the icon
            -- title: set to anything or empty string to hide
            cmdline = { pattern = "^:", icon = "", lang = "vim" },
            search_down = { kind = "search", pattern = "^/", icon = " /", lang = "regex" },
            search_up = { kind = "search", pattern = "^%?", icon = " ?", lang = "regex", icon_hl_group = "Error" },
          },
        },
        -- you can enable a preset for easier configuration
        presets = {
          bottom_search = false, -- use a classic bottom cmdline for search
          command_palette = true, -- position the cmdline and popupmenu together
          long_message_to_split = true, -- long messages will be sent to a split
          inc_rename = false, -- enables an input dialog for inc-rename.nvim
          lsp_doc_border = true, -- add a border to hover docs and signature help
        },
      })
    end,
  },
  { -- Adds git related signs to the gutter, as well as utilities for managing changes
    "lewis6991/gitsigns.nvim",
    opts = {
      signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
      },
    },
  },
  { -- Useful plugin to show you pending keybinds.
    "folke/which-key.nvim",
    event = "VimEnter", -- Sets the loading event to 'VimEnter'
    config = function() -- This is the function that runs, AFTER loading
      require("which-key").setup()

      -- Document existing key chains
      require("which-key").register({
        ["<leader>c"] = { name = "[C]ode", _ = "which_key_ignore" },
        ["<leader>d"] = { name = "[D]ocument", _ = "which_key_ignore" },
        ["<leader>r"] = { name = "[R]ename", _ = "which_key_ignore" },
        ["<leader>s"] = { name = "[S]earch", _ = "which_key_ignore" },
        ["<leader>w"] = { name = "[W]orkspace", _ = "which_key_ignore" },
      })
    end,
  },
  { -- Fuzzy Finder
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { -- If encountering errors, see telescope-fzf-native README for install instructions
        "nvim-telescope/telescope-fzf-native.nvim",

        -- `build` is used to run some command when the plugin is installed/updated.
        -- This is only run then, not every time Neovim starts up.
        build = "make",

        -- `cond` is a condition used to determine whether this plugin should be
        -- installed and loaded.
        cond = function()
          return vim.fn.executable("make") == 1
        end,
      },
      { "nvim-telescope/telescope-ui-select.nvim" },
      { "nvim-tree/nvim-web-devicons" },
    },
    config = function()
      -- Two important keymaps to use while in telescope are:
      --  - Insert mode: <c-/>
      --  - Normal mode: ?
      -- This opens a window that shows you all of the keymaps for the current
      -- telescope picker. This is really useful to discover what Telescope can
      -- do as well as how to actually do it!

      -- [[ Configure Telescope ]]
      -- See `:help telescope` and `:help telescope.setup()`
      require("telescope").setup({
        defaults = {
          sorting_strategy = "ascending",
          layout_config = {
            horizontal = { prompt_position = "top" },
          },
          mappings = {
            i = {
              ["<c-x>"] = false,
              ["<c-v>"] = false,
              ["<c-l>"] = "select_vertical",
              ["<c-j>"] = "select_horizontal",
              ["<C-q>"] = "send_to_qflist",
              ["<cr>"] = "select_default",
            },
            n = {
              ["q"] = "close",
              ["<c-x>"] = false,
              ["<c-v>"] = false,
              ["<c-l>"] = "select_vertical",
              ["<c-j>"] = "select_horizontal",
              ["<C-q>"] = "close",
              ["<cr>"] = "select_default",
            },
          },
        },
        pickers = {
          -- https://github.com/nvim-telescope/telescope.nvim/issues/2105
          find_files = {
            find_command = { "rg", "--files", "--hidden", "-g", "!.git" },
          },
        },
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown(),
          },
        },
      })

      -- Enable telescope extensions, if they are installed
      pcall(require("telescope").load_extension, "fzf")
      pcall(require("telescope").load_extension, "ui-select")

      -- See `:help telescope.builtin`
      local builtin = require("telescope.builtin")

      vim.keymap.set("n", "<leader>fw", builtin.live_grep, { desc = "[F]ind [W]ords (grep)" })
      vim.keymap.set("n", "<leader>fg", builtin.git_files, { desc = "[F]ind [G]it-files" })
      vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "[F]ind existing [B]uffers" })
      vim.keymap.set("n", "<leader>ff", function()
        builtin.find_files({ hidden = true })
      end, { desc = "[S]earch [F]iles hidden" })
      vim.keymap.set("n", "<leader>fc", function()
        builtin.find_files({ cwd = "~/.files" })
      end, { desc = "[S]earch [C]onfig" })
      vim.keymap.set("n", "<leader>fv", function()
        builtin.find_files({ cwd = "~/.config/nvim" })
      end, { desc = "[S]earch [v]vim confif" })
      vim.keymap.set("n", "<leader>fp", function()
        builtin.find_files({ cwd = "~/projects/CCConv/" })
      end, { desc = "[F]ind [P]rojects" })
      vim.keymap.set("n", "<leader>fP", function()
        builtin.find_files({ cwd = "~/projects" })
      end, { desc = "[F]ind [P]rojects" })

      vim.keymap.set("n", "<leader>fhe", builtin.help_tags, { desc = "[F]ind [H][I]ghlights" })
      vim.keymap.set("n", "<leader>fhi", builtin.highlights, { desc = "[F]ind [H][I]ghlights" })

      -- vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
      vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
      vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
      vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
      vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
      vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
      vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })

      -- Slightly advanced example of overriding default behavior and theme
      vim.keymap.set("n", "<leader>/", function()
        -- You can pass additional configuration to telescope to change theme, layout, etc.
        builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
          winblend = 10,
          previewer = false,
        }))
      end, { desc = "[/] Fuzzily search in current buffer" })

      -- Also possible to pass additional configuration options.
      --  See `:help telescope.builtin.live_grep()` for information about particular keys
      vim.keymap.set("n", "<leader>s/", function()
        builtin.live_grep({
          grep_open_files = true,
          prompt_title = "Live Grep in Open Files",
        })
      end, { desc = "[S]earch [/] in Open Files" })

      -- Shortcut for searching your neovim configuration files
      vim.keymap.set("n", "<leader>sn", function()
        builtin.find_files({ cwd = vim.fn.stdpath("config") })
      end, { desc = "[S]earch [N]eovim files" })
    end,
  },
  { -- LSP Configuration & Plugins
    "neovim/nvim-lspconfig",
    dependencies = {
      -- Automatically install LSPs and related tools to stdpath for neovim
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",

      -- Useful status updates for LSP.
      { "j-hui/fidget.nvim", opts = {} },
    },
    config = function()
      -- Brief Aside: **What is LSP?**
      --
      -- LSP is an acronym you've probably heard, but might not understand what it is.
      --
      -- LSP stands for Language Server Protocol. It's a protocol that helps editors
      -- and language tooling communicate in a standardized fashion.
      --
      -- In general, you have a "server" which is some tool built to understand a particular
      -- language (such as `gopls`, `lua_ls`, `rust_analyzer`, etc). These Language Servers
      -- (sometimes called LSP servers, but that's kind of like ATM Machine) are standalone
      -- processes that communicate with some "client" - in this case, Neovim!
      --
      -- LSP provides Neovim with features like:
      --  - Go to definition
      --  - Find references
      --  - Autocompletion
      --  - Symbol Search
      --  - and more!
      --
      -- Thus, Language Servers are external tools that must be installed separately from
      -- Neovim. This is where `mason` and related plugins come into play.
      --
      -- If you're wondering about lsp vs treesitter, you can check out the wonderfully
      -- and elegantly composed help section, `:help lsp-vs-treesitter`

      --  This function gets run when an LSP attaches to a particular buffer.
      --    That is to say, every time a new file is opened that is associated with
      --    an lsp (for example, opening `main.rs` is associated with `rust_analyzer`) this
      --    function will be executed to configure the current buffer
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
        callback = function(event)
          -- NOTE: Remember that lua is a real programming language, and as such it is possible
          -- to define small helper and utility functions so you don't have to repeat yourself
          -- many times.
          --
          -- In this case, we create a function that lets us more easily define mappings specific
          -- for LSP related items. It sets the mode, buffer and description for us each time.
          local map = function(keys, func, desc)
            vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
          end

          -- Jump to the definition of the word under your cursor.
          --  This is where a variable was first declared, or where a function is defined, etc.
          --  To jump back, press <C-T>.
          map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")

          -- Find references for the word under your cursor.
          map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")

          -- Jump to the implementation of the word under your cursor.
          --  Useful when your language has ways of declaring types without an actual implementation.
          map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")

          -- Jump to the type of the word under your cursor.
          --  Useful when you're not sure what type a variable is and you want to see
          --  the definition of its *type*, not where it was *defined*.
          map("<leader>td", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")

          -- Fuzzy find all the symbols in your current document.
          --  Symbols are things like variables, functions, types, etc.
          map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")

          -- Fuzzy find all the symbols in your current workspace
          --  Similar to document symbols, except searches over your whole project.
          map("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

          -- Rename the variable under your cursor
          --  Most Language Servers support renaming across files, etc.
          map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")

          -- Execute a code action, usually your cursor needs to be on top of an error
          -- or a suggestion from your LSP for this to activate.
          map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

          -- Opens a popup that displays documentation about the word under your cursor
          --  See `:help K` for why this keymap
          map("K", vim.lsp.buf.hover, "Hover Documentation")

          -- WARN: This is not Goto Definition, this is Goto Declaration.
          --  For example, in C this would take you to the header
          map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

          -- The following two autocommands are used to highlight references of the
          -- word under your cursor when your cursor rests there for a little while.
          --    See `:help CursorHold` for information about when this is executed
          --
          -- When you move your cursor, the highlights will be cleared (the second autocommand).
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client.server_capabilities.documentHighlightProvider then
            vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
              buffer = event.buf,
              callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
              buffer = event.buf,
              callback = vim.lsp.buf.clear_references,
            })
          end
        end,
      })

      -- Make LspInfo have borders
      require("lspconfig.ui.windows").default_options.border = "rounded"

      -- LSP servers and clients are able to communicate to each other what features they support.
      --  By default, Neovim doesn't support everything that is in the LSP Specification.
      --  When you add nvim-cmp, luasnip, etc. Neovim now has *more* capabilities.
      --  So, we create new capabilities with nvim cmp, and then broadcast that to the servers.
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

      -- Enable the following language servers
      --  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
      --
      --  Add any additional override configuration in the following tables. Available keys are:
      --  - cmd (table): Override the default command used to start the server
      --  - filetypes (table): Override the default list of associated filetypes for the server
      --  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
      --  - settings (table): Override the default settings passed when initializing the server.
      --        For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/
      local servers = {
        -- clangd = {},
        -- gopls = {},
        pyright = {
          -- Overwriting this only to have a better order (i.e., pyright first)
          -- Accidently had a setup.py in my home directory and all projects were thought to start there
          -- This should not be the case of course but lets not check the entire system for files I
          -- don't use as much as pyrightconfig.json / requirements.txt / setup
          root_dir = function(fname)
            local root_files = {
              "pyrightconfig.json",
              "requirements.txt",
              "setup.py",
              "pyproject.toml",
              "setup.cfg",
              ".git",
              "Pipfile",
            }
            return require("lspconfig.util").root_pattern(unpack(root_files))(fname)
          end,
          settings = {
            python = {
              venvPath = vim.fn.expand("$HOME/miniconda3/envs"),
              pythonPath = vim.g.python3_host_prog,
            },
          },
        },
        -- rust_analyzer = {},
        -- ... etc. See `:help lspconfig-all` for a list of all the pre-configured LSPs
        --
        -- Some languages (like typescript) have entire language plugins that can be useful:
        --    https://github.com/pmizio/typescript-tools.nvim
        --
        -- But for many setups, the LSP (`tsserver`) will work just fine
        tsserver = {},
        kotlin_language_server = {},
        lua_ls = {
          -- cmd = {...},
          -- filetypes { ...},
          -- capabilities = {},
          settings = {
            Lua = {
              runtime = { version = "LuaJIT" },
              workspace = {
                checkThirdParty = false,
                -- Tells lua_ls where to find all the Lua files that you have loaded
                -- for your neovim configuration.
                library = {
                  "${3rd}/luv/library",
                  unpack(vim.api.nvim_get_runtime_file("", true)),
                },
                -- If lua_ls is really slow on your computer, you can try this instead:
                -- library = { vim.env.VIMRUNTIME },
              },
              completion = {
                callSnippet = "Replace",
              },
              -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
              -- diagnostics = { disable = { 'missing-fields' } },
            },
          },
        },
      }

      -- Ensure the servers and tools above are installed
      --  To check the current status of installed tools and/or manually install
      --  other tools, you can run
      --    :Mason
      --
      --  You can press `g?` for help in this menu
      require("mason").setup({ ui = { border = "rounded" } })

      -- You can add other tools here that you want Mason to install
      -- for you, so that they are available from within Neovim.
      local ensure_installed = vim.tbl_keys(servers or {})
      vim.list_extend(ensure_installed, {
        "stylua", -- Used to format lua code
        "bashls",
        "black",
        "cssls",
        "html",
        "lua_ls",
        "prismals",
        "pyright",
        "kotlin_language_server",
        "ktlint",
        "tailwindcss",
        "tsserver",
        "vimls",
        "yamlls",
      })
      require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

      require("mason-lspconfig").setup({
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            -- This handles overriding only values explicitly passed
            -- by the server configuration above. Useful when disabling
            -- certain features of an LSP (for example, turning off formatting for tsserver)
            server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
            require("lspconfig")[server_name].setup(server)
          end,
        },
      })
    end,
  },
  {
    "zbirenbaum/copilot.lua",
    event = { "InsertEnter" },
    build = ":Copilot auth",
    opts = {
      suggestion = {
        enabled = false,
        auto_trigger = true,
        debounce = 75,
        -- keymap = {
        --   accept = "<C-l>",
        -- },
      },
      panel = { enabled = false },
      filetypes = {
        markdown = true,
        help = false,
      },
    },
  },
  { -- Autocompletion
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      {
        "L3MON4D3/LuaSnip",
        dependencies = {
          "rafamadriz/friendly-snippets",
        },
        keys = function()
          return {}
        end,
        build = (function()
          -- Build Step is needed for regex support in snippets
          -- This step is not supported in many windows environments
          -- Remove the below condition to re-enable on windows
          if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
            return
          end
          return "make install_jsregexp"
        end)(),
        config = function()
          require("luasnip/loaders/from_vscode").lazy_load() -- required for luasnip + friendly-snippets
          local ls = require("luasnip")
          local types = require("luasnip.util.types")
          -- local snippet = ls.snippet
          -- local i = ls.insert_node
          -- local f = ls.function_node
          -- local fmt = require("luasnip.extras.fmt").fmt
          ls.add_snippets("python", {
            ls.parser.parse_snippet("printshape", 'print("${1}: ", tuple(${1}.shape))'),
            ls.parser.parse_snippet("printdict", 'for k, v in ${1}.items():\n\tprint(f"{k}: {v}")'),
            ls.parser.parse_snippet("fig", "fig, ax = plt.subplots(${1:1}, ${2:1})"),
            ls.parser.parse_snippet("ifmain", 'if __name__ == "__main__":'),
          })
          ls.config.setup({
            region_check_events = "InsertEnter",
            delete_check_events = "TextChanged,InsertLeave",
            ext_opts = {
              [types.choiceNode] = {
                active = {
                  virt_text = { { "", "Statement" } },
                },
              },
              [types.insertNode] = {
                active = {
                  virt_text = { { "", "Character" } },
                },
              },
            },
          })
        end,
      },
      "zbirenbaum/copilot-cmp",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      {
        "onsails/lspkind.nvim",
        config = function()
          require("lspkind").init({
            symbol_map = {
              Copilot = "",
            },
          })
        end,
      },
      -- 'rafamadriz/friendly-snippets',
    },
    config = function()
      -- See `:help cmp`
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      luasnip.config.setup({})
      require("copilot_cmp").setup()

      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        window = {
          completion = {
            -- winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
            col_offset = -3,
            side_padding = 0,
            completeopt = "menu,menuone,noinsert",
          },
        },
        experimental = { ghost_text = true },
        formatting = {
          fields = { "kind", "abbr", "menu" },
          format = function(entry, vim_item)
            local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
            local strings = vim.split(kind.kind, "%s", { trimempty = true })
            kind.kind = " " .. (strings[1] or "") .. " "
            kind.menu = "    (" .. (strings[2] or "") .. ")"
            return kind
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-n>"] = cmp.mapping.select_next_item(),
          ["<C-p>"] = cmp.mapping.select_prev_item(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          -- Manually trigger a completion from nvim-cmp.
          ["<C-Space>"] = cmp.mapping.complete({}),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              if #cmp.get_entries() == 1 then
                cmp.confirm({ select = true })
              else
                cmp.select_next_item()
              end
            -- elseif has_words_before() then
            --   cmp.complete()
            --   if #cmp.get_entries() == 1 then
            --     cmp.confirm { select = true }
            --   end
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            else
              fallback()
            end
          end, { "i", "s" }),

          ["<C-l>"] = cmp.mapping(function()
            if cmp.visible() then
              cmp.confirm({ select = true })
            elseif luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
            end
          end, { "i", "s" }),
          -- #########################################
          ["<C-h>"] = cmp.mapping(function()
            if luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            end
          end, { "i", "s" }),
        }),
        sources = {
          { name = "nvim_lsp" },
          { name = "copilot" },
          { name = "luasnip" },
          { name = "path" },
        },
      })
    end,
  },
  { -- Autoformat
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
      {
        -- Customize or remove this keymap to your liking
        "<leader>fo",
        function()
          require("conform").format({ async = true, lsp_fallback = true })
          print("Formatted")
        end,
        mode = "",
        desc = "Format buffer",
      },
    },
    opts = {
      notify_on_error = true,
      format_on_save = {
        timeout_ms = 1500,
        lsp_fallback = true,
      },
      formatters_by_ft = {
        lua = { "stylua" },
        kotlin = { "ktlint" },
        javascript = { "prettier" },
        -- javascript = { { "prettierd", "prettier" } },
        javascriptreact = { "prettier" },
        json = { "prettier" },
        jsonc = { "prettier" },
        html = { "prettier" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
        python = { "isort", "black" },
        ["_"] = { "trim_whitespace" },
      },
    },
  },
  { -- Collection of various small independent plugins/modules
    "echasnovski/mini.nvim",
    config = function()
      -- Better Around/Inside textobjects
      --
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [']quote
      --  - ci'  - [C]hange [I]nside [']quote
      -- require("mini.ai").setup({ n_lines = 500 })

      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      -- require("mini.surround").setup()

      -- Simple and easy statusline.
      --  You could remove this setup call if you don't like it,
      --  and try some other statusline plugin
      local statusline = require("mini.statusline")
      statusline.setup()

      -- You can configure sections in the statusline by overriding their
      -- default behavior. For example, here we disable the section for
      -- cursor information because line numbers are already enabled
      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
        return ""
      end

      -- ... and there is more!
      --  Check out: https://github.com/echasnovski/mini.nvim
    end,
  },
  {
    "numToStr/Comment.nvim",
    event = "BufEnter",
    dependencies = {
      {
        "JoosepAlviste/nvim-ts-context-commentstring",
        lazy = true,
        opts = {
          enable_autocmd = false,
        },
      },
    },
    opts = {},
    config = function()
      require("Comment").setup({
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      })
    end,
  },
  { -- Highlight, edit, and navigate code
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
    config = function()
      -- [[ Configure Treesitter ]] See `:help nvim-treesitter`

      ---@diagnostic disable-next-line: missing-fields
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "bash",
          "css",
          "c",
          "html",
          "javascript",
          "json",
          "lua",
          "markdown",
          "markdown_inline",
          "prisma",
          "java",
          "kotlin",
          "python",
          "regex",
          "rust",
          "typescript",
          "vim",
          "vimdoc",
          "yaml",
        },
        -- Autoinstall languages that are not installed
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = false },
        textobjects = {
          lookahead = true,
          move = {
            enable = true,
            set_jumps = true,
            goto_next_start = {
              ["))"] = { query = "@class.outer", desc = "Next class start" },
              ["}}"] = { query = "@function.outer", desc = "Next func start" },
            },
            goto_previous_start = {
              ["(("] = "@class.outer",
              ["{{"] = "@function.outer",
            },
          },
        },
        playground = { enable = true },
      })

      -- There are additional nvim-treesitter modules that you can use to interact
      -- with nvim-treesitter. You should go explore a few and see what interests you:
      --
      --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
      --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
      --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
    end,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    version = "*",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },

    config = function()
      vim.keymap.set("n", "<space>e", function()
        require("neo-tree.command").execute({ toggle = true })
      end, { desc = "Explorer NeoTree" })
      vim.keymap.set("n", "<space>E", function()
        require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
      end, { desc = "Explorer NeoTree (root dir)" })
      require("neo-tree").setup({})
    end,
  },
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    opts = {
      options = vim.opt.sessionoptions:get(),
      pre_save = function()
        vim.api.nvim_exec_autocmds("User", { pattern = "SessionSavePre" })
      end,
    },
    -- stylua: ignore
    keys = {
      { "<leader>qs", function() require("persistence").load() end,                desc = "Restore Session" },
      { "<leader>ql", function() require("persistence").load({ last = true }) end, desc = "Restore Last Session" },
      { "<leader>qd", function() require("persistence").stop() end,                desc = "Don't Save Current Session" },
    },
  },
  {
    "ThePrimeagen/harpoon",
    dependencies = { "nvim-lua/plenary.nvim", "rcarriga/nvim-notify" },
    keys = {
      {
        "<leader>hh",
        function()
          require("harpoon.ui").toggle_quick_menu()
        end,
        desc = "Harpoon Toggle UI",
      },
      {
        "<leader>ha",
        function()
          require("harpoon.mark").add_file()
          -- get the filename for the current buffer
          local filename = vim.fn.expand("%:p")
          vim.notify("Harpoon: " .. filename, vim.log.levels.INFO)
        end,
        desc = "Harpoon add file",
      },
      {
        "<leader>1",
        function()
          require("harpoon.ui").nav_file(1)
        end,
        desc = "Harpoon goto 1",
      },
      {
        "<leader>2",
        function()
          require("harpoon.ui").nav_file(2)
        end,
        desc = "Harpoon goto 2",
      },
      {
        "<leader>3",
        function()
          require("harpoon.ui").nav_file(3)
        end,
        desc = "Harpoon goto 3",
      },
      {
        "<leader>hn",
        function()
          require("harpoon.ui").nav_next()
        end,
        desc = "Harpoon goto next",
      },
      {
        "<leader>hp",
        function()
          require("harpoon.ui").nav_prev()
        end,
        desc = "Harpoon goto prev",
      },
    },
    config = function()
      require("harpoon").setup()
    end,
  },
  {
    "phaazon/hop.nvim",
    branch = "v2", -- optional but strongly recommended
    config = function()
      local hop = require("hop")
      local HintDirection = require("hop.hint").HintDirection
      vim.keymap.set("n", "<space>j", function()
        hop.hint_lines_skip_whitespace({ direction = HintDirection.AFTER_CURSOR })
      end, {})
      vim.keymap.set("n", "<space>k", function()
        hop.hint_lines_skip_whitespace({ direction = HintDirection.BEFORE_CURSOR })
      end, {})
      vim.keymap.set("n", "<space>h", function()
        hop.hint_words({ direction = HintDirection.BEFORE_CURSOR })
      end, {})
      vim.keymap.set("n", "<space>l", function()
        hop.hint_words({ direction = HintDirection.AFTER_CURSOR })
      end, {})

      require("hop").setup({})
    end,
  },
  {
    "NvChad/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({
        filetypes = { "*" },
        user_default_options = {
          RGB = true, -- #RGB hex codes
          RRGGBB = true, -- #RRGGBB hex codes
          names = true, -- "Name" codes like Blue or blue
          RRGGBBAA = true, -- #RRGGBBAA hex codes
          AARRGGBB = false, -- 0xAARRGGBB hex codes
          rgb_fn = true, -- CSS rgb() and rgba() functions
          hsl_fn = false, -- CSS hsl() and hsla() functions
          css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
          css_fn = false, -- Enable all CSS *functions*: rgb_fn, hsl_fn
          -- Available modes for `mode`: foreground, background,  virtualtext
          mode = "background", -- Set the display mode.
          tailwind = true, -- Enable tailwind colors
          -- Available methods are false / true / "normal" / "lsp" / "both"
          -- True is same as normal
          -- parsers can contain values used in |user_default_options|
          sass = { enable = false, parsers = { "css" } }, -- Enable sass colors
          -- virtualtext = "■",
          -- update color values even if buffer is not focused
          -- example use: cmp_menu, cmp_docs
          -- always_update = false
        },
      })
    end,
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup()
    end,
  },
  {
    "KabbAmine/vCoolor.vim",
    config = function()
      vim.g.vcoolor_disable_mappings = 1
      vim.keymap.set("n", "<space>cc", ":VCoolor<CR>", { silent = true, desc = "Pick colors" })
    end,
  },
  {
    "akinsho/nvim-toggleterm.lua",
    keys = {
      {
        "<leader>gg",
        function()
          local lazygit = require("toggleterm.terminal").Terminal:new({
            cmd = "lazygit",
            hidden = true,
            direction = "float",
            float_opts = {
              border = "rounded",
              height = math.floor(vim.o.lines * 0.9),
            },
          })

          -- this was default in the mapping whereas the above was created in the config
          -- It seems like the terminal is not consistent across pressig "q" to exit
          -- If this is possible we should change this keymapping function
          lazygit:toggle()
        end,
        desc = "LazyGit",
      },
    },
    config = function()
      require("toggleterm").setup({})
    end,
  },
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    keys = {
      { "<leader>bL", "<Cmd>BufferLineCloseRight<CR>", desc = "Buffer delete to the right" },
      { "<leader>bH", "<Cmd>BufferLineCloseLeft<CR>", desc = "Buffer delete to the left" },
      { "<leader>bp", "<Cmd>BufferLinePick<CR>", desc = "Buffer Picker" },
    },
    config = function()
      -- local bg = "NONE"
      -- local bga = "#2C2B3A"
      -- local indicator = "#FFFFFF"
      --
      -- if vim.g.colors_name == "material" then
      --   local colors = require("material.colors")
      --   bg = colors.editor.bg
      --   bga = colors.editor.bg
      --
      --   indicator = colors.main.blue
      -- end

      require("bufferline").setup({
        highlights = {
          fill = {
            bg = bg,
          },
          separator = {
            fg = bg,
          },
          separator_visible = {
            fg = bg,
          },
          indicator_visible = {
            fg = indicator,
          },
          indicator_selected = {
            fg = indicator,
          },
          separator_selected = {
            fg = bg,
            bg = bga,
          },
          buffer_selected = {
            fg = "#FEFEFE",
            bg = bga,
            bold = true,
          },
          close_button_selected = {
            bg = bga,
          },
          modified_selected = {
            bg = bga,
          },
          duplicate_selected = {
            fg = "#FEFEFE",
            bg = bga,
          },
        },
        options = {
          always_show_bufferline = true,
          diagnostics = false,
          themable = true,
          indicator = {
            icon = "│", -- this should be omitted if indicator style is not 'icon'
            style = "icon",
          },
          separator_style = "thin",
          truncate_names = true,
          offsets = {
            {
              filetype = "neo-tree",
              text = "Neo-tree",
              highlight = "Directory",
              text_align = "left",
            },
          },
        },
      })
    end,
  },
  {
    "jpalardy/vim-slime",
    config = function()
      vim.g.slime_target = "tmux"
      vim.g.slime_default_config = { socket_name = "default", target_pane = "{right-of}" }
      vim.g.slime_python_ipython = 1
      vim.g.slime_no_mappings = 1

      --Required to transfer data from vim to GNU screen or tmux. Set to "$HOME/.slime_paste" by default.
      -- vim.g.slime_paste_file=vim.fn.tempname()

      vim.keymap.set("n", "<C-C><C-x>", "<Plug>SlimeConfig", {})
      vim.keymap.set("n", "<C-C><C-C>", "<Plug>SlimeLineSend", {})
      vim.keymap.set("x", "<C-C><C-C>", "<Plug>SlimeRegionSend", {})
    end,
  },
  {
    "folke/trouble.nvim",
    cmd = { "TroubleToggle", "Trouble" },
    opts = { use_diagnostic_signs = true },
    keys = {
      { "<leader>xx", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Document Diagnostics (Trouble)" },
      { "<leader>xX", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Diagnostics (Trouble)" },
      { "<leader>xL", "<cmd>TroubleToggle loclist<cr>", desc = "Location List (Trouble)" },
      { "<leader>xQ", "<cmd>TroubleToggle quickfix<cr>", desc = "Quickfix List (Trouble)" },
      {
        "<leader>dp",
        function()
          if require("trouble").is_open() then
            require("trouble").previous({ skip_groups = true, jump = true })
          else
            vim.diagnostic.goto_prev()
            -- local ok, err = pcall(vim.cmd.cprev)
            -- if not ok then
            --   vim.notify(err, vim.log.levels.ERROR)
            -- end
          end
        end,
        desc = "Previous trouble/quickfix item",
      },
      {
        "<leader>dn",
        function()
          if require("trouble").is_open() then
            require("trouble").next({ skip_groups = true, jump = true })
          else
            vim.diagnostic.goto_next()
          end
        end,
        desc = "Next trouble/quickfix item",
      },
      {
        "<leader>dk",
        function()
          if require("trouble").is_open() then
            require("trouble").previous({ skip_groups = true, jump = true })
          else
            vim.diagnostic.goto_prev()
            -- local ok, err = pcall(vim.cmd.cprev)
            -- if not ok then
            --   vim.notify(err, vim.log.levels.ERROR)
            -- end
          end
        end,
        desc = "Previous trouble/quickfix item",
      },
      {
        "<leader>dj",
        function()
          if require("trouble").is_open() then
            require("trouble").next({ skip_groups = true, jump = true })
          else
            vim.diagnostic.goto_next()
          end
        end,
        desc = "Next trouble/quickfix item",
      },
    },
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = "markdown",
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
    keys = {
      {
        "<leader>mp",
        ft = "markdown",
        "<cmd>MarkdownPreviewToggle<cr>",
        desc = "Markdown Preview",
      },
    },
    config = function()
      vim.g.mkdp_auto_close = 0
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    -- lazy = false,
    -- priority = 1000,
    event = "VeryLazy",
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        dim_inactive = {
          enabled = true, -- dims the background color of inactive window
          shade = "dark",
          percentage = 0.1, -- percentage of the shade to apply to the inactive window
        },
        integrations = {
          -- https://github.com/catppuccin/nvim#integrations
          cmp = false,
          gitsigns = true,
          neotree = true,
          fidget = true,
          harpoon = true,
          hop = true,
          mason = true,
          noice = true,
          treesitter = true,
          notify = false,
          mini = {
            enabled = true,
            indentscope_color = "",
          },
        },
        -- color_overrides = { mocha = test },
        -- color_overrides = { mocha = gruv },
        color_overrides = { mocha = gruvbox },
        -- color_overrides = { mocha = material },
        custom_highlights = function(C)
          return {
            CmpItemKindSnippet = { fg = C.base, bg = C.mauve },
            CmpItemKindKeyword = { fg = C.base, bg = C.red },
            CmpItemKindText = { fg = C.base, bg = C.teal },
            CmpItemKindMethod = { fg = C.base, bg = C.blue },
            CmpItemKindConstructor = { fg = C.base, bg = C.blue },
            CmpItemKindFunction = { fg = C.base, bg = C.blue },
            CmpItemKindFolder = { fg = C.base, bg = C.blue },
            CmpItemKindModule = { fg = C.base, bg = C.blue },
            CmpItemKindConstant = { fg = C.base, bg = C.peach },
            CmpItemKindField = { fg = C.base, bg = C.green },
            CmpItemKindProperty = { fg = C.base, bg = C.green },
            CmpItemKindEnum = { fg = C.base, bg = C.green },
            CmpItemKindUnit = { fg = C.base, bg = C.green },
            CmpItemKindClass = { fg = C.base, bg = C.yellow },
            CmpItemKindVariable = { fg = C.base, bg = C.flamingo },
            CmpItemKindFile = { fg = C.base, bg = C.blue },
            CmpItemKindInterface = { fg = C.base, bg = C.yellow },
            CmpItemKindColor = { fg = C.base, bg = C.red },
            CmpItemKindReference = { fg = C.base, bg = C.red },
            CmpItemKindEnumMember = { fg = C.base, bg = C.red },
            CmpItemKindStruct = { fg = C.base, bg = C.blue },
            CmpItemKindValue = { fg = C.base, bg = C.peach },
            CmpItemKindEvent = { fg = C.base, bg = C.blue },
            CmpItemKindOperator = { fg = C.base, bg = C.blue },
            CmpItemKindTypeParameter = { fg = C.base, bg = C.blue },
            CmpItemKindCopilot = { fg = C.base, bg = C.mauve },
            Folded = { fg = C.overlay2, bg = C.none },
            PmenuSel = { fg = "#FFFFFF", bg = C.none },
            FloatBorder = { fg = C.blue, bg = C.none },
          }
        end,
      })
      -- vim.cmd.colorscheme("catppuccin-mocha")
    end,
  },
  {
    "marko-cerovac/material.nvim",
    lazy = false,
    priority = 1000,
    -- event = "VeryLazy",
    config = function()
      require("material").setup({
        contrast = {
          terminal = true,
          sidebars = true,
          floating_windows = true,
          non_current_windows = true,
        },
        disable = { colored_cursor = true },
        styles = {
          comments = { italic = true },
          keywords = { bold = true },
          functions = { bold = true },
        },
        plugins = {
          "fidget",
          "gitsigns",
          "harpoon",
          "hop",
          "neo-tree",
          "noice",
          "nvim-cmp",
          "trouble",
          "which-key",
        },
        lualine_style = "default",
        custom_highlights = {
          ["@type.builtin"] = { fg = "#FFCB6B" },
          ["@variable.builtin.python"] = { fg = "#EB6262", bold = true },
          ["@variable.parameter.python"] = { fg = "#FFCB6B" },
          ["@variable.attribute.python"] = { fg = "#E6B455" },
          ["@variable.member.python"] = { fg = "#ABABAB" },
          ["@variable.tsx"] = { link = "Normal" },
          ["@property.json"] = { fg = "#FFCB6B" },
          ["@boolean.json"] = { fg = "#C792EA" },
          ["@lsp.type.parameter.javascript"] = { fg = "#71C6E7" },
          ["@tag"] = { fg = "#89DDFF" },
          -- Normal = { fg = "#FEFEFE", bg = "NONE" },
          -- Cursor = { fg = "#FFFFFF", bg = "#FF00A9" },
          DiagnosticHint = { fg = "#757575" },
          DiagnosticError = { fg = "#A04B47" },
          Exception = { fg = "#C792EA" },
        },
      })
      vim.g.material_style = "darker"
      vim.cmd([[colorscheme material]])
    end,
  },
  {
    "jacoborus/tender.vim",
    -- lazy = false,
    -- priority = 1000,
    event = "VeryLazy",
    config = function()
      -- vim.cmd([[colorscheme tender]])
    end,
  },
  {
    "mg979/vim-visual-multi",
    config = function()
      vim.g.VM_default_mappings = 0
      vim.g.VM_maps = {
        ["Find Under"] = "<C-n>", -- replace C-n
        -- ["Find Subword Under"] = "<C-n>", -- replace visual C-n
        -- ["Select Cursor Down"] = "<C-Down>", -- start selecting down
        -- ["Select Cursor Up"] = "<C-Up>", -- start selecting up
        -- ["Select Cursor Right"] = "<C-C>", -- start selecting down
        -- ["Select Cursor Left"] = "<M-C-l>", -- start selecting up
      }
    end,
  },
  -- {
  --   'kevinhwang91/nvim-ufo',
  --   dependencies = 'kevinhwang91/promise-async',
  --   lazy = false,
  --   keys = {
  --     {
  --       'zR',
  --       function()
  --         require('ufo').openAllFolds()
  --       end,
  --     },
  --     {
  --       'zM',
  --       function()
  --         require('ufo').closeAllFolds()
  --       end,
  --     },
  --   },
  --   config = function()
  --     require('ufo').setup()
  --   end,
  -- },
  -- {
  --   'folke/tokyonight.nvim',
  --   event = 'VeryLazy',
  --   -- lazy = false, -- make sure we load this during startup if it is your main colorscheme
  --   -- priority = 1000, -- make sure to load this before all the other start plugins
  --   config = function()
  --     vim.cmd.colorscheme 'tokyonight-night'
  --     vim.cmd.hi 'Comment gui=none'
  --   end,
  -- },
}, { ui = { border = "rounded" } })
