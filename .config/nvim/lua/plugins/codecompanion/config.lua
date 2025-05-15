require("codecompanion").setup({
	adapters = {
		copilot = function()
			return require("codecompanion.adapters").extend("copilot", {
				schema = {
					model = {
						default = "claude-3.7-sonnet",
					},
				},
			})
		end,
		opts = {
			show_defaults = false,
			show_model_choices = true,
		},
	},
	strategies = {
		chat = {
			adapter = "copilot",
		},
		inline = {
			adapter = "copilot",
		},
		cmd = {
			adapter = "copilot",
		},
	},
	opts = {
		system_prompt = function(opts)
			local language = opts.language or "English"
			return string.format(require("plugins.codecompanion.prompts").system_prompt, language)
		end,
	},
})

require("client-side.keymaps").set_codecompanion()
