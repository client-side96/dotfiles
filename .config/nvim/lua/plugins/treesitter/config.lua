require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"dart",
		"lua",
		"javascript",
		"typescript",
		"tsx",
		"markdown",
		"html",
		"gotmpl",
		"json",
		"css",
		"yaml",
		"dart",
	},
	sync_install = false,
	highlight = { enable = true },
	indent = { enable = true },
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<A-o>",
			node_incremental = "<A-o>",
			node_decremental = "<A-i>",
			scope_incremental = "<A-S-o>",
		},
	},
})

require("treesitter-context").setup({
	enable = true,
	max_lines = 3,
	line_numbers = true,
	trim_scope = "outer",
	mode = "cursor",
	zindex = 20,
})
