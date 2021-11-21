-- Notify: https://github.com/rcarriga/nvim-notify
-- Get small and transient notify popups which history can later
-- be easy accessable through Telescope
require("notify").setup(
  {
    -- Animation style (see below for details)
    stages = "fade_in_slide_out",
    -- Function called when a new window is opened, use for changing win settings/config
    on_open = nil,
    -- Render function for notifications. See notify-render()
    render = "default",
    -- Default timeout for notifications
    timeout = 5000,
    -- For stages that change opacity this is treated as the highlight behind the window
    -- Set this to either a highlight group or an RGB hex value e.g. "#000000"
    background_colour = "Normal",
    -- Minimum width for notification windows
    minimum_width = 50,
    -- Icons for the different levels
    icons = {
      ERROR = "",
      WARN = "",
      INFO = "",
      DEBUG = "",
      TRACE = "✎"
    }
  }
)

-- Highlight
-- DEBUG
vim.cmd("hi NotifyDEBUGBorder guifg=#F70067")
vim.cmd("hi NotifyDEBUGIcon guifg=#F70067")
vim.cmd("hi NotifyDEBUGTitle  guifg=#F70067")
-- INFO
vim.cmd("hi NotifyINFOBorder guifg=#A9FF68")
vim.cmd("hi NotifyINFOIcon guifg=#A9FF68")
vim.cmd("hi NotifyINFOTitle guifg=#A9FF68")
-- Defaults
-- ERROR
-- highlight NotifyERRORBorder guifg=#8A1F1F
-- highlight NotifyERRORIcon guifg=#F70067
-- highlight NotifyERRORTitle  guifg=#F70067
-- TRACE
-- highlight NotifyTRACEBorder guifg=#4F3552
-- highlight NotifyTRACEIcon guifg=#D484FF
-- highlight NotifyTRACETitle  guifg=#D484FF
-- WARNING
-- highlight NotifyWARNBorder guifg=#79491D
-- highlight NotifyWARNIcon guifg=#F79000
-- highlight NotifyWARNTitle guifg=#F79000
--
-- highlight link NotifyDEBUGBody Normal
-- highlight link NotifyERRORBody Normal
-- highlight link NotifyINFOBody Normal
-- highlight link NotifyTRACEBody Normal
-- highlight link NotifyWARNBody Normal
