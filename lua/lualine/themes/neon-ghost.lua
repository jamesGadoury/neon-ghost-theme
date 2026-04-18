-- Lualine lookup: `theme = "neon-ghost"` lands here.
local palette = require("neon-ghost.palette")
local theme = require("neon-ghost.groups.plugins.lualine")
return theme.build(palette)
