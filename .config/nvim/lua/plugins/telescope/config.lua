require("telescope").setup({
	defaults = {
		file_ignore_patterns = { ".git/", "node_modules/", ".idea", ".vscode", ".run" },
	},
	pickers = {
		find_files = {
			theme = "dropdown",
			previewer = false,
			path_display = { "smart" },
			hidden = true,
		},
		git_files = {
			theme = "dropdown",
			previewer = false,
			path_display = { "smart" },
			hidden = true,
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

local custom = {}

local is_inside_worktree = {}

custom.project_files = function()
	local opts = {}
	local cwd = vim.fn.getcwd()
	if is_inside_worktree[cwd] == nil then
		vim.fn.system("git rev-parse --is-inside-work-tree")
		is_inside_worktree[cwd] = vim.v.shell_error == 0
	end
	if is_inside_worktree[cwd] then
		require("telescope.builtin").git_files(opts)
	else
		require("telescope.builtin").find_files(opts)
	end
end

require("telescope").load_extension("flutter")

local builtin = require("telescope.builtin")
local extensions = require("telescope").extensions

vim.keymap.set("n", "<leader>f", custom.project_files)
vim.keymap.set("n", "<leader>b", builtin.buffers)
vim.keymap.set("n", "<leader>'", builtin.resume)
vim.keymap.set("n", "<leader>j", builtin.jumplist)
vim.keymap.set("n", "<leader>/", builtin.live_grep)
vim.keymap.set("n", "<leader>hh", builtin.help_tags)

vim.keymap.set("n", "gr", builtin.lsp_references)
vim.keymap.set("n", "<leader>s", builtin.lsp_document_symbols)
vim.keymap.set("n", "<leader>S", builtin.lsp_workspace_symbols)
vim.keymap.set("n", "<leader>d", builtin.diagnostics)
vim.keymap.set("n", "<leader>D", extensions.flutter.commands)
