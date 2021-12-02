require("gitsigns").setup {
  signs = {
    add = {hl = "GitSignsAdd", text = "│"},
    change = {hl = "GitSignsChange", text = "│"},
    delete = {hl = "GitsignsDelete", text = "│"},
    topdelete = {hl = "GitSignsDelete", text = "│"},
    changedelete = {hl = "GitSignsChange", text = "│"}
  },
  numhl = false,
  linehl = false,
  keymaps = {}
}
