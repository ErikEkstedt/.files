local gruvbox = {
  "ellisonleao/gruvbox.nvim",
  -- dependencies = { "rcarriga/nvim-notify" },
  lazy = false,
  priority = 1000,
  config = function()
    require("gruvbox").setup({
      transparent_mode = true,
      dim_inactive = true,
      overrides = {
        NotifyBackground = { link = "GruvboxAqua" },
      },
    })
    vim.cmd([[colorscheme gruvbox]])
    -- require("notify").setup({
    --   background_colour = require("gruvbox").palette.dark0,
    -- })
  end,
}

local kanagawa = {
  "rebelot/kanagawa.nvim",
  lazy = false,
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
          WinSeparator = { fg = "#999999" },
          DiagnosticError = { fg = "#D55555" },
          DiagnosticSignError = { fg = "#D55555" },
          Pmenu = { bg = "#242430" },
          PmenuSel = { bg = "#46445E" },
          -- update kanagawa to handle new treesitter highlight captures
          ["@string.regexp"] = { link = "@string.regex" },
          ["@variable.parameter"] = { link = "@parameter" },
          ["@exception"] = { link = "@exception" },
          ["@string.special.symbol"] = { link = "@symbol" },
          ["@markup.strong"] = { link = "@text.strong" },
          ["@markup.italic"] = { link = "@text.emphasis" },
          ["@markup.heading"] = { link = "@text.title" },
          ["@markup.raw"] = { link = "@text.literal" },
          ["@markup.quote"] = { link = "@text.quote" },
          ["@markup.math"] = { link = "@text.math" },
          ["@markup.environment"] = { link = "@text.environment" },
          ["@markup.environment.name"] = { link = "@text.environment.name" },
          ["@markup.link.url"] = { link = "Special" },
          ["@markup.link.label"] = { link = "Identifier" },
          ["@comment.note"] = { link = "@text.note" },
          ["@comment.warning"] = { link = "@text.warning" },
          ["@comment.danger"] = { link = "@text.danger" },
          ["@diff.plus"] = { link = "@text.diff.add" },
          ["@diff.minus"] = { link = "@text.diff.delete" },
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
  -- gruvbox,
}
