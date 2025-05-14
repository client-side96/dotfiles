local go = {
	lsp_names = { "gopls" },
	ts_names = { "go" },
	root_patterns = {},
}

function go.setup()
	vim.lsp.enable("gopls")
	vim.lsp.config("gopls", {
		on_attach = function(client, bufnr)
			require("plugins.lsp.servers.utils").on_attach(client, bufnr, true)
		end,
	})

	vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
		pattern = { "*.tmpl", "*.html.tmpl", "*.tmpl.html" },
		callback = function()
			vim.bo.filetype = "gotmpl"
		end,
	})
end

return go
