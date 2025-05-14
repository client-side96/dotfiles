-- Global keymaps
vim.g.mapleader = " "

vim.keymap.set("n", "<leader>wv", ":vsplit<cr> <c-w>w")

vim.keymap.set("n", "<leader>Y", '"+y', { noremap = true })
vim.keymap.set("v", "<leader>Y", '"+y', { noremap = true })

vim.keymap.set("n", "<", "<<")
vim.keymap.set("n", ">", ">>")
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Plugin specific keymaps
local K = {}

function K.set_oil()
	vim.keymap.set("n", "<leader>n", ":Oil --float<cr>")
end

function K.set_toggleterm()
	vim.api.nvim_set_keymap("n", "<leader>gg", "<cmd>lua Lazygit_toggle()<CR>", {
		noremap = true,
		silent = true,
	})
end

function K.set_commentary()
	vim.api.nvim_set_keymap("n", "<C-c>", ":Commentary<CR>", { noremap = true, silent = true })
	vim.api.nvim_set_keymap("v", "<C-c>", ":Commentary<CR>", { noremap = true, silent = true })
end

function K.set_lsp(bufnr)
	local opts = { buffer = bufnr }

	vim.keymap.set("n", "<leader>k", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
	vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
	vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
	vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
	vim.keymap.set("n", "gR", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
	vim.keymap.set("n", "gS", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
	vim.keymap.set("n", "<leader>r", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
	vim.keymap.set("n", "<leader>a", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
	vim.keymap.set({ "n", "x" }, "<leader>F", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
	vim.keymap.set("n", "[d", function()
		vim.diagnostic.goto_prev({ float = { source = true } })
	end, opts)
	vim.keymap.set("n", "]d", function()
		vim.diagnostic.goto_next({ float = { source = true } })
	end, opts)
	vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
end

function K.set_telescope(builtin, custom, extensions)
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
end

return K
