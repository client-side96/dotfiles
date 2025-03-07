local dart = {
	lsp_names = { "dartls" },
	ts_names = { "dart" },
	root_patterns = {},
}

function dart.setup()
	require("lspconfig").dartls.setup({
		on_attach = function(client, bufnr)
			require("plugins.lsp.servers.utils").on_attach(client, bufnr, true)
		end,
	})
	-- require("flutter-tools").setup()
end

return dart
