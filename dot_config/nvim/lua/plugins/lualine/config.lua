require("lualine").setup({
	options = {
		section_separators = { left = "", right = "" },
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch" },
		lualine_c = {},
		lualine_x = {},
		lualine_y = { "location" },
		lualine_z = {},
	},
	inactive_sections = {},
	winbar = {
		lualine_b = { "filename" },
		lualine_y = { "filetype" },
	},
	inactive_winbar = {
		lualine_c = { "filename" },
	},
})
