local M = {}

M.defaults = {
  style = "default",              -- "default" | "flashy" — flashy = peak-neon palette + extra emphasis
  transparent = false,
  terminal_colors = true,
  styles = {
    comments  = { italic = true },
    functions = { bold = true },
    keywords  = {},
    types     = {},
    variables = {},
  },
  diagnostics = {
    undercurl  = false,
    background = false,
  },
  integrations = {
    treesitter       = true,
    lsp              = true,
    telescope        = true,
    cmp              = true,
    nvim_tree        = true,
    neo_tree         = true,
    gitsigns         = true,
    trouble          = true,
    lualine          = true,
    indent_blankline = true,
  },
}

M.options = vim.deepcopy(M.defaults)

function M.apply(user)
  M.options = vim.tbl_deep_extend("force", vim.deepcopy(M.defaults), user or {})
  return M.options
end

return M
