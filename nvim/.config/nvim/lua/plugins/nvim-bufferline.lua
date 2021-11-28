local bufferline = require("bufferline")
local bg = "#151515"
local sbg = "#505050"

bufferline.setup {
  options = {
    view = "multiwindow",
    numbers = "none",
    buffer_close_icon = "",
    modified_icon = "●",
    close_icon = "",
    -- left_trunc_marker = "",
    -- right_trunc_marker = "",
    max_name_length = 18,
    max_prefix_length = 0,
    tab_size = 18,
    diagnostics = "nvim_lsp",
    show_buffer_close_icons = true,
    show_close_icon = true,
    show_tab_indicators = true,
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
    fill = {guibg = "#050505"},
    background = {guibg = bg},
    tab = {guibg = bg},
    tab_selected = {guibg = sbg},
    tab_close = {guibg = bg},
    buffer_visible = {guibg = bg},
    buffer_selected = {guibg = sbg},
    close_button = {guibg = bg},
    close_button_visible = {guibg = bg},
    close_button_selected = {guibg = sbg},
    diagnostic = {guibg = bg},
    diagnostic_selected = {guibg = bg},
    duplicate = {guibg = bg},
    info = {guibg = bg},
    info_visible = {guibg = bg},
    info_diagnostic = {guibg = bg},
    modified = {guibg = bg},
    separator = {guibg = "#050505"},
    separator_selected = {guibg = sbg},
    indicator_selected = {guifg = "#00b5ff", guibg = sbg},
    pick = {guifg = "#fff755", gui = "bold"}
  }
}

vim.api.nvim_set_keymap("n", "<Space>m", ":BufferLinePick<CR>", {noremap = true, silent = true})
