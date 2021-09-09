require("bufferline").setup {
  options = {
    view = "multiwindow",
    numbers = "none",
    buffer_close_icon = "",
    modified_icon = "●",
    close_icon = "",
    left_trunc_marker = "",
    right_trunc_marker = "",
    max_name_length = 18,
    max_prefix_length = 15,
    tab_size = 18,
    diagnostics = "nvim_lsp",
    show_buffer_close_icons = true,
    show_close_icon = true,
    show_tab_indicators = true,
    separator_style = "thin",
    enforce_regular_tabs = false,
    always_show_bufferline = true
  },
  highlights = {
    indicator_selected = {
      guifg = "#00b5ff"
    },
    pick = {
      guifg = "#fff755",
      gui = "bold"
    }
  }
}

vim.api.nvim_set_keymap("n", "<Space>m", ":BufferLinePick<CR>", {noremap = true, silent = true})
