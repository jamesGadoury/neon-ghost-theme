local M = {}

function M.get(p, cfg)
  local bg_float = cfg.transparent and p.none or p.bg_float
  local bg_prompt = cfg.transparent and p.none or p.bg_alt
  return {
    TelescopeNormal         = { fg = p.fg, bg = bg_float },
    TelescopeBorder         = { fg = p.border, bg = bg_float },
    TelescopeTitle          = { fg = p.pink, bg = bg_float, style = { bold = true } },

    TelescopePromptNormal   = { fg = p.fg, bg = bg_prompt },
    TelescopePromptBorder   = { fg = p.cyan, bg = bg_prompt },
    TelescopePromptTitle    = { fg = p.bg, bg = p.cyan, style = { bold = true } },
    TelescopePromptPrefix   = { fg = p.pink, bg = bg_prompt },
    TelescopePromptCounter  = { fg = p.fg_dim, bg = bg_prompt },

    TelescopeResultsNormal  = { fg = p.fg, bg = bg_float },
    TelescopeResultsBorder  = { fg = p.border, bg = bg_float },
    TelescopeResultsTitle   = { fg = bg_float, bg = bg_float },

    TelescopePreviewNormal  = { fg = p.fg, bg = bg_float },
    TelescopePreviewBorder  = { fg = p.border, bg = bg_float },
    TelescopePreviewTitle   = { fg = p.bg, bg = p.lime, style = { bold = true } },

    TelescopeSelection      = { fg = p.fg, bg = p.bg_sel, style = { bold = true } },
    TelescopeSelectionCaret = { fg = p.pink, bg = p.bg_sel },
    TelescopeMultiSelection = { fg = p.purple, bg = p.bg_sel },
    TelescopeMultiIcon      = { fg = p.lime },

    TelescopeMatching       = { fg = p.pink, style = { bold = true } },
    TelescopePromptMatching = { fg = p.pink, style = { bold = true } },

    TelescopeResultsComment = { fg = p.comment, style = { italic = true } },
    TelescopeResultsLineNr  = { fg = p.fg_mute },
    TelescopeResultsIdentifier = { fg = p.cyan },
    TelescopeResultsNumber  = { fg = p.orange },
  }
end

return M
