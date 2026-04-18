local util = require("neon-ghost.util")

local M = {}

local core_modules = {
  "editor",
  "syntax",
  "treesitter",  -- gated by integrations.treesitter (but always useful)
  "lsp",         -- gated by integrations.lsp
}

local plugin_modules = {
  telescope        = "telescope",
  cmp              = "cmp",
  nvim_tree        = "nvim_tree",
  neo_tree         = "neo_tree",
  gitsigns         = "gitsigns",
  trouble          = "trouble",
  indent_blankline = "indent_blankline",
  -- lualine is consumed via lua/lualine/themes/ directly — no HL groups here.
}

local function merge(target, src)
  for k, v in pairs(src) do target[k] = v end
end

function M.apply(palette, cfg)
  local all = {}

  merge(all, require("neon-ghost.groups.editor").get(palette, cfg))
  merge(all, require("neon-ghost.groups.syntax").get(palette, cfg))
  if cfg.integrations.treesitter then
    merge(all, require("neon-ghost.groups.treesitter").get(palette, cfg))
  end
  if cfg.integrations.lsp then
    merge(all, require("neon-ghost.groups.lsp").get(palette, cfg))
  end

  for key, mod in pairs(plugin_modules) do
    if cfg.integrations[key] then
      merge(all, require("neon-ghost.groups.plugins." .. mod).get(palette, cfg))
    end
  end

  util.apply(all)
end

function M.terminal(palette)
  local g = vim.g
  g.terminal_color_0  = palette.hex.bg
  g.terminal_color_1  = palette.hex.red
  g.terminal_color_2  = palette.hex.lime
  g.terminal_color_3  = palette.hex.yellow
  g.terminal_color_4  = palette.hex.blue
  g.terminal_color_5  = palette.hex.pink
  g.terminal_color_6  = palette.hex.cyan
  g.terminal_color_7  = palette.hex.fg
  g.terminal_color_8  = palette.hex.fg_mute
  g.terminal_color_9  = palette.hex.red
  g.terminal_color_10 = palette.hex.lime
  g.terminal_color_11 = palette.hex.yellow
  g.terminal_color_12 = palette.hex.blue
  g.terminal_color_13 = palette.hex.purple
  g.terminal_color_14 = palette.hex.teal
  g.terminal_color_15 = palette.hex.fg
end

return M
