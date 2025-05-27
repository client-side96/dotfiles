local servers = {
	biome = require("plugins.lsp.servers.biome"),
	dart = require("plugins.lsp.servers.dart"),
	eslint = require("plugins.lsp.servers.eslint"),
	go = require("plugins.lsp.servers.go"),
	html = require("plugins.lsp.servers.html"),
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
		vim.tbl_deep_extend("force", lspconfig_defaults.capabilities, require("blink.cmp").get_lsp_capabilities())
end

local function register_keymaps()
	vim.api.nvim_create_autocmd("LspAttach", {
		callback = function(event)
			local opts = { buffer = event.bufnr }

			vim.keymap.set("n", "<leader>k", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
			vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
			vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
			vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
			vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
			vim.keymap.set("n", "gR", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
			vim.keymap.set("n", "gS", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
			vim.keymap.set("n", "<leader>r", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
			vim.keymap.set("n", "<leader>a", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
			vim.keymap.set({ "n", "x" }, "<leader>F", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
			vim.keymap.set("n", "[d", function()
				vim.diagnostic.goto_prev({ float = { source = true } })
			end, opts)
			vim.keymap.set("n", "]d", function()
				vim.diagnostic.goto_next({ float = { source = true } })
			end, opts)
			vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
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
