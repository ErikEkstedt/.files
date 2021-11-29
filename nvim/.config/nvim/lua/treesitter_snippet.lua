local ts_utils = require "nvim-treesitter.ts_utils"

local M = {}

local FuncNames = {"local_function", "function", "function_definition"}

local function split_string(inputstr, sep)
  if sep == nil then
    sep = "%s"
  end
  local t = {}
  for str in string.gmatch(inputstr, "([^" .. sep .. "]+)") do
    table.insert(t, str)
  end
  return t
end

local function node_is_func(node)
  for _, name in pairs(FuncNames) do
    if node:type() == name then
      return true
    end
  end
  return false
end

local function get_function_node()
  local node = ts_utils.get_node_at_cursor()
  if not node then
    return nil
  end

  local parent = node:parent()
  if not parent then
    return nil
  end
  local func_node

  if node_is_func(node) then
    func_node = node
  elseif node_is_func(parent) then
    func_node = parent
  else
    while not node_is_func(parent) and parent do
      parent = parent:parent()
      if node_is_func(parent) then
        func_node = parent
        break
      end
    end
  end
  return func_node
end

function M.get_docstring_arguments()
  local bufnr = vim.api.nvim_win_get_buf(0)
  local func_node = get_function_node()
  if not func_node then
    return nil
  end
  local identifier, params

  -- local children = func_node:iter_children()
  for child in func_node:iter_children() do
    if child:type() == "identifier" then
      identifier = ts_utils.get_node_text(child, bufnr)[1]
    elseif child:type() == "function_name" then
      for inner_child in child:iter_children() do
        if inner_child:type() == "function_name_field" then
          for in_child in inner_child:iter_children() do
            if in_child:type() == "property_identifier" then
              identifier = ts_utils.get_node_text(in_child, bufnr)[1]
            end
          end
        end
      end
    elseif child:type() == "parameters" then
      -- remove paranthesis and split on ','
      params = ts_utils.get_node_text(child, bufnr)[1]
      params = params:gsub("%(", "")
      params = params:gsub("%)", "")
      params = params:gsub("%s+", "")
      params = split_string(params, ",")
    end
  end

  return {identifier = identifier, params = params}
end

return M
