local M = {}

function M.get(p, cfg)
  local bg = cfg.transparent and p.none or p.bg_alt
  return {
    NvimTreeNormal        = { fg = p.fg, bg = bg },
    NvimTreeNormalNC      = { fg = p.fg, bg = bg },
    NvimTreeEndOfBuffer   = { fg = bg, bg = bg },
    NvimTreeVertSplit     = { fg = p.border, bg = bg },
    NvimTreeWinSeparator  = { fg = p.border, bg = bg },
    NvimTreeRootFolder    = { fg = p.pink, style = { bold = true } },
    NvimTreeFolderName    = { fg = p.blue },
    NvimTreeFolderIcon    = { fg = p.blue },
    NvimTreeOpenedFolderName = { fg = p.cyan, style = { bold = true } },
    NvimTreeEmptyFolderName = { fg = p.fg_mute },
    NvimTreeIndentMarker  = { fg = p.border },
    NvimTreeSymlink       = { fg = p.teal },
    NvimTreeSpecialFile   = { fg = p.yellow, style = { italic = true } },
    NvimTreeExecFile      = { fg = p.lime, style = { bold = true } },
    NvimTreeImageFile     = { fg = p.purple },
    NvimTreeCursorLine    = { bg = p.bg_sel },
    NvimTreeCursorColumn  = { bg = p.bg_line },

    NvimTreeGitDirty      = { fg = p.orange },
    NvimTreeGitStaged     = { fg = p.lime },
    NvimTreeGitNew        = { fg = p.lime },
    NvimTreeGitDeleted    = { fg = p.red },
    NvimTreeGitRenamed    = { fg = p.blue },
    NvimTreeGitMerge      = { fg = p.purple },
    NvimTreeGitIgnored    = { fg = p.fg_mute, style = { italic = true } },

    NvimTreeLspDiagnosticsError   = { fg = p.red },
    NvimTreeLspDiagnosticsWarning = { fg = p.yellow },
    NvimTreeLspDiagnosticsInformation = { fg = p.cyan },
    NvimTreeLspDiagnosticsHint    = { fg = p.teal },

    NvimTreeModifiedFile  = { fg = p.orange },
    NvimTreeOpenedFile    = { fg = p.fg, style = { bold = true } },
  }
end

return M
