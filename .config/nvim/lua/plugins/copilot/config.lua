require("copilot").setup({
	suggestion = {
		enabled = true,
		auto_trigger = true,
		hide_during_completion = false,
		debounce = 75,
		trigger_on_accept = true,
		keymap = {
			accept = "<C-j>",
			accept_word = false,
			accept_line = false,
			next = "<M-]>",
			prev = "<M-[>",
			dismiss = "<C-c>",
		},
	},
	panel = { enabled = false },
})
