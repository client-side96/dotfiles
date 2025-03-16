local server_utils = {}

local formatting_augroup = vim.api.nvim_create_augroup("LspFormatting", {})

function server_utils.on_attach(client, bufnr, format_with_lsp)
	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_clear_autocmds({ group = formatting_augroup, buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = formatting_augroup,
			buffer = bufnr,
			callback = function()
				format_with_lsp = format_with_lsp or false

				if format_with_lsp then
					vim.lsp.buf.format({ bufnr = bufnr, async = false })
				else
					vim.lsp.buf.format({
						filter = function(formatting_client)
							return formatting_client.name == "null-ls"
						end,
						bufnr = bufnr,
						async = false,
					})
				end
			end,
		})
	end
end

return server_utils
