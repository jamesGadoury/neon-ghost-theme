local M = {}

local function parse(hex)
  hex = hex:gsub("^#", "")
  return tonumber(hex:sub(1, 2), 16),
         tonumber(hex:sub(3, 4), 16),
         tonumber(hex:sub(5, 6), 16)
end

-- Blend two #RRGGBB colors. alpha=1 returns `fg` unchanged, alpha=0 returns `bg`.
function M.blend(fg, bg, alpha)
  local fr, fgc, fb = parse(fg)
  local br, bgc, bb = parse(bg)
  local function mix(f, b) return math.floor(alpha * f + (1 - alpha) * b + 0.5) end
  return string.format("#%02x%02x%02x", mix(fr, br), mix(fgc, bgc), mix(fb, bb))
end

-- Build an nvim_set_hl spec, pulling gui + cterm from palette tokens when given tables.
-- Accepts { fg = palette_token_or_hex, bg = ..., style = { bold = true, ... }, sp = ... }.
function M.spec(opts)
  local hl = {}
  local function pick_gui(v)
    if type(v) == "table" then return v.gui end
    return v
  end
  local function pick_cterm(v)
    if type(v) == "table" then return v.cterm end
    return nil
  end

  if opts.fg then
    local g = pick_gui(opts.fg)
    if g and g ~= "NONE" then hl.fg = g end
    local c = pick_cterm(opts.fg)
    if c and c ~= "NONE" then hl.ctermfg = c end
  end
  if opts.bg then
    local g = pick_gui(opts.bg)
    if g == "NONE" then
      -- Explicit transparent: leave fg/bg unset so it inherits.
    elseif g then
      hl.bg = g
    end
    local c = pick_cterm(opts.bg)
    if c and c ~= "NONE" then hl.ctermbg = c end
  end
  if opts.sp then hl.sp = pick_gui(opts.sp) end

  if opts.style then
    for k, v in pairs(opts.style) do hl[k] = v end
  end
  if opts.link then hl.link = opts.link end
  if opts.default then hl.default = true end

  return hl
end

-- Apply a map of { [group] = spec } to the global namespace.
function M.apply(groups)
  for name, opts in pairs(groups) do
    vim.api.nvim_set_hl(0, name, M.spec(opts))
  end
end

return M
