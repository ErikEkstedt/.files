local M = {}
local get_lsp_client = function(msg)
  msg = msg or "LSP Inactive"
  local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
  local clients = vim.lsp.get_active_clients()
  if next(clients) == nil then
    return msg
  end
  local lsps = ""
  for _, client in ipairs(clients) do
    local filetypes = client.config.filetypes
    if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
      -- print(client.name)
      if lsps == "" then
        -- print("first", lsps)
        lsps = client.name
      else
        -- print("more", lsps)
        if not string.find(lsps, client.name) then
          lsps = lsps .. ", " .. client.name
        end
      end
    end
  end
  if lsps == "" then
    return msg
  else
    return lsps
  end
end

-- chris@machine: https://github.com/ChristianChiarulli/LunarVim/blob/rolling/lua/core/galaxyline.lua
local function env_cleanup(venv)
  if string.find(venv, "/") then
    local final_venv = venv
    for w in venv:gmatch("([^/]+)") do
      final_venv = w
    end
    venv = final_venv
  end
  return venv
end

-- PythonEnv
local function get_pyright_env()
  local utils = require("custom.utils")
  local repo_root = utils.get_git_root()
  if not repo_root then
    return nil
  end

  local pyright_path = repo_root .. "/pyrightconfig.json"

  local body, ret
  require("plenary.job")
    :new({
      command = "cat",
      args = { pyright_path },
      on_exit = function(j, return_val)
        ret = return_val
        body = j:result()
      end,
    })
    :sync() -- or start()

  if ret ~= 0 then
    return nil
  end

  local env = nil
  for _, field in pairs(body) do
    field = field:gsub("%s+", "")
    if string.match(field, '"venv"') ~= nil then
      env = utils.split_string(field, ":")[2]
      env = env:gsub('"', ""):gsub(",", ""):gsub("}", "")
    end
  end

  if not env then
    return nil
  end

  return env
end

local function get_python_env()
  if not vim.bo.filetype == "python" then
    return ""
  end
  local filename = vim.api.nvim_buf_get_name(0)
  local prefix = " "
  local suffix = ""

  -- cache: important to not call "cat on every statusupdate"
  if M[filename] then
    return prefix .. M[filename] .. suffix
  end

  local pyright = get_pyright_env()
  if pyright then
    M[filename] = pyright
    return prefix .. pyright .. suffix
  end

  local venv = os.getenv("CONDA_DEFAULT_ENV")
  if venv ~= nil then
    venv = env_cleanup(venv)
    M[filename] = venv
    return prefix .. venv .. suffix
  end
  venv = os.getenv("VIRTUAL_ENV")
  if venv ~= nil then
    venv = env_cleanup(venv)
    M[filename] = venv
    return prefix .. venv .. suffix
  end
  return ""
end

local mini_indentscope = {
  "echasnovski/mini.indentscope",
  version = false, -- wait till new 0.7.0 release to put it back on semver
  event = "VeryLazy",
  opts = {
    -- symbol = "▏",
    symbol = "│",
    options = { try_as_border = true },
    draw = {
      delay = 100,
      animation = function()
        return 0
      end,
    },
  },
  init = function()
    vim.api.nvim_create_autocmd("FileType", {
      pattern = {
        "help",
        "alpha",
        "dashboard",
        "neo-tree",
        "Trouble",
        "trouble",
        "lazy",
        "mason",
        "notify",
        "toggleterm",
        "lazyterm",
      },
      callback = function()
        vim.b.miniindentscope_disable = true
      end,
    })
  end,
}

-- local bufferline =

