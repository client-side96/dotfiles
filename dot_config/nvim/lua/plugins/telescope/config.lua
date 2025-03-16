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

require("client-side.keymaps").set_telescope(require("telescope.builtin"), custom)
