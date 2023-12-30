---@diagnostic disable: undefined-global
local xplr = xplr

-- Tri-pane: tmux-like layout with three panes with preview (not color)
local function call(cmd)
	---@diagnostic disable: need-check-nil
	local p = io.popen(cmd, "r")
	local output = p:read("*a")
	p:close()
	return output
end

local function getParentDirectory(path)
	return path:match("(.+)/[^/]+$")
end

local function left_pane_renderer(ctx)
	local parent = getParentDirectory(ctx.app.pwd)
	local cmd = "exa --tree --level=1 --all --color=always " .. parent
	return { call(cmd) }
end

local function right_pane_renderer(ctx)
	local n = ctx.app.focused_node
	-- return n.absolute_path
	if n then
		if n.is_file then
			if string.match(n.mime_essence, "^image/") then
				return "IMAGE"
			elseif string.match(n.mime_essence, "^application/json") then
				-- local cmd = "prettier " .. n.absolute_path .. "| bat --color always  --language json"
				-- local cmd = "bat --color always  --language json " .. n.absolute_path
				-- return call(cmd)
				return "json"
			elseif string.match(n.mime_essence, "^application/") then
				return "APPLICATION"
			else
				-- local cmd = "bat --color always " .. n.absolute_path
				-- return call(cmd)
				return "File"
			end
		elseif n.is_dir then
			-- local cmd = "ls -al " .. n.absolute_path .. " | head --lines=50"
			local cmd = "exa --tree --level=1 --all --color=always " .. n.absolute_path
			return call(cmd)
		else
			return ""
		end
	else
		return ""
	end
end

local function setup()
	local plugin_dir = os.getenv("HOME") .. "/.config/xplr/plugins"
	package.path = plugin_dir .. "/tri-pane/init.lua;" .. package.path
	require("tri-pane").setup({
		layout_key = "T", -- In switch_layout mode
		as_default_layout = true,
		left_pane_width = { Percentage = 20 },
		middle_pane_width = { Percentage = 40 },
		right_pane_width = { Percentage = 40 },
		left_pane_renderer = left_pane_renderer,
		right_pane_renderer = right_pane_renderer,
	})
end

return { setup = setup }
