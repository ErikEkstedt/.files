local highlights = function()
  local fg = "#ffffff"
  local bg = "#303030"
  local sbg = "#454545"
  -- local sbg = "#355535"
  local text = "#717171"
  local sep = "#515151"

  return {
    background = {
      bg = bg,
      fg = text
    },
    diagnostic = {
      bg = bg
    },
    duplicate = {
      bg = bg
    },
    close_button = {
      bg = bg
    },
    modified = {
      bg = bg
    },
    separator = {
      bg = "#212121",
      fg = "#212121"
      -- bg = bg,
      -- fg = sep
    },
    pick = {
      bg = bg,
      fg = "#c3e88d"
    },
    offset_separator = {
      -- bg = "black",
      -- fg = "black"
      bg = bg,
      fg = fg
    },
    -- SELECTED
    indicator_selected = {
      bg = sbg,
      fg = fg
    },
    buffer_selected = {
      bg = sbg,
      fg = fg,
      bold = true
    },
    close_button_selected = {
      bg = sbg
    },
    diagnostic_selected = {
      bg = sbg
    },
    modified_selected = {
      bg = sbg
    },
    separator_selected = {
      bg = sbg,
      fg = sep
    },
    duplicate_selected = {
      bg = sbg,
      fg = fg,
      bold = true
    },
    pick_selected = {
      bg = bg,
      fg = "#c3e88d"
    },
    -- Visible
    close_button_visible = {
      bg = bg
    },
    separator_visible = {
      bg = bg,
      fg = sep
    },
    buffer_visible = {
      bg = bg
    },
    duplicate_visible = {
      bg = bg
    },
    indicator_visible = {
      bg = bg
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
