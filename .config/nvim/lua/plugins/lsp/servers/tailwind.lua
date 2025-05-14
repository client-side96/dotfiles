local tailwind = {
	lsp_names = { "tailwindcss" },
	ts_names = { "css", "html" },
	root_patterns = {},
}

function tailwind.setup()
	vim.lsp.enable("tailwindcss")
	vim.lsp.config("tailwindcss", {
		on_attach = require("plugins.lsp.servers.utils").on_attach,
	})

	require("tailwind-tools").setup({
		conceal = {
			enabled = false,
		},
	})
end

return tailwind
