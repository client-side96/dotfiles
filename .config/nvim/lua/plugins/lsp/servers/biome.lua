local biome = {
	lsp_names = { "biome" },
	ts_names = {},
	root_patterns = { "biome.json" },
}

function biome.setup()
	require("lspconfig").biome.setup({
		on_attach = function(client, bufnr)
			print("biome attached")
			require("plugins.lsp.servers.utils").on_attach(client, bufnr, false)
		end,
	})
end

return biome
