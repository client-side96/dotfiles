require("mason").setup()

require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
		"ts_ls",
		"tailwindcss",
		"denols",
		"eslint",
		"gopls",
		"rust_analyzer",
		"prismals",
		"zls",
	},
})

require("mason-null-ls").setup({
	ensure_installed = { "stylua", "prettier" },
})

local servers = require("plugins.lsp.servers.init")

servers.setup()

require("null-ls").setup({
	sources = {
		require("null-ls").builtins.formatting.stylua,
		require("null-ls").builtins.formatting.prettier.with({
			condition = function(u)
				return not u.root_has_file(servers.deno.root_patterns) and u.root_has_file(servers.typescript_patterns)
			end,
		}),
	},
	on_attach = require("plugins.lsp.servers.utils").on_attach,
})

require("plugins.lsp.completion").setup()
