require("telescope").setup({
	pickers = {
		find_files = {
			theme = "dropdown",
			previewer = false,
			sorter = require("telescope.sorters").fuzzy_with_index_bias(),
			path_display = { "smart" },
		},
		buffers = {
			theme = "dropdown",
			previewer = false,
			path_display = { "tail" },
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
})

require("client-side.keymaps").set_telescope(require("telescope.builtin"))
