local typescript = {
	lsp_names = {}, -- Empty because we use typescript-tools
	ts_names = { "typescript", "javascript", "tsx" },
	root_patterns = { "package.json" },
}

function typescript.setup()
	require("typescript-tools").setup({
		on_attach = require("plugins.lsp.servers.utils").on_attach,
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
