require("oil").setup({
	columns = {
		"icon",
		"size",
	},
	watch_for_changes = true,
	keymaps = {
		["q"] = { "actions.close", mode = "n" },
	},
	view_options = {
		show_hidden = true,
		is_always_hidden = function(name, bufnr)
			return name == "node_modules" or name == ".git" or name == ".DS_Store"
		end,
	},
	float = {
		max_width = 0.3,
		max_height = 0.5,
	},
})

require("client-side.keymaps").set_oil()
