local M = {}

local api = vim.api

local function cmd_string(cmd_arg)
  return [[<cmd>]] .. cmd_arg .. [[<cr>]]
end

local function str_to_tbl(v)
  if type(v) == "string" then
    v = { v }
  end
  return v
end

function M.create_cmd(command, f, opts)
  opts = opts or {}
  api.nvim_create_user_command(command, f, opts)
end

function M.lazy_map(lhs, rhs, modes)
  if type(rhs) == "string" then
    rhs = cmd_string(rhs)
  end
  modes = str_to_tbl(modes) or { "n" }
  return {
    lhs,
    rhs,
    mode = modes,
  }
end

return M
