local go = {
	lsp_names = { "gopls" },
	ts_names = { "go" },
	root_patterns = {},
}

function go.setup()
	require("lspconfig").gopls.setup({
		on_attach = require("plugins.lsp.servers.utils").on_attach,
	})
end

return go