local barbar = {
  "romgrk/barbar.nvim",
  dependencies = {
    "lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
    "nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
  },
  version = "^1.0.0", -- optional: only update when a new 1.x version is released
  event = "VeryLazy",
  init = function()
    vim.g.barbar_auto_setup = false
  end,
  keys = {
    { "<leader>nn", "<Cmd>BufferNext<cr>", desc = "Buffer next", { silent = true } },
    { "<leader>bb", "<Cmd>BufferPrevious<cr>", desc = "Buffer prev", { silent = true } },
    { "<leader>pp", "<Cmd>BufferPrevious<cr>", desc = "Buffer prev", { silent = true } },
    { "<leader>bp", "<Cmd>BufferPick<cr>", desc = "Buffer prev", { silent = true } },
    { "<leader>bL", "<Cmd>BufferCloseBuffersRight<CR>", desc = "Buffer delete to the right" },
    { "<leader>bH", "<Cmd>BufferCloseBuffersLeft<CR>", desc = "Buffer delete to the left" },
  },
  config = function()
    require("barbar").setup({
      auto_hide = false,
      -- Set the filetypes which barbar will offset itself for
      sidebar_filetypes = {
        NvimTree = true,
        undotree = { text = "undotree" },
        ["neo-tree"] = { event = "BufWipeout" },
        Outline = { event = "BufWinLeave", text = "symbols-outline" },
      },
      highlight_alternate = false,
      icons = {
        separator = { left = "│", right = "" },
        separator_at_end = false,
      },
    })

    if vim.g.colors_name == "material" then
      -- local colors = require("material.colors")
      -- vim.cmd("hi link BufferCurrent Normal")
      -- vim.cmd("hi link BufferCurrentSign Statement")
      print("Update highlight")

      vim.api.nvim_set_hl(0, "BufferCurrent", { link = "BufferVisible" })
      vim.api.nvim_set_hl(0, "BufferCurrentSign", { link = "Statement" })
      vim.cmd("hi BufferCurrentIcon guibg=NONE")
      -- vim.api.nvim_set_hl(0, "BufferDefaultIcon", { link = "Statement" })

      vim.api.nvim_set_hl(0, "BufferInactive", { link = "Comment" })
      vim.api.nvim_set_hl(0, "BufferInactiveSign", { link = "Comment" })
      -- vim.api.nvim_set_hl(0, "BufferCurrentSign", { fg = colors.main.white, bg = colors.editor.bg })
      -- vim.api.nvim_set_hl(0, "BufferDefaultIcon", { fg = colors.main.white, bg = colors.editor.bg })

      -- vim.cmd("hi link BufferVisible Comment")
      -- vim.cmd("hi link BufferInactive Comment")
      -- vim.cmd("hi link BufferCurrentSign Statement")
      -- vim.cmd("hi link BufferInactive Comment")
      -- vim.cmd("hi BufferInactiveSign guibg=NONE guifg=NONE")
    end
  end,
}

return {
  {
    "j-hui/fidget.nvim",
    event = "BufEnter",
    config = function()
      require("fidget").setup({
        -- progress = {
        --   display = {
        --     progress_icon = { pattern = "line", period = 1 },
        --   },
        -- },
      })
    end,
  },
  { "stevearc/dressing.nvim" },
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        theme = "auto",
        globalstatus = true,
        disabled_filetypes = { statusline = { "dashboard", "alpha", "starter" } },
      },
      sections = {
        lualine_y = {
          {
            get_python_env,
            cond = function()
              return vim.bo.filetype == "python"
            end,
          },
          { get_lsp_client, icon = "" },
        },
      },
    },
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "VeryLazy",
    opts = {
      indent = {
        char = "▏", -- "│",
        tab_char = "│",
        -- highlight = "Comment",
      },
      scope = { enabled = false },
      exclude = {
        filetypes = {
          "help",
          "alpha",
          "dashboard",
          "neo-tree",
          "Trouble",
          "trouble",
          "lazy",
          "mason",
          "notify",
          "toggleterm",
          "lazyterm",
        },
      },
    },
    main = "ibl",
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
      local bg = "NONE"
      local bga = "#2C2B3A"

      if vim.g.colors_name == "material" then
        local colors = require("material.colors")
        bg = colors.editor.bg
        bga = colors.editor.bg
      end

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
            icon = "▎", -- this should be omitted if indicator style is not 'icon'
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
    "kevinhwang91/nvim-ufo",
    dependencies = "kevinhwang91/promise-async",
    lazy = false,
    keys = {
      {
        "zR",
        function()
          require("ufo").openAllFolds()
        end,
      },
      {
        "zM",
        function()
          require("ufo").closeAllFolds()
        end,
      },
    },
    config = function()
      require("ufo").setup()
    end,
  },
}
