local telescope = require("telescope")
local builtin = require("telescope.builtin")

telescope.setup({
	pickers = {
		find_files = {
			theme = "dropdown",
			previewer = false,
		},
		live_grep = {
			theme = "ivy",
		},
		lsp_references = {
			theme = "ivy",
		},
		lsp_document_symbols = {
			theme = "dropdown",
			previewer = false,
		},
		lsp_workspace_symbols = {
			theme = "dropdown",
			previewer = false,
		},
		diagnostics = {
			theme = "ivy",
		},
	},
})

vim.keymap.set("n", "<leader>f", builtin.find_files)
vim.keymap.set("n", "<leader>'", builtin.resume)
vim.keymap.set("n", "<leader>/", function()
	builtin.live_grep()
end)

vim.keymap.set("n", "gr", builtin.lsp_references)
vim.keymap.set("n", "<leader>s", builtin.lsp_document_symbols)
vim.keymap.set("n", "<leader>S", builtin.lsp_workspace_symbols)
vim.keymap.set("n", "<leader>d", builtin.diagnostics)
