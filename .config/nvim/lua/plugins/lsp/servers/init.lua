local servers = {
	deno = require("plugins.lsp.servers.deno"),
	eslint = require("plugins.lsp.servers.eslint"),
	go = require("plugins.lsp.servers.go"),
	lua = require("plugins.lsp.servers.lua"),
	prisma = require("plugins.lsp.servers.prisma"),
	rust = require("plugins.lsp.servers.rust"),
	tailwind = require("plugins.lsp.servers.tailwind"),
	typescript = require("plugins.lsp.servers.typescript"),
	zig = require("plugins.lsp.servers.zig"),
}

local function enable_completion()
	-- Extend default capabilities with completions
	local lspconfig_defaults = require("lspconfig").util.default_config

	lspconfig_defaults.capabilities =
		vim.tbl_deep_extend("force", lspconfig_defaults.capabilities, require("cmp_nvim_lsp").default_capabilities())
end

local function register_keymaps()
	vim.api.nvim_create_autocmd("LspAttach", {
		callback = function(event)
			require("client-side.keymaps").set_lsp(event.bufnr)
		end,
	})
end

local function register_servers()
	for _, server in pairs(servers) do
		if type(server) == "table" and type(server.setup) == "function" then
			server.setup()
		end
	end
end

function servers.setup()
	enable_completion()

	register_keymaps()

	register_servers()
end

return servers
