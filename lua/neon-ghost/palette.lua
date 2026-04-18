-- neon-ghost palette
-- Single source of truth for every color used by the theme.
-- gui = 24-bit truecolor hex.  cterm = nearest xterm-256 index for fallback.

local function attach_hex(p)
  p.hex = setmetatable({}, {
    __index = function(_, k)
      local v = rawget(p, k)
      if type(v) == "table" then return v.gui end
      return nil
    end,
  })
  return p
end

-- Default: cohesive neon-on-dark, tuned for long sessions.
local default = attach_hex({
  bg        = { gui = "#0b0b14", cterm = 232 },
  bg_alt    = { gui = "#12121e", cterm = 233 },
  bg_float  = { gui = "#17172a", cterm = 234 },
  bg_line   = { gui = "#14141f", cterm = 233 },
  bg_sel    = { gui = "#2a2345", cterm = 237 },
  border    = { gui = "#2d2a4a", cterm = 238 },

  fg        = { gui = "#e8e6ff", cterm = 255 },
  fg_dim    = { gui = "#a8a6c8", cterm = 249 },
  fg_mute   = { gui = "#6a6890", cterm = 242 },
  comment   = { gui = "#5a5878", cterm = 240 },

  pink      = { gui = "#ff3fb8", cterm = 199 },
  cyan      = { gui = "#00e5ff", cterm = 51  },
  purple    = { gui = "#b07bff", cterm = 141 },
  lime      = { gui = "#7dff6a", cterm = 119 },
  orange    = { gui = "#ff9e4a", cterm = 215 },
  yellow    = { gui = "#ffcc00", cterm = 220 },
  blue      = { gui = "#4fc3ff", cterm = 75  },
  red       = { gui = "#ff486f", cterm = 203 },
  teal      = { gui = "#2ee6c0", cterm = 49  },

  diag_error_bg = { gui = "#2a1220", cterm = 235 },
  diag_warn_bg  = { gui = "#2a2415", cterm = 235 },
  diag_info_bg  = { gui = "#12222a", cterm = 235 },
  diag_hint_bg  = { gui = "#12281f", cterm = 235 },

  none      = { gui = "NONE", cterm = "NONE" },
})

-- Flashy: deeper blacks, max-saturation neon accents. Classic synthwave/
-- cyberpunk feel — higher contrast, "glowier" everything. Consumers get
-- the same keys, so every highlight file works without modification.
local flashy = attach_hex({
  bg        = { gui = "#05050c", cterm = 232 },
  bg_alt    = { gui = "#0c0c18", cterm = 233 },
  bg_float  = { gui = "#13132a", cterm = 234 },
  bg_line   = { gui = "#0e0e1a", cterm = 233 },
  bg_sel    = { gui = "#3a1a55", cterm = 54  },   -- magenta-tinted selection
  border    = { gui = "#3d2a6e", cterm = 60  },

  fg        = { gui = "#f5f3ff", cterm = 255 },   -- brighter white
  fg_dim    = { gui = "#b8b5d8", cterm = 249 },
  fg_mute   = { gui = "#7a76a8", cterm = 243 },
  comment   = { gui = "#6b6a95", cterm = 60  },   -- brighter italic comments — "lit" feel

  pink      = { gui = "#ff00aa", cterm = 199 },   -- hot pink, peak
  cyan      = { gui = "#00ffff", cterm = 51  },   -- pure neon cyan
  purple    = { gui = "#c77dff", cterm = 141 },   -- brighter violet
  lime      = { gui = "#39ff14", cterm = 46  },   -- classic neon green
  orange    = { gui = "#ff7f00", cterm = 208 },   -- vivid orange
  yellow    = { gui = "#fff000", cterm = 226 },   -- pure neon yellow
  blue      = { gui = "#29b6ff", cterm = 39  },
  red       = { gui = "#ff003c", cterm = 197 },
  teal      = { gui = "#00ffcc", cterm = 49  },

  diag_error_bg = { gui = "#3a0a20", cterm = 235 },
  diag_warn_bg  = { gui = "#3a3210", cterm = 235 },
  diag_info_bg  = { gui = "#0a2238", cterm = 235 },
  diag_hint_bg  = { gui = "#0a2a20", cterm = 235 },

  none      = { gui = "NONE", cterm = "NONE" },
})

-- Expose the default at the module top level for back-compat with any
-- consumer that does `require("neon-ghost.palette").pink` directly.
for k, v in pairs(default) do if k ~= "hex" then default[k] = v end end

function default.with_style(style)
  if style == "flashy" then return flashy end
  return default
end

default.variants = { default = default, flashy = flashy }

return default
