local rust = {
	lsp_names = { "rust_analyzer" },
	ts_names = { "rust" },
	root_patterns = {},
}

function rust.setup()
	require("lspconfig").rust_analyzer.setup({
		on_attach = function(client, bufnr)
			require("plugins.lsp.servers.utils").on_attach(client, bufnr, true)
		end,
	})
end

return rust
