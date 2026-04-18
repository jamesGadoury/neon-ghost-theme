local config = require("neon-ghost.config")

local M = {}

function M.setup(user_opts)
  config.apply(user_opts)
end

function M.load()
  if vim.g.colors_name then
    vim.cmd("highlight clear")
  end
  if vim.fn.exists("syntax_on") == 1 then
    vim.cmd("syntax reset")
  end
  vim.o.termguicolors = true
  vim.g.colors_name = "neon-ghost"
  vim.o.background = "dark"

  local palette = require("neon-ghost.palette")
  local groups  = require("neon-ghost.groups")

  groups.apply(palette, config.options)
  if config.options.terminal_colors then
    groups.terminal(palette)
  end
end

-- Convenience passthrough for users who want the lualine theme as a table
-- instead of going through lualine's theme resolution.
M.lualine = setmetatable({}, {
  __call = function()
    local palette = require("neon-ghost.palette")
    return require("neon-ghost.groups.plugins.lualine").build(palette)
  end,
})

return M
