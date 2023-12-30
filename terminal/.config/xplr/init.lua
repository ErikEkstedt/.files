version = "0.21.3"
-- Useful links
-- * https://xplr.dev/en/awesome-hacks
-- * https://xplr.dev/en/awesome-plugins
-- * https://github.com/sayanarijit/xplr/blob/dev/src/init.lua

---@diagnostic disable: undefined-global
local xplr = xplr

xplr.config.general.show_hidden = true
xplr.config.general.enforce_bounded_index_navigation = true

xplr.config.general.focus_ui.prefix = " " -- "▸ "
xplr.config.general.focus_ui.suffix = ""
xplr.config.general.table.header.cols = {
	{ format = " index", style = {} },
	{ format = "Path", style = {} },
	-- { format = "┌Path", style = {} },
	-- { format = "╭ Path", style = {} },
	{ format = "perm", style = {} },
	{ format = "size", style = {} },
	{ format = "modified", style = {} },
}
xplr.config.general.table.tree = {
	{ format = "", style = {} },
	{ format = "", style = {} },
	{ format = "", style = {} },
	-- { format = "├", style = {} },
	-- { format = "├", style = {} },
	-- { format = "╰", style = {} },
	-- { format = "└", style = {} },
}

------------------------------------------------
-- UI
------------------------------------------------
xplr.config.node_types.directory.meta.icon = xplr.util.paint(" ", { fg = { Indexed = 74 } })

------------------------------------------------
-- Plugins
------------------------------------------------
local plugin_dir = os.getenv("HOME") .. "/.config/xplr/plugins"

package.path = plugin_dir .. "/ranger/init.lua;" .. package.path
require("ranger").setup()

-- Web Devicons: adding icons and colors to filetype
package.path = plugin_dir .. "/web-devicons/init.lua;" .. package.path
require("web-devicons").setup()

-- FZF
package.path = plugin_dir .. "/fzf/init.lua;" .. package.path
require("fzf").setup({
	mode = "default",
	key = "ctrl-f",
	bin = "fzf",
	args = "--preview 'bat --color always {}'",
	recursive = true, -- If true, search all files under $PWD
	enter_dir = true, -- Enter if the result is directory
})

require("fzf").setup({
	mode = "default",
	key = "ctrl-o",
	bin = "fzf",
	args = "--preview 'bat --color always {}'",
	recursive = true, -- If true, search all files under $PWD
	enter_dir = true, -- Enter if the result is directory
})
