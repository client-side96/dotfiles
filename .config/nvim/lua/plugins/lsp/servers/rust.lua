local rust = {
	lsp_names = { "rust_analyzer" },
	ts_names = { "rust" },
	root_patterns = {},
}

function rust.setup()
	vim.lsp.enable("rust_analyzer")
	vim.lsp.config("rust_analyzer", {
		on_attach = function(client, bufnr)
			require("plugins.lsp.servers.utils").on_attach(client, bufnr, true)
		end,
	})
end

return rust
