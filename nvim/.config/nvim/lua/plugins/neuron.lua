local neuron = require'neuron'
local neuronDir = "~/zettelkasten"
local Job = require("plenary/job")
-- local neuron_custom = require("plugins/neuronCustom")

-- these are all the default values
neuron.setup {
	virtual_titles = true,
	mappings = false,
	run = nil, -- function to run when in neuron dir
	neuron_dir = neuronDir, -- the directory of all of your notes, expanded by default (currently supports only one directory for notes, find a way to detect neuron.dhall to use any directory)
	leader = "gz", -- the leader key to for all mappings, remember with 'go zettel'
}

function open_obsidian()
  Job:new {
    command = "Obsidian",
    cwd = neuronDir,
  }:start()
end

-- See repo: https://github.com/oberblastmeister/neuron.nvim

-- " create a new note
-- nnoremap <buffer> gzn <cmd>lua require'neuron/cmd'.new_edit(require'neuron'/config.neuron_dir)<CR>
vim.api.nvim_set_keymap('n', 'gzN', string.format("<cmd>lua require'neuron/cmd'.new_edit( '%s' )<CR>", neuronDir), {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'gzn', "<cmd>lua require('plugins.neuronCustom').neuron_new()<CR>", {noremap = true})
-- gzn -> lua/plugin/neuronCustom.lua

-- click enter on [[my_link]] or [[[my_link]]] to enter it
vim.api.nvim_set_keymap('n', '<CR>', '<cmd>lua require"neuron".enter_link()<CR>', {noremap = true, silent = true})

-- " find your notes, click enter to create the note if there are not notes that match
vim.api.nvim_set_keymap('n', 'gzz', '<cmd>lua require"neuron/telescope".find_zettels()<CR>', {noremap = true, silent = true})

-- " insert the id of the note that is found
vim.api.nvim_set_keymap('n', 'gzl', "<cmd>lua require'neuron/telescope'.find_zettels {insert = true}<CR>", {noremap = true, silent = true})

-- " find the backlinks of the current note all the note that link this note
vim.api.nvim_buf_set_keymap(0, 'n', 'gzb', "<cmd>lua require'neuron/telescope'.find_backlinks()<CR>", {noremap = true, silent = true})

-- Server/GUI
-- " start the neuron server and render markdown, auto reload on save
vim.api.nvim_set_keymap('n', 'gzs', "<cmd>lua require'neuron'.rib {address = '127.0.0.1:8200', verbose = true}<CR>", {noremap = true, silent = true})

-- Start Obsidian from inside neovim
vim.api.nvim_set_keymap('n', 'gzo', "<cmd>lua open_obsidian()<CR>", {noremap = true, silent = true})


