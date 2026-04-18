local M = {}

function M.get(p, _cfg)
  return {
    -- indent-blankline v3 (ibl.*)
    IblIndent       = { fg = p.border },
    IblWhitespace   = { fg = p.border },
    IblScope        = { fg = p.pink },

    -- v2 fallbacks
    IndentBlanklineChar            = { fg = p.border },
    IndentBlanklineSpaceChar       = { fg = p.border },
    IndentBlanklineContextChar     = { fg = p.pink },
    IndentBlanklineContextStart    = { sp = p.pink, style = { underline = true } },
  }
end

return M
