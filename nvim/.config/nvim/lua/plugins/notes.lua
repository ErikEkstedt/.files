-- 1. Search for file in $NOTE_DIR
-- 2. Open a note
-- 3. Create a new note
-- Zettelkasten functionality?
local M = {}

-- TODO: set by $PATH or default
M.notes_dir = vim.fn.expand("$HOME/.notes")

-- function M.open_obsidian()
--   print("Open Obsidian")
--   -- Linux/MacOs
--   require("plenary/job")
--     :new({
--       command = "Obsidian",
--       cwd = vim.g.notes_dir,
--     })
--     :start()
-- end

-----------------------------------------------------------------
-- Keymaps
-----------------------------------------------------------------
local ns = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>fnw", function()
  require("telescope.builtin").live_grep({
    prompt_title = "< Notes (words) >",
    cwd = M.notes_dir,
  })
end, ns)

vim.keymap.set("n", "<leader>fno", function()
  require("telescope.builtin").find_files({
    prompt_title = "< Notes >",
    cwd = M.notes_dir,
    find_command = {
      "fd",
      "--type",
      "file",
      "-e",
      ".md",
    },
  })
end, ns)

return {}
