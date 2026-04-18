local M = {}

function M.get(p, _cfg)
  return {
    CmpItemAbbr            = { fg = p.fg },
    CmpItemAbbrDeprecated  = { fg = p.fg_mute, style = { strikethrough = true } },
    CmpItemAbbrMatch       = { fg = p.pink, style = { bold = true } },
    CmpItemAbbrMatchFuzzy  = { fg = p.pink, style = { bold = true } },
    CmpItemMenu            = { fg = p.fg_mute, style = { italic = true } },

    CmpItemKindDefault     = { fg = p.fg_dim },
    CmpItemKindText        = { fg = p.fg_dim },

    CmpItemKindFunction    = { fg = p.cyan },
    CmpItemKindMethod      = { fg = p.cyan },
    CmpItemKindConstructor = { fg = p.yellow },

    CmpItemKindVariable    = { fg = p.blue },
    CmpItemKindField       = { fg = p.blue },
    CmpItemKindProperty    = { fg = p.blue },

    CmpItemKindClass       = { fg = p.yellow },
    CmpItemKindInterface   = { fg = p.yellow },
    CmpItemKindStruct      = { fg = p.yellow },
    CmpItemKindEnum        = { fg = p.yellow },

    CmpItemKindKeyword     = { fg = p.pink },
    CmpItemKindOperator    = { fg = p.purple },
    CmpItemKindModule      = { fg = p.yellow },
    CmpItemKindFile        = { fg = p.fg_dim },
    CmpItemKindFolder      = { fg = p.blue },
    CmpItemKindReference   = { fg = p.purple },

    CmpItemKindSnippet     = { fg = p.lime },
    CmpItemKindConstant    = { fg = p.orange },
    CmpItemKindEnumMember  = { fg = p.orange },
    CmpItemKindValue       = { fg = p.orange },
    CmpItemKindUnit        = { fg = p.orange },

    CmpItemKindColor       = { fg = p.purple },
    CmpItemKindEvent       = { fg = p.pink },
    CmpItemKindTypeParameter = { fg = p.yellow },
    CmpItemKindCopilot     = { fg = p.teal },
  }
end

return M
