local deno = {
	lsp_names = { "denols" },
	ts_names = {},
	root_patterns = { "deno.json", "deno.jsonc" },
}

function deno.setup()
	require("lspconfig").denols.setup({
		on_attach = function(client, bufnr)
			require("plugins.lsp.servers.utils").on_attach(client, bufnr, true)
		end,
		root_dir = require("lspconfig").util.root_pattern(deno.root_patterns),
	})
end

return deno
