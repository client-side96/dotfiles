local html = {
	lsp_names = { "html" },
	ts_names = { "html" },
}

function html.setup()
	require("lspconfig").html.setup({
		filetypes = { "html", "gotmpl" },
		on_attach = function(client, bufnr)
			require("plugins.lsp.servers.utils").on_attach(client, bufnr)
		end,
	})
end

return html
