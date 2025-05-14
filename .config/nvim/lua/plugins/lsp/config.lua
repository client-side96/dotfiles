require("mason").setup()

require("mason-lspconfig").setup({
	automatic_enable = false,
	ensure_installed = {
		"lua_ls",
		"tailwindcss",
		"eslint",
		"biome",
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
		-- Disable prettier when biome config file is found
		require("null-ls").builtins.formatting.prettier.with({
			condition = function(utils)
				return not utils.root_has_file(servers.biome.root_patterns)
			end,
		}),
		require("null-ls").builtins.formatting.biome.with({
			condition = function(utils)
				return utils.root_has_file(servers.biome.root_patterns)
			end,
		}),
	},
	on_attach = require("plugins.lsp.servers.utils").on_attach,
})

require("plugins.lsp.completion").setup()
