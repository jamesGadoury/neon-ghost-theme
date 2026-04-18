-- neon-ghost palette
-- Single source of truth for every color used by the theme.
-- gui = 24-bit truecolor hex.  cterm = nearest xterm-256 index for fallback.

local P = {
  -- surfaces (cool-violet dark)
  bg        = { gui = "#0b0b14", cterm = 232 },
  bg_alt    = { gui = "#12121e", cterm = 233 },
  bg_float  = { gui = "#17172a", cterm = 234 },
  bg_line   = { gui = "#14141f", cterm = 233 },
  bg_sel    = { gui = "#2a2345", cterm = 237 },
  border    = { gui = "#2d2a4a", cterm = 238 },

  -- foregrounds
  fg        = { gui = "#e8e6ff", cterm = 255 },
  fg_dim    = { gui = "#a8a6c8", cterm = 249 },
  fg_mute   = { gui = "#6a6890", cterm = 242 },
  comment   = { gui = "#5a5878", cterm = 240 },

  -- neon accents
  pink      = { gui = "#ff3fb8", cterm = 199 },
  cyan      = { gui = "#00e5ff", cterm = 51  },
  purple    = { gui = "#b07bff", cterm = 141 },
  lime      = { gui = "#7dff6a", cterm = 119 },
  orange    = { gui = "#ff9e4a", cterm = 215 },
  yellow    = { gui = "#ffe867", cterm = 227 },
  blue      = { gui = "#4fc3ff", cterm = 75  },
  red       = { gui = "#ff486f", cterm = 203 },
  teal      = { gui = "#2ee6c0", cterm = 49  },

  -- diagnostic-bg tints (blended 15% with bg)
  diag_error_bg = { gui = "#2a1220", cterm = 235 },
  diag_warn_bg  = { gui = "#2a2415", cterm = 235 },
  diag_info_bg  = { gui = "#12222a", cterm = 235 },
  diag_hint_bg  = { gui = "#12281f", cterm = 235 },

  none      = { gui = "NONE", cterm = "NONE" },
}

-- Shorthand: palette.hex gives just gui strings for callers that don't care about cterm.
P.hex = setmetatable({}, {
  __index = function(_, k)
    local v = rawget(P, k)
    if type(v) == "table" then return v.gui end
    return nil
  end,
})

return P
