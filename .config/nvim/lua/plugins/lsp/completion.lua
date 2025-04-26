local completion = {}

function completion.setup()
	require("blink.cmp").setup({
		completion = { documentation = { auto_show = true } },
		keymap = {
			preset = "default",

			["<Tab>"] = { "select_next", "fallback" },
			["<S-Tab>"] = { "select_prev", "fallback" },
			["<CR>"] = { "accept", "fallback" },
		},
	})
end

return completion
