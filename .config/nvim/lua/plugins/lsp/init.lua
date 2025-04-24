return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"jay-babu/mason-null-ls.nvim",
		"nvimtools/none-ls.nvim",
		"nvimtools/none-ls-extras.nvim",
		"saghen/blink.cmp",
		"luckasRanarison/tailwind-tools.nvim",
		"pmizio/typescript-tools.nvim",
		"nvim-flutter/flutter-tools.nvim",
	},
	config = function()
		require("plugins.lsp.config")
	end,
}
