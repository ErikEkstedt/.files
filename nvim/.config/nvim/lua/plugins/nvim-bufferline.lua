local highlights = function()
  local fg = "#ffffff"
  local bg = "#303030"
  local text = "#717171"
  local sep = "#515151"
  return {
    background = {
      bg = bg,
      fg = text
    },
    buffer_selected = {
      bg = bg,
      fg = fg,
      bold = true
    },
    separator = {
      bg = bg,
      fg = sep
    },
    separator_visible = {
      bg = bg,
      fg = sep
    },
    separator_selected = {
      bg = bg,
      fg = sep,
      bold = true
    },
    buffer_visible = {
      bg = bg
    },
    close_button = {
      bg = bg
    },
    close_button_selected = {
      bg = bg
    },
    duplicate = {
      bg = bg
    },
    duplicate_selected = {
      bg = bg,
      fg = fg,
      bold = true
    },
    duplicate_visible = {
      bg = bg
    },
    diagnostic = {
      bg = bg
    },
    diagnostic_selected = {
      bg = bg
    },
    indicator_visible = {
      bg = bg
    },
    indicator_selected = {
      bg = bg,
      fg = fg
    },
    modified = {
      bg = bg
    },
    modified_selected = {
      bg = bg
    },
    offset_separator = {
      bg = bg,
      fg = fg
    },
    pick_selected = {
      bg = bg,
      fg = "#c3e88d"
    },
    pick = {
      bg = bg,
      fg = "#c3e88d"
    }
  }
end
return {
  "akinsho/nvim-bufferline.lua",
  dependencies = "kyazdani42/nvim-web-devicons",
  config = function()
    require("bufferline").setup(
      {
        options = {
          always_show_bufferline = true,
          buffer_close_icon = "",
          modified_icon = "●",
          close_icon = "",
          left_trunc_marker = "",
          right_trunc_marker = "",
          separator_style = {"┃", "┃"},
          show_tab_indicators = false,
          indicator = {
            -- icon = "┃",
            -- icon = "█ ",
            style = "none"
          }
        },
        highlights = highlights
      }
    )
    vim.api.nvim_set_keymap("n", "<Space>m", ":BufferLinePick<CR>", {noremap = true, silent = true})
  end
}
