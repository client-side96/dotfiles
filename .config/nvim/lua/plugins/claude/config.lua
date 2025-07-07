require("claude-code").setup({
	window = {
		split_ratio = 0.3,
		position = "vertical",
		enter_insert = true,
		hide_numbers = true,
		hide_signcolumn = true,
	},
	keymaps = {
		toggle = {
			normal = "<leader>ga",
			terminal = "<leader>ga",
		},
	},
})
