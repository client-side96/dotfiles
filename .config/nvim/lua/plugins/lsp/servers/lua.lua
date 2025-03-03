local lua = {
	lsp_names = { "lua_ls" },
	ts_names = { "lua" },
	root_patterns = {},
}

function lua.setup()
	require("lspconfig").lua_ls.setup({
		on_attach = require("plugins.lsp.servers.utils").on_attach,
	})
end

return lua
