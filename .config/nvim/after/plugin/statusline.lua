local lualine = require("lualine")

lualine.setup({
	options = {
		section_separators = { left = "", right = "" },
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "filename", "diagnostics" },
		lualine_c = {},
		lualine_x = { "filetype" },
		lualine_y = {},
		lualine_z = { "branch" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = { "filename" },
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {},
	},
})
