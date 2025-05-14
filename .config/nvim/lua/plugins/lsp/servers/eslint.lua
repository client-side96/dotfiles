local eslint = {
	lsp_names = { "eslint" },
	ts_names = {},
	root_patterns = {},
}

function eslint.setup()
	vim.lsp.enable("eslint")
	vim.lsp.config("eslint", {
		on_attach = require("plugins.lsp.servers.utils").on_attach,
	})
end

return eslint
