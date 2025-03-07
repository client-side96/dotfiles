require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"dart",
		"lua",
		"javascript",
		"typescript",
		"tsx",
		"markdown",
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
