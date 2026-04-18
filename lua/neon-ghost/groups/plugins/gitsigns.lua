local M = {}

function M.get(p, _cfg)
  return {
    GitSignsAdd             = { fg = p.lime },
    GitSignsChange          = { fg = p.blue },
    GitSignsDelete          = { fg = p.red },
    GitSignsTopdelete       = { fg = p.red },
    GitSignsChangedelete    = { fg = p.purple },
    GitSignsUntracked       = { fg = p.teal },

    GitSignsAddNr           = { fg = p.lime },
    GitSignsChangeNr        = { fg = p.blue },
    GitSignsDeleteNr        = { fg = p.red },

    GitSignsAddLn           = { bg = "#10301a" },
    GitSignsChangeLn        = { bg = "#112833" },
    GitSignsDeleteLn        = { bg = "#2a1220" },

    GitSignsAddInline       = { fg = p.bg, bg = p.lime },
    GitSignsChangeInline    = { fg = p.bg, bg = p.blue },
    GitSignsDeleteInline    = { fg = p.bg, bg = p.red },

    GitSignsCurrentLineBlame = { fg = p.fg_mute, style = { italic = true } },
  }
end

return M
