local M = {}

function M.get(p, cfg)
  local bg = cfg.transparent and p.none or p.bg_alt
  return {
    NeoTreeNormal           = { fg = p.fg, bg = bg },
    NeoTreeNormalNC         = { fg = p.fg, bg = bg },
    NeoTreeEndOfBuffer      = { fg = bg, bg = bg },
    NeoTreeVertSplit        = { fg = p.border, bg = bg },
    NeoTreeWinSeparator     = { fg = p.border, bg = bg },
    NeoTreeRootName         = { fg = p.pink, style = { bold = true } },
    NeoTreeDirectoryName    = { fg = p.blue },
    NeoTreeDirectoryIcon    = { fg = p.blue },
    NeoTreeIndentMarker     = { fg = p.border },
    NeoTreeExpander         = { fg = p.fg_mute },
    NeoTreeSymbolicLinkTarget = { fg = p.teal },
    NeoTreeCursorLine       = { bg = p.bg_sel },
    NeoTreeFloatBorder      = { fg = p.border, bg = p.bg_float },
    NeoTreeFloatTitle       = { fg = p.pink, bg = p.bg_float, style = { bold = true } },
    NeoTreeTitleBar         = { fg = p.bg, bg = p.pink, style = { bold = true } },
    NeoTreeFileName         = { fg = p.fg },
    NeoTreeFileIcon         = { fg = p.fg_dim },
    NeoTreeFileNameOpened   = { fg = p.fg, style = { bold = true } },
    NeoTreeModified         = { fg = p.orange },

    NeoTreeGitAdded         = { fg = p.lime },
    NeoTreeGitModified      = { fg = p.orange },
    NeoTreeGitDeleted       = { fg = p.red },
    NeoTreeGitRenamed       = { fg = p.blue },
    NeoTreeGitUntracked     = { fg = p.lime, style = { italic = true } },
    NeoTreeGitConflict      = { fg = p.purple, style = { bold = true } },
    NeoTreeGitIgnored       = { fg = p.fg_mute, style = { italic = true } },
    NeoTreeGitStaged        = { fg = p.lime, style = { bold = true } },

    NeoTreeDimText          = { fg = p.fg_mute },
    NeoTreeMessage          = { fg = p.fg_dim, style = { italic = true } },
  }
end

return M
