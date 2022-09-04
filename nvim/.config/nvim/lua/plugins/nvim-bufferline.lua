local fill = "#050505"
local bg = "#151515"
-- local sbg = "#303030"
local sbg = "none"

require("bufferline").setup {
  options = {
    view = "multiwindow",
    numbers = "none",
    buffer_close_icon = "",
    modified_icon = "●",
    close_icon = "",
    left_trunc_marker = "",
    right_trunc_marker = "",
    max_name_length = 25,
    max_prefix_length = 15,
    tab_size = 22,
    -- diagnostics = "nvim_lsp",
    show_buffer_close_icons = true,
    show_close_icon = true,
    show_tab_indicators = false,
    separator_style = "thin",
    enforce_regular_tabs = true,
    always_show_bufferline = true,
    offsets = {
      {
        filetype = "NvimTree",
        text = function()
          return vim.fn.getcwd()
        end,
        highlight = "Directory",
        text_align = "left"
      }
    },
    highlights = {
      -- Selected
      tab_selected = {gb = sbg},
      buffer_selected = {gb = sbg},
      close_button_selected = {gb = sbg},
      separator_selected = {gb = sbg},
      indicator_selected = {fg = "#00b5ff", gb = sbg},
      modified_selected = {gb = sbg},
      -- Others
      fill = {gb = fill},
      background = {gb = bg},
      tab = {gb = bg},
      tab_close = {gb = bg},
      buffer_visible = {gb = bg},
      close_button = {gb = bg},
      close_button_visible = {gb = bg},
      duplicate = {gb = bg},
      modified = {gb = bg},
      modified_visible = {gb = bg},
      separator = {gb = fill},
      pick = {fg = "#fff755", gui = "bold"},
      -- lsp selected
      diagnostic_selected = {gb = sbg},
      hint_selected = {gb = sbg},
      hint_diagnostic_selected = {gb = sbg},
      info_selected = {gb = sbg},
      info_diagnostic_selected = {gb = sbg},
      warning_selected = {gb = sbg},
      warning_diagnostic_selected = {gb = sbg},
      error_selected = {gb = sbg},
      error_diagnostic_selected = {gb = sbg},
      -- lsp other
      diagnostic = {gb = bg},
      diagnostic_visible = {gb = bg},
      hint = {gb = bg},
      hint_visible = {gb = bg},
      hint_diagnostic = {gb = bg},
      hint_diagnostic_visible = {gb = bg},
      info = {gb = bg},
      info_visible = {gb = bg},
      info_diagnostic = {gb = bg},
      info_diagnostic_visible = {gb = bg},
      warning = {gb = bg},
      warning_visible = {gb = bg},
      warning_diagnostic = {gb = bg},
      warning_diagnostic_visible = {gb = bg},
      error = {gb = bg},
      error_visible = {gb = bg},
      error_diagnostic = {gb = bg},
      error_diagnostic_visible = {gb = bg}
    }
  }
  -- TODO: Not working: see :help bufferline-offset
}

vim.api.nvim_set_keymap("n", "<Space>m", ":BufferLinePick<CR>", {noremap = true, silent = true})
