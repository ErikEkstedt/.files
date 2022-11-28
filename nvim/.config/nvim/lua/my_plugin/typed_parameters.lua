local params_ts_query = vim.treesitter.parse_query("python", [[ 
(function_definition
  (parameters) @param
)
]])

local get_root = function(bufnr)
  local parser = vim.treesitter.get_parser(bufnr, "python", {})
  local tree = parser:parse()[1]
  return tree:root()
end

local format_params = function(bufnr)
  bufnr = bufnr or vim.api.nvim_get_current_buf()

  -- only do this in python files
  if vim.bo[bufnr].filetype ~= "python" then
    vim.notify "can only be used in python"
    return
  end

  local root = get_root(bufnr)

  local changes = {}

  -- Iterate over all captures `(identifier) @capture` from the ts-query
  for id, node in params_ts_query:iter_captures(root, bufnr, 0, -1) do
    local name = params_ts_query.captures[id]
    if name == "param" then
      -- { start_row, start_col, end_row, end_col}
      local range = { node:range() }
      -- vim.notify(vim.inspect(range))

      local text = vim.treesitter.get_node_text(node, bufnr)

      -- check if params are not empty
      if text ~= "()" then
        -- vim.notify(vim.inspect(text))

        -- we simply uppercase to see effect
        local formatted = string.upper(text)

        -- vim.notify(vim.inspect(formatted))
        -- vim.notify(vim.inspect(range))

        -- Insert the changes to be made in a reverted list
        table.insert(changes, 1, { range = range, formatted = formatted })
      end
    end
  end

  -- Write all the changes to buffer
  for _, change in ipairs(changes) do
    -- local cmd = { bufnr, change.start, change.final, false, change.formatted }
    -- local cmd = { bufnr, change.start, change.final, false, "hello" }
    -- vim.notify(vim.inspect(cmd))
    -- { start_row, start_col, end_row, end_col}
    vim.api.nvim_buf_set_text(
      bufnr,
      change.range[1],
      change.range[2],
      change.range[3],
      change.range[4],
      { change.formatted }
    )
  end
end

vim.api.nvim_create_user_command(
  "TypeParams",
  function()
    format_params()
  end,
  {}
)
