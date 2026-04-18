-- Lualine theme — returns a lualine-shaped table, not a highlight-groups map.
-- Users consume it via: require("lualine").setup({ options = { theme = "neon-ghost" } })
-- Lualine will auto-discover this module via `lua/lualine/themes/neon-ghost.lua`
-- (wired in lua/lualine/themes/neon-ghost.lua for resolution).

local M = {}

function M.build(p)
  local bg = p.hex.bg_alt
  local fg = p.hex.fg
  local fg_dim = p.hex.fg_dim

  return {
    normal = {
      a = { fg = p.hex.bg, bg = p.hex.pink,   gui = "bold" },
      b = { fg = p.hex.pink, bg = bg },
      c = { fg = fg_dim, bg = bg },
    },
    insert = {
      a = { fg = p.hex.bg, bg = p.hex.lime,   gui = "bold" },
      b = { fg = p.hex.lime, bg = bg },
      c = { fg = fg_dim, bg = bg },
    },
    visual = {
      a = { fg = p.hex.bg, bg = p.hex.purple, gui = "bold" },
      b = { fg = p.hex.purple, bg = bg },
      c = { fg = fg_dim, bg = bg },
    },
    replace = {
      a = { fg = p.hex.bg, bg = p.hex.red,    gui = "bold" },
      b = { fg = p.hex.red, bg = bg },
      c = { fg = fg_dim, bg = bg },
    },
    command = {
      a = { fg = p.hex.bg, bg = p.hex.yellow, gui = "bold" },
      b = { fg = p.hex.yellow, bg = bg },
      c = { fg = fg_dim, bg = bg },
    },
    terminal = {
      a = { fg = p.hex.bg, bg = p.hex.cyan,   gui = "bold" },
      b = { fg = p.hex.cyan, bg = bg },
      c = { fg = fg_dim, bg = bg },
    },
    inactive = {
      a = { fg = p.hex.fg_mute, bg = bg, gui = "bold" },
      b = { fg = p.hex.fg_mute, bg = bg },
      c = { fg = p.hex.fg_mute, bg = bg },
    },
  }
end

-- Returns nothing for the highlight-applying loop (it's a special module).
function M.get(_p, _cfg) return {} end

return M
