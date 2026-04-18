local M = {}

function M.get(p, cfg)
  local comment_style = vim.tbl_extend("force", { italic = true }, cfg.styles.comments or {})
  local fn_style      = vim.tbl_extend("force", { bold = true  }, cfg.styles.functions or {})
  local kw_style      = cfg.styles.keywords or {}
  local ty_style      = cfg.styles.types or {}
  local var_style     = cfg.styles.variables or {}

  return {
    Comment      = { fg = p.comment, style = comment_style },

    Constant     = { fg = p.orange },
    String       = { fg = p.lime },
    Character    = { fg = p.lime },
    Number       = { fg = p.orange },
    Float        = { fg = p.orange },
    Boolean      = { fg = p.orange, style = { bold = true } },

    Identifier   = { fg = p.fg, style = var_style },
    Function     = { fg = p.cyan, style = fn_style },

    Statement    = { fg = p.pink, style = kw_style },
    Conditional  = { fg = p.pink, style = kw_style },
    Repeat       = { fg = p.pink, style = kw_style },
    Label        = { fg = p.purple },
    Operator     = { fg = p.purple },
    Keyword      = { fg = p.pink, style = kw_style },
    Exception    = { fg = p.red,  style = kw_style },

    PreProc      = { fg = p.purple },
    Include      = { fg = p.purple },
    Define       = { fg = p.purple },
    Macro        = { fg = p.purple },
    PreCondit    = { fg = p.purple },

    Type         = { fg = p.yellow, style = ty_style },
    StorageClass = { fg = p.pink, style = kw_style },
    Structure    = { fg = p.yellow, style = ty_style },
    Typedef      = { fg = p.yellow, style = ty_style },

    Special      = { fg = p.teal },
    SpecialChar  = { fg = p.teal },
    Tag          = { fg = p.blue },
    Delimiter    = { fg = p.fg_dim },
    SpecialComment = { fg = p.teal, style = comment_style },
    Debug        = { fg = p.orange },

    Underlined   = { fg = p.cyan, style = { underline = true } },
    Ignore       = { fg = p.fg_mute },
    Error        = { fg = p.red, style = { bold = true } },
    Todo         = { fg = p.bg, bg = p.yellow, style = { bold = true } },
  }
end

return M
