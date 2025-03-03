return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"jay-babu/mason-null-ls.nvim",
		"nvimtools/none-ls.nvim",
		"nvimtools/none-ls-extras.nvim",
		"zbirenbaum/copilot-cmp",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/nvim-cmp",
		"onsails/lspkind.nvim",
		"luckasRanarison/tailwind-tools.nvim",
		"pmizio/typescript-tools.nvim",
	},
	config = function()
		require("plugins.lsp.config")
	end,
}
