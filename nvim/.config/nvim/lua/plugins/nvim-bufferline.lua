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
    always_show_bufferline = true
  },
  -- TODO: Not working: see :help bufferline-offset
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
    tab_selected = {guibg = sbg},
    buffer_selected = {guibg = sbg},
    close_button_selected = {guibg = sbg},
    separator_selected = {guibg = sbg},
    indicator_selected = {guifg = "#00b5ff", guibg = sbg},
    modified_selected = {guibg = sbg},
    -- Others
    fill = {guibg = fill},
    background = {guibg = bg},
    tab = {guibg = bg},
    tab_close = {guibg = bg},
    buffer_visible = {guibg = bg},
    close_button = {guibg = bg},
    close_button_visible = {guibg = bg},
    duplicate = {guibg = bg},
    modified = {guibg = bg},
    modified_visible = {guibg = bg},
    separator = {guibg = fill},
    pick = {guifg = "#fff755", gui = "bold"},
    -- lsp selected
    diagnostic_selected = {guibg = sbg},
    hint_selected = {guibg = sbg},
    hint_diagnostic_selected = {guibg = sbg},
    info_selected = {guibg = sbg},
    info_diagnostic_selected = {guibg = sbg},
    warning_selected = {guibg = sbg},
    warning_diagnostic_selected = {guibg = sbg},
    error_selected = {guibg = sbg},
    error_diagnostic_selected = {guibg = sbg},
    -- lsp other
    diagnostic = {guibg = bg},
    diagnostic_visible = {guibg = bg},
    hint = {guibg = bg},
    hint_visible = {guibg = bg},
    hint_diagnostic = {guibg = bg},
    hint_diagnostic_visible = {guibg = bg},
    info = {guibg = bg},
    info_visible = {guibg = bg},
    info_diagnostic = {guibg = bg},
    info_diagnostic_visible = {guibg = bg},
    warning = {guibg = bg},
    warning_visible = {guibg = bg},
    warning_diagnostic = {guibg = bg},
    warning_diagnostic_visible = {guibg = bg},
    error = {guibg = bg},
    error_visible = {guibg = bg},
    error_diagnostic = {guibg = bg},
    error_diagnostic_visible = {guibg = bg}
  }
}

vim.api.nvim_set_keymap("n", "<Space>m", ":BufferLinePick<CR>", {noremap = true, silent = true})
