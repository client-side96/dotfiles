local telescope = require("telescope")
local builtin = require("telescope.builtin")

telescope.setup({
	pickers = {
		find_files = {
			theme = "dropdown",
			previewer = false,
			path_display = { "smart" },
			sorter = require("telescope.sorters").fuzzy_with_index_bias(),
		},
		live_grep = {
			theme = "ivy",
			path_display = { "smart" },
		},
		lsp_references = {
			theme = "ivy",
			path_display = { "tail" },
		},
		lsp_document_symbols = {
			theme = "dropdown",
			previewer = false,
		},
		lsp_workspace_symbols = {
			theme = "dropdown",
			previewer = false,
			path_display = { "tail" },
		},
		diagnostics = {
			theme = "ivy",
			path_display = { "tail" },
		},
		jumplist = {
			theme = "dropdown",
			path_display = { "tail" },
		},
	},
	extensions = {
		["ui-select"] = {
			theme = "dropdown",
			previewer = false,
			initial_mode = "normal",
			layout_config = {
				height = 0.3,
			},
		},
	},
})

vim.keymap.set("n", "<leader>f", builtin.find_files)
vim.keymap.set("n", "<leader>b", builtin.buffers)
vim.keymap.set("n", "<leader>'", builtin.resume)
vim.keymap.set("n", "<leader>j", builtin.jumplist)
vim.keymap.set("n", "<leader>/", function()
	builtin.live_grep()
end)

vim.keymap.set("n", "gr", builtin.lsp_references)
vim.keymap.set("n", "<leader>s", builtin.lsp_document_symbols)
vim.keymap.set("n", "<leader>S", builtin.lsp_workspace_symbols)
vim.keymap.set("n", "<leader>d", builtin.diagnostics)
