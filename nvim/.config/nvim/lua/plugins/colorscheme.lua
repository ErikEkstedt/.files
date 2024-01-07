-- stylua: ignore
-- since this is just an example spec, don't actually load anything here and return an empty spec

-- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins

local gruvbox = {
  "ellisonleao/gruvbox.nvim",
  dependencies = { "rcarriga/nvim-notify" },
  priority = 1000,
  lazy = true,
  config = function()
    require("gruvbox").setup({
      transparent_mode = true,
      dim_inactive = false,
      overrides = {
        NotifyBackground = { link = "GruvboxAqua" },
      },
    })
    require("notify").setup({
      background_colour = require("gruvbox").palette.dark0,
    })
  end,
}
-- vim.table_extend(plugin_list, gruvbox)

local kanagawa = {
  "rebelot/kanagawa.nvim",
  priority = 1000,
  lazy = false,
  config = function()
    -- Default options:
    require("kanagawa").setup({
      compile = false, -- enable compiling the colorscheme
      undercurl = true, -- enable undercurls
      commentStyle = { italic = true },
      keywordStyle = { italic = true },
      statementStyle = { bold = true },
      transparent = true, -- do not set background color
      dimInactive = true,
      overrides = function(colors)
        return {
          TelescopeBorder = { bg = "none" },
          Folded = { link = "NonText" },
          CursorLine = { bg = colors.theme.ui.bg_sel },
          WinSeparator = { fg = "#AAAAAA" },
          DiagnosticError = { fg = "#D55555" },
          DiagnosticSignError = { fg = "#D55555" },
        }
      end,
      colors = {
        theme = {
          all = {
            ui = {
              bg_gutter = "none",
            },
          },
        },
      },
      theme = "wave", -- Load "wave" theme when 'background' option is not set
    })

    require("lualine").setup({ options = { theme = "kanagawa" } })
  end,
}

return {
  gruvbox,
  kanagawa,
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "kanagawa",
    },
  },
}

-- return {
-- gruvbox,
-- {
--   "LazyVim/LazyVim",
--   opts = {
--     colorscheme = "gruvbox",
--   },
-- },
-- }
