local typescript = {
	lsp_names = {}, -- Empty because we use typescript-tools
	ts_names = { "typescript", "javascript", "tsx" },
	root_patterns = { ".git", "package.json" },
}

function typescript.setup()
	require("typescript-tools").setup({
		on_attach = function(client, bufnr)
			require("plugins.lsp.servers.utils").on_attach(client, bufnr, false)
			client.server_capabilities.documentFormattingProvider = false
		end,
		root_dir = require("lspconfig").util.root_pattern(typescript.root_patterns),
		single_file_support = false,
		settings = {
			jsx_close_tag = {
				enable = true,
			},
		},
	})
end

return typescript
