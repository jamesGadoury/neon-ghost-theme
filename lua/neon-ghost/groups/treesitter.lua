local M = {}

function M.get(p, cfg)
  local comment_style = vim.tbl_extend("force", { italic = true }, cfg.styles.comments or {})
  local fn_style      = vim.tbl_extend("force", { bold = true  }, cfg.styles.functions or {})
  local kw_style      = cfg.styles.keywords or {}
  local ty_style      = cfg.styles.types or {}
  local var_style     = cfg.styles.variables or {}

  return {
    -- comments
    ["@comment"]               = { link = "Comment" },
    ["@comment.documentation"] = { fg = p.fg_dim, style = comment_style },
    ["@comment.error"]         = { fg = p.red,    style = { bold = true } },
    ["@comment.warning"]       = { fg = p.yellow, style = { bold = true } },
    ["@comment.todo"]          = { fg = p.bg,     bg = p.yellow, style = { bold = true } },
    ["@comment.note"]          = { fg = p.bg,     bg = p.cyan,   style = { bold = true } },

    -- literals
    ["@string"]                = { fg = p.lime },
    ["@string.documentation"]  = { fg = p.lime, style = comment_style },
    ["@string.regexp"]         = { fg = p.teal },
    ["@string.escape"]         = { fg = p.teal, style = { bold = true } },
    ["@string.special"]        = { fg = p.teal },
    ["@string.special.url"]    = { fg = p.cyan, style = { underline = true } },
    ["@character"]             = { fg = p.lime },
    ["@character.special"]     = { fg = p.teal },
    ["@number"]                = { fg = p.orange },
    ["@number.float"]          = { fg = p.orange },
    ["@boolean"]               = { fg = p.orange, style = { bold = true } },

    -- identifiers
    ["@variable"]              = { fg = p.fg, style = var_style },
    ["@variable.builtin"]      = { fg = p.pink, style = { italic = true } },
    ["@variable.parameter"]    = { fg = p.blue },
    ["@variable.member"]       = { fg = p.fg },
    ["@constant"]              = { fg = p.orange },
    ["@constant.builtin"]      = { fg = p.orange, style = { bold = true } },
    ["@constant.macro"]        = { fg = p.purple },

    -- modules / labels
    ["@module"]                = { fg = p.yellow },
    ["@module.builtin"]        = { fg = p.yellow, style = { italic = true } },
    ["@label"]                 = { fg = p.purple },

    -- types
    ["@type"]                  = { fg = p.yellow, style = ty_style },
    ["@type.builtin"]          = { fg = p.yellow, style = vim.tbl_extend("force", { italic = true }, ty_style) },
    ["@type.definition"]       = { fg = p.yellow, style = vim.tbl_extend("force", { bold = true }, ty_style) },
    ["@type.qualifier"]        = { fg = p.pink },
    ["@attribute"]             = { fg = p.purple },
    ["@attribute.builtin"]     = { fg = p.purple, style = { italic = true } },
    ["@property"]              = { fg = p.blue },

    -- functions
    ["@function"]              = { fg = p.cyan, style = fn_style },
    ["@function.builtin"]      = { fg = p.cyan, style = vim.tbl_extend("force", { italic = true }, fn_style) },
    ["@function.call"]         = { fg = p.cyan },
    ["@function.macro"]        = { fg = p.purple },
    ["@function.method"]       = { fg = p.cyan, style = fn_style },
    ["@function.method.call"]  = { fg = p.cyan },
    ["@constructor"]           = { fg = p.yellow, style = { bold = true } },
    ["@operator"]              = { fg = p.purple },

    -- keywords
    ["@keyword"]                 = { fg = p.pink, style = kw_style },
    ["@keyword.coroutine"]       = { fg = p.pink, style = kw_style },
    ["@keyword.function"]        = { fg = p.pink, style = kw_style },
    ["@keyword.operator"]        = { fg = p.purple },
    ["@keyword.import"]          = { fg = p.purple },
    ["@keyword.type"]            = { fg = p.pink },
    ["@keyword.modifier"]        = { fg = p.pink },
    ["@keyword.repeat"]          = { fg = p.pink, style = kw_style },
    ["@keyword.return"]          = { fg = p.pink, style = kw_style },
    ["@keyword.debug"]           = { fg = p.orange },
    ["@keyword.exception"]       = { fg = p.red,  style = kw_style },
    ["@keyword.conditional"]     = { fg = p.pink, style = kw_style },
    ["@keyword.conditional.ternary"] = { fg = p.purple },
    ["@keyword.directive"]       = { fg = p.purple },
    ["@keyword.directive.define"] = { fg = p.purple },

    -- punctuation
    ["@punctuation.delimiter"] = { fg = p.fg_dim },
    ["@punctuation.bracket"]   = { fg = p.fg_dim },
    ["@punctuation.special"]   = { fg = p.purple },

    -- markup (markdown etc.)
    ["@markup"]                = { fg = p.fg },
    ["@markup.strong"]         = { fg = p.pink,  style = { bold = true } },
    ["@markup.italic"]         = { fg = p.purple, style = { italic = true } },
    ["@markup.strikethrough"]  = { fg = p.fg_mute, style = { strikethrough = true } },
    ["@markup.underline"]      = { style = { underline = true } },
    ["@markup.heading"]        = { fg = p.pink,   style = { bold = true } },
    ["@markup.heading.1"]      = { fg = p.pink,   style = { bold = true } },
    ["@markup.heading.2"]      = { fg = p.cyan,   style = { bold = true } },
    ["@markup.heading.3"]      = { fg = p.yellow, style = { bold = true } },
    ["@markup.heading.4"]      = { fg = p.lime,   style = { bold = true } },
    ["@markup.heading.5"]      = { fg = p.blue,   style = { bold = true } },
    ["@markup.heading.6"]      = { fg = p.purple, style = { bold = true } },
    ["@markup.quote"]          = { fg = p.fg_dim, style = { italic = true } },
    ["@markup.math"]           = { fg = p.teal },
    ["@markup.link"]           = { fg = p.cyan,   style = { underline = true } },
    ["@markup.link.label"]     = { fg = p.pink },
    ["@markup.link.url"]       = { fg = p.cyan,   style = { underline = true } },
    ["@markup.raw"]            = { fg = p.lime },
    ["@markup.raw.block"]      = { fg = p.lime, bg = p.bg_alt },
    ["@markup.list"]           = { fg = p.pink },
    ["@markup.list.checked"]   = { fg = p.lime },
    ["@markup.list.unchecked"] = { fg = p.fg_mute },

    -- diff
    ["@diff.plus"]             = { fg = p.lime },
    ["@diff.minus"]            = { fg = p.red },
    ["@diff.delta"]            = { fg = p.blue },

    -- tags (html/jsx)
    ["@tag"]                   = { fg = p.pink },
    ["@tag.builtin"]           = { fg = p.pink, style = { italic = true } },
    ["@tag.attribute"]         = { fg = p.cyan },
    ["@tag.delimiter"]         = { fg = p.fg_dim },

    -- CSS / SCSS / LESS
    -- The CSS treesitter query lumps color_value (#ff00ff), unit (px, %, rem),
    -- and string_value ("foo") into a single @string capture. Coloring them
    -- as lime makes hex colors read as strings and clashes visually with
    -- numbers. Treat all CSS "value tokens" as constant-like (orange) instead.
    ["@string.css"]            = { fg = p.orange },
    ["@string.scss"]           = { fg = p.orange },
    ["@string.less"]           = { fg = p.orange },
    ["@function.css"]          = { fg = p.cyan },            -- rgb()/hsl()/url() — drop bold
    ["@function.scss"]         = { fg = p.cyan },
    ["@property.css"]          = { fg = p.blue },
    ["@type.css"]              = { fg = p.yellow },          -- class selector .foo
    ["@constant.css"]          = { fg = p.orange },          -- id selector #foo
    ["@attribute.css"]         = { fg = p.purple },          -- :hover, ::before
    ["@tag.css"]               = { fg = p.pink },            -- a, div, h1
    ["@tag.attribute.css"]     = { fg = p.cyan },            -- [attr=...]
    ["@character.special.css"] = { fg = p.purple },          -- & nesting, *
    ["@keyword.modifier.css"]  = { fg = p.pink, style = { bold = true } }, -- !important
  }
end

return M
