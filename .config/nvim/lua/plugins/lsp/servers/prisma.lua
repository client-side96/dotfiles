local prisma = {
	lsp_names = { "prismals" },
	ts_names = { "prisma" },
	root_patterns = {},
}

function prisma.setup()
	vim.lsp.enable("prismals")
	vim.lsp.config("prismals", {
		on_attach = require("plugins.lsp.servers.utils").on_attach,
	})
end

return prisma
