local lua = {
	lsp_names = { "lua_ls" },
	ts_names = { "lua" },
	root_patterns = {},
}

function lua.setup()
	vim.lsp.enable("lua_ls")
	vim.lsp.config("lua_ls", {
		on_attach = require("plugins.lsp.servers.utils").on_attach,
	})
end

return lua
