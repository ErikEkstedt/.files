-- local gruvbox = {
--   "ellisonleao/gruvbox.nvim",
--   dependencies = { "rcarriga/nvim-notify" },
--   priority = 1000,
--   config = function()
--     require("gruvbox").setup({
--       transparent_mode = true,
--       dim_inactive = false,
--       overrides = {
--         NotifyBackground = { link = "GruvboxAqua" },
--       },
--     })
--     require("notify").setup({
--       background_colour = require("gruvbox").palette.dark0,
--     })
--   end,
-- }

local kanagawa = {
  "rebelot/kanagawa.nvim",
  lazy=false,
  priority = 1000,
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
    vim.cmd([[colorscheme kanagawa]])
    -- require("lualine").setup({ options = { theme = "kanagawa" } })
  end,
}

return {
  kanagawa,
}

