-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {

	theme = "flexoki-light",
  theme_toggle = {"flexoki-light", "tokyodark"},

  -- 注释可以亮一点
	hl_override = {
		Comment = { fg = { "light_grey", 5 }, italic = true },
		["@comment"] = { fg = { "light_grey", 5 }, italic = true },
	},

	-- 仅针对暗色主题 tokyodark，把主背景色改为和 Ghostty TokyoNight 一致
	changed_themes = {
		tokyodark = {
			base_16 = {
				base00 = "#1a1b26",
			},
		},
	},


	hl_add = {
		-- diffview: 只保留 diff 背景，不覆盖代码语法前景色
		DiffviewDiffAdd = { bg = { "green", "black", 85 } },
		DiffviewDiffText = { bg = { "green", "black", 70 } },
		DiffviewDiffChange = { bg = { "green", "black", 85 } },
		DiffviewDiffDelete = { bg = { "red", "black", 70 } },
	},
}

M.term = {
  winopts = { number = true, relativenumber = true },
  base46_colors = false,
  float = {
    relative = "editor",
    row = 0.1,
    col = 0.1,
    width = 0.8,
    height = 0.8,
    border = "single",
  },
}

M.ui = {
  statusline = {
    theme = "minimal"
  }
}

M.nvdash = {
  load_on_startup = true
}


return M
