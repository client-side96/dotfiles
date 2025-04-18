local dart = {
	lsp_names = { "dartls" },
	ts_names = { "dart" },
	root_patterns = {},
}

function dart.setup()
	-- require("lspconfig").dartls.setup({
	-- 	on_attach = function(client, bufnr)
	-- 		require("plugins.lsp.servers.utils").on_attach(client, bufnr, true)
	-- 	end,
	-- })
	require("flutter-tools").setup({
		fvm = true,
		widget_guides = {
			enabled = true,
		},
		dev_tools = {
			autostart = true,
			auto_open_browser = true,
		},
		lsp = {
			color = {
				enabled = true,
				background = true,
				virtual_text = false,
			},
			on_attach = function(client, bufnr)
				require("plugins.lsp.servers.utils").on_attach(client, bufnr, true)
			end,
			-- see the link below for details on each option:
			-- https://github.com/dart-lang/sdk/blob/master/pkg/analysis_server/tool/lsp_spec/README.md#client-workspace-configuration
			settings = {
				showTodos = true,
				completeFunctionCalls = true,
				analysisExcludedFold = "always",
				enableSnippets = true,
				updateImportsOnRename = true,
			},
		},
	})
end

return dart
