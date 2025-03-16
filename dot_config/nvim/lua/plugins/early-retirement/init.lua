return {
	"chrisgrieser/nvim-early-retirement",
	event = "VeryLazy",
	config = function()
		require("plugins.early-retirement.config")
	end,
}
