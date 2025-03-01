local tailwind = {
	lsp_names = { "tailwindcss" },
	ts_names = { "css", "html" },
	root_patterns = {},
}

function tailwind.setup()
	require("lspconfig").tailwindcss.setup({
		on_attach = require("plugins.lsp.servers.utils").on_attach,
	})

	require("tailwind-tools").setup({
		conceal = {
			enabled = true,
		},
	})
end

return tailwind
