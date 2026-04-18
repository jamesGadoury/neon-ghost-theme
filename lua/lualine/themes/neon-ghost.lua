-- Lualine lookup: `theme = "neon-ghost"` lands here.
local config  = require("neon-ghost.config")
local palette = require("neon-ghost.palette").with_style(config.options.style)
local theme   = require("neon-ghost.groups.plugins.lualine")
return theme.build(palette)
