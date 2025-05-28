require("codecompanion").setup({
	adapters = {
		openrouter_gemini_flash = function()
			return require("codecompanion.adapters").extend("openai_compatible", {
				env = {
					url = "https://openrouter.ai/api",
					api_key = "cmd:cat " .. os.getenv("HOME") .. "/.ai/openrouter_gemini_flash_25.txt",
					chat_url = "/v1/chat/completions",
				},
				schema = {
					model = {
						default = "google/gemini-2.5-flash-preview-05-20",
					},
				},
			})
		end,
	},
	strategies = {
		chat = {
			adapter = "openrouter_gemini_flash",
		},
		inline = {
			adapter = "openrouter_gemini_flash",
		},
	},
})

vim.keymap.set("n", "<leader>aa", ":CodeCompanionChat<CR>", { desc = "CodeCompanion Chat" })
