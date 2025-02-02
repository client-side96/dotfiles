local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")

local lspconfig = require("lspconfig")
local lspconfig_defaults = lspconfig.util.default_config

local null_ls = require("null-ls")
local mason_null_ls = require("mason-null-ls")

local cmp = require("cmp")
local cmp_nvim_lsp = require("cmp_nvim_lsp")

local tailwind_tools = require("tailwind-tools")

mason.setup()

mason_lspconfig.setup({
	ensure_installed = { "lua_ls", "ts_ls", "tailwindcss" },
})

mason_null_ls.setup({
	ensure_installed = { "stylua", "prettier", "eslint" },
})

lspconfig_defaults.capabilities =
	vim.tbl_deep_extend("force", lspconfig_defaults.capabilities, cmp_nvim_lsp.default_capabilities())

local formatting_augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local lsp_formatting = function(bufnr)
	vim.lsp.buf.format({
		filter = function(client)
			return client.name == "null-ls"
		end,
		bufnr = bufnr,
		async = false,
	})
end

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

local on_attach = function(client, bufnr)
	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_clear_autocmds({ group = formatting_augroup, buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = formatting_augroup,
			buffer = bufnr,
			callback = function()
				lsp_formatting(bufnr)
			end,
		})
	end
end

lspconfig.lua_ls.setup({
	on_attach = on_attach,
})

lspconfig.ts_ls.setup({
	on_attach = on_attach,
})

lspconfig.tailwindcss.setup({
	on_attach = on_attach,
})

null_ls.setup({
	sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.prettier,
		require("none-ls.diagnostics.eslint"),
		require("none-ls.code_actions.eslint"),
	},
	on_attach = on_attach,
})

tailwind_tools.setup({
	conceal = {
		enabled = true,
	},
})

cmp.setup({
	sources = {
		{ name = "nvim_lsp" },
	},
	mapping = {
		["<C-e>"] = cmp.mapping.close(),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = false,
		}),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			else
				fallback()
			end
		end, { "i", "s" }),
	},
})
