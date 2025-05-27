return {
	"nvim-treesitter/nvim-treesitter-context",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
	build = function()
		require("nvim-treesitter.install").update({ with_sync = true })()
	end,
	config = function()
		require("plugins.treesitter.config")
	end,
}
