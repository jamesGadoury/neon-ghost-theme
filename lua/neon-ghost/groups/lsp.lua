local M = {}

function M.get(p, cfg)
  local diag = cfg.diagnostics or {}
  local underline_style = diag.undercurl and { undercurl = true } or { underline = true }

  local function diag_sign(fg)    return { fg = fg } end
  local function diag_virt(fg, bg) return { fg = fg, bg = bg or nil } end
  local function diag_under(fg)   return { sp = fg, style = underline_style } end

  local err_bg  = diag.background and p.diag_error_bg or nil
  local warn_bg = diag.background and p.diag_warn_bg  or nil
  local info_bg = diag.background and p.diag_info_bg  or nil
  local hint_bg = diag.background and p.diag_hint_bg  or nil

  return {
    -- diagnostics core
    DiagnosticError = { fg = p.red },
    DiagnosticWarn  = { fg = p.yellow },
    DiagnosticInfo  = { fg = p.cyan },
    DiagnosticHint  = { fg = p.teal },
    DiagnosticOk    = { fg = p.lime },

    DiagnosticVirtualTextError = diag_virt(p.red,    err_bg),
    DiagnosticVirtualTextWarn  = diag_virt(p.yellow, warn_bg),
    DiagnosticVirtualTextInfo  = diag_virt(p.cyan,   info_bg),
    DiagnosticVirtualTextHint  = diag_virt(p.teal,   hint_bg),
    DiagnosticVirtualTextOk    = diag_virt(p.lime),

    DiagnosticUnderlineError = diag_under(p.red),
    DiagnosticUnderlineWarn  = diag_under(p.yellow),
    DiagnosticUnderlineInfo  = diag_under(p.cyan),
    DiagnosticUnderlineHint  = diag_under(p.teal),
    DiagnosticUnderlineOk    = diag_under(p.lime),

    DiagnosticSignError = diag_sign(p.red),
    DiagnosticSignWarn  = diag_sign(p.yellow),
    DiagnosticSignInfo  = diag_sign(p.cyan),
    DiagnosticSignHint  = diag_sign(p.teal),
    DiagnosticSignOk    = diag_sign(p.lime),

    DiagnosticFloatingError = { fg = p.red,    bg = p.bg_float },
    DiagnosticFloatingWarn  = { fg = p.yellow, bg = p.bg_float },
    DiagnosticFloatingInfo  = { fg = p.cyan,   bg = p.bg_float },
    DiagnosticFloatingHint  = { fg = p.teal,   bg = p.bg_float },
    DiagnosticFloatingOk    = { fg = p.lime,   bg = p.bg_float },

    DiagnosticUnnecessary = { fg = p.fg_mute, style = { italic = true } },
    DiagnosticDeprecated  = { fg = p.fg_mute, style = { strikethrough = true } },

    -- LSP reference highlighting
    LspReferenceText   = { bg = p.bg_sel },
    LspReferenceRead   = { bg = p.bg_sel },
    LspReferenceWrite  = { bg = p.bg_sel, style = { bold = true } },
    LspSignatureActiveParameter = { fg = p.pink, style = { bold = true } },
    LspCodeLens        = { fg = p.fg_mute, style = { italic = true } },
    LspCodeLensSeparator = { fg = p.border },
    LspInlayHint       = { fg = p.fg_mute, bg = p.bg_alt, style = { italic = true } },

    -- LSP semantic tokens (match treesitter where possible)
    ["@lsp.type.namespace"]       = { link = "@module" },
    ["@lsp.type.type"]            = { link = "@type" },
    ["@lsp.type.class"]           = { link = "@type" },
    ["@lsp.type.enum"]            = { link = "@type" },
    ["@lsp.type.interface"]       = { link = "@type" },
    ["@lsp.type.struct"]          = { link = "@type" },
    ["@lsp.type.typeParameter"]   = { link = "@type.definition" },
    ["@lsp.type.parameter"]       = { link = "@variable.parameter" },
    ["@lsp.type.variable"]        = { link = "@variable" },
    ["@lsp.type.property"]        = { link = "@property" },
    ["@lsp.type.enumMember"]      = { link = "@constant" },
    ["@lsp.type.function"]        = { link = "@function" },
    ["@lsp.type.method"]          = { link = "@function.method" },
    ["@lsp.type.macro"]           = { link = "@function.macro" },
    ["@lsp.type.decorator"]       = { link = "@attribute" },
    ["@lsp.type.event"]           = { link = "@type" },
    ["@lsp.type.keyword"]         = { link = "@keyword" },
    ["@lsp.type.modifier"]        = { link = "@keyword.modifier" },
    ["@lsp.type.operator"]        = { link = "@operator" },
    ["@lsp.type.string"]          = { link = "@string" },
    ["@lsp.type.number"]          = { link = "@number" },
    ["@lsp.type.regexp"]          = { link = "@string.regexp" },
    ["@lsp.type.comment"]         = { link = "@comment" },

    ["@lsp.mod.readonly"]         = { fg = p.orange },
    ["@lsp.mod.deprecated"]       = { fg = p.fg_mute, style = { strikethrough = true } },
    ["@lsp.mod.defaultLibrary"]   = { style = { italic = true } },

    ["@lsp.typemod.function.defaultLibrary"]  = { fg = p.cyan, style = { italic = true, bold = true } },
    ["@lsp.typemod.variable.defaultLibrary"]  = { fg = p.pink, style = { italic = true } },
    ["@lsp.typemod.variable.readonly"]        = { fg = p.orange },
    ["@lsp.typemod.parameter.readonly"]       = { fg = p.blue, style = { italic = true } },
  }
end

return M
