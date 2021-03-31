local treesitter = require'nvim-treesitter.configs'

treesitter.setup {
  ensure_installed = {
    'c', 'cpp', 'dart', 'go', 'html', 'java', 'javascript', 'python', 'ruby',
    'rust', 'typescript', 'lua'
  },
  highlight = {
    enable = true
  }
}
