local server_utils = {}

vim.cmd([[autocmd! ColorScheme * highlight NormalFloat guibg=#1f1d2e]])
vim.cmd([[autocmd! ColorScheme * highlight FloatBorder guifg=#6e6a86 guibg=#1f1d2e]])

local border = {
	{ "╭", "FloatBorder" },
	{ "─", "FloatBorder" },
	{ "╮", "FloatBorder" },
	{ "│", "FloatBorder" },
	{ "╯", "FloatBorder" },
	{ "─", "FloatBorder" },
	{ "╰", "FloatBorder" },
	{ "│", "FloatBorder" },
}

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview

local formatting_augroup = vim.api.nvim_create_augroup("LspFormatting", {})

function server_utils.on_attach(client, bufnr, format_with_lsp)
	function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
		opts = opts or {}
		opts.border = opts.border or border
		return orig_util_open_floating_preview(contents, syntax, opts, ...)
	end

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
