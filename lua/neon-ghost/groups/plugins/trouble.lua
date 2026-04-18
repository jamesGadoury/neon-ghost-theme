local M = {}

function M.get(p, cfg)
  local bg = cfg.transparent and p.none or p.bg_float
  return {
    TroubleNormal         = { fg = p.fg, bg = bg },
    TroubleNormalNC       = { fg = p.fg, bg = bg },
    TroubleText           = { fg = p.fg },
    TroubleSource         = { fg = p.fg_dim, style = { italic = true } },
    TroubleCode           = { fg = p.fg_mute },
    TroubleCount          = { fg = p.bg, bg = p.pink, style = { bold = true } },
    TroubleFoldIcon       = { fg = p.fg_mute },

    TroubleIndent         = { fg = p.border },
    TroubleIndentFoldClosed = { fg = p.pink },

    TroubleFileName       = { fg = p.pink, style = { bold = true } },
    TroublePos            = { fg = p.fg_mute },
    TroubleLocation       = { fg = p.fg_mute },

    TroubleDirectory      = { fg = p.blue, style = { bold = true } },
    TroubleIconDirectory  = { fg = p.blue },

    TroubleDiagnosticsError = { fg = p.red },
    TroubleDiagnosticsWarn  = { fg = p.yellow },
    TroubleDiagnosticsInfo  = { fg = p.cyan },
    TroubleDiagnosticsHint  = { fg = p.teal },

    TroublePreview        = { bg = p.bg_sel },
  }
end

return M
