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
	ensure_installed = {
		"lua_ls",
		"ts_ls",
		"tailwindcss",
		"denols",
		"eslint",
		"gopls",
		"rust_analyzer",
		"prismals",
	},
})

mason_null_ls.setup({
	ensure_installed = { "stylua", "prettier" },
})

lspconfig_defaults.capabilities =
	vim.tbl_deep_extend("force", lspconfig_defaults.capabilities, cmp_nvim_lsp.default_capabilities())

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

local formatting_augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local on_attach = function(client, bufnr, should_use_lsp)
	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_clear_autocmds({ group = formatting_augroup, buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = formatting_augroup,
			buffer = bufnr,
			callback = function()
				-- NOTE: Use `null-ls` for formatting as the default
				should_use_lsp = should_use_lsp or false

				if should_use_lsp then
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

lspconfig.lua_ls.setup({
	on_attach = on_attach,
})

lspconfig.prismals.setup({
	on_attach = on_attach,
})

local typescript_root_patterns = { "package.json" }
require("typescript-tools").setup({
	on_attach = on_attach,
	root_dir = lspconfig.util.root_pattern(typescript_root_patterns),
	single_file_support = false,
	settings = {
		jsx_close_tag = {
			enable = true,
		},
	},
})

lspconfig.eslint.setup({
	on_attach = on_attach,
})

local deno_root_patterns = { "deno.json", "deno.jsonc" }
lspconfig.denols.setup({
	on_attach = function(client, bufnr)
		on_attach(client, bufnr, true)
	end,
	root_dir = lspconfig.util.root_pattern(deno_root_patterns),
})

lspconfig.gopls.setup({
	on_attach = function(client, bufnr)
		on_attach(client, bufnr, true)
	end,
})

lspconfig.rust_analyzer.setup({
	on_attach = function(client, bufnr)
		on_attach(client, bufnr, true)
	end,
})

lspconfig.tailwindcss.setup({
	on_attach = on_attach,
})

null_ls.setup({
	sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.prettier.with({
			condition = function(u)
				return not u.root_has_file(deno_root_patterns) and u.root_has_file(typescript_root_patterns)
			end,
		}),
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
