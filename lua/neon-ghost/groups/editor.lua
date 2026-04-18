local M = {}

function M.get(p, cfg)
  local bg = cfg.transparent and p.none or p.bg
  local bg_float = cfg.transparent and p.none or p.bg_float
  local bg_sign = cfg.transparent and p.none or p.bg

  return {
    -- base
    Normal        = { fg = p.fg, bg = bg },
    NormalNC      = { fg = p.fg, bg = bg },
    NormalFloat   = { fg = p.fg, bg = bg_float },
    FloatBorder   = { fg = p.border, bg = bg_float },
    FloatTitle    = { fg = p.pink, bg = bg_float, style = { bold = true } },

    -- cursor & lines
    Cursor        = { fg = p.bg, bg = p.pink },
    lCursor       = { fg = p.bg, bg = p.pink },
    CursorLine    = { bg = p.bg_line },
    CursorColumn  = { bg = p.bg_line },
    ColorColumn   = { bg = p.bg_line },
    CursorLineNr  = { fg = p.pink, style = { bold = true } },
    LineNr        = { fg = p.fg_mute },
    SignColumn    = { fg = p.fg_mute, bg = bg_sign },
    FoldColumn    = { fg = p.fg_mute, bg = bg_sign },
    Folded        = { fg = p.fg_dim, bg = p.bg_alt },

    -- selection / search
    Visual        = { bg = p.bg_sel },
    VisualNOS     = { bg = p.bg_sel },
    Search        = { fg = p.bg, bg = p.yellow },
    IncSearch     = { fg = p.bg, bg = p.pink, style = { bold = true } },
    CurSearch     = { fg = p.bg, bg = p.pink, style = { bold = true } },
    MatchParen    = { fg = p.cyan, style = { bold = true, underline = true } },

    -- splits & status
    WinSeparator   = { fg = p.border, bg = bg },
    VertSplit      = { fg = p.border, bg = bg },
    StatusLine     = { fg = p.fg, bg = p.bg_alt },
    StatusLineNC   = { fg = p.fg_mute, bg = p.bg_alt },
    TabLine        = { fg = p.fg_dim, bg = p.bg_alt },
    TabLineFill    = { bg = p.bg_alt },
    TabLineSel     = { fg = p.pink, bg = bg, style = { bold = true } },
    WinBar         = { fg = p.fg_dim, bg = bg },
    WinBarNC       = { fg = p.fg_mute, bg = bg },

    -- popup menu
    Pmenu          = { fg = p.fg, bg = p.bg_float },
    PmenuSel       = { fg = p.bg, bg = p.pink, style = { bold = true } },
    PmenuSbar      = { bg = p.bg_float },
    PmenuThumb     = { bg = p.border },
    PmenuKind      = { fg = p.cyan, bg = p.bg_float },
    PmenuKindSel   = { fg = p.bg, bg = p.pink, style = { bold = true } },
    PmenuExtra     = { fg = p.fg_dim, bg = p.bg_float },
    PmenuExtraSel  = { fg = p.bg, bg = p.pink },

    -- messages
    ErrorMsg     = { fg = p.red, style = { bold = true } },
    WarningMsg   = { fg = p.yellow },
    ModeMsg      = { fg = p.fg_dim, style = { bold = true } },
    MoreMsg      = { fg = p.cyan },
    Question     = { fg = p.cyan },

    -- misc
    NonText       = { fg = p.fg_mute },
    EndOfBuffer   = { fg = p.bg },
    SpecialKey    = { fg = p.purple },
    Whitespace    = { fg = p.border },
    Conceal       = { fg = p.fg_mute },
    Directory     = { fg = p.blue, style = { bold = true } },
    Title         = { fg = p.pink, style = { bold = true } },
    QuickFixLine  = { bg = p.bg_sel },

    -- spell
    SpellBad     = { sp = p.red,    style = { undercurl = true } },
    SpellCap     = { sp = p.blue,   style = { undercurl = true } },
    SpellRare    = { sp = p.purple, style = { undercurl = true } },
    SpellLocal   = { sp = p.teal,   style = { undercurl = true } },

    -- diff
    DiffAdd      = { bg = "#10301a" },
    DiffChange   = { bg = "#112833" },
    DiffDelete   = { fg = p.red, bg = "#2a1220" },
    DiffText     = { bg = "#1c4055" },
    diffAdded    = { fg = p.lime },
    diffRemoved  = { fg = p.red },
    diffChanged  = { fg = p.blue },
    diffFile     = { fg = p.yellow },
    diffLine     = { fg = p.purple },

    -- terminal cursor block
    TermCursor   = { fg = p.bg, bg = p.pink },
    TermCursorNC = { fg = p.bg, bg = p.fg_mute },

    -- floats / notifications
    NotifyERRORBorder = { fg = p.red,    bg = bg_float },
    NotifyWARNBorder  = { fg = p.yellow, bg = bg_float },
    NotifyINFOBorder  = { fg = p.cyan,   bg = bg_float },
    NotifyDEBUGBorder = { fg = p.purple, bg = bg_float },
    NotifyTRACEBorder = { fg = p.teal,   bg = bg_float },
  }
end

return M
