local zig = {
	lsp_names = { "zls" },
	ts_names = { "zig" },
	root_patterns = {},
}

function zig.setup()
	vim.lsp.enable("zls")
	vim.lsp.config("zls", {
		on_attach = require("plugins.lsp.servers.utils").on_attach,
	})
end

return zig
