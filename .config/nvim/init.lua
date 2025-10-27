local utils = require("utils")

-- -----------------------------------------------------------------------------
-- SETTINGS:
-- -----------------------------------------------------------------------------

vim.o.number = true
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.path = "**"
vim.o.termguicolors = true
vim.o.winborder = "rounded"
vim.o.wrap = false
vim.o.scrolloff = 8
vim.o.cursorline = true

vim.o.undofile = true
vim.o.smartcase = true

vim.opt.wildignore:append { "*/node_modules/**", "*/.git/**", "*/.next/**", "*/.DS_Store" }
vim.o.wildignorecase = true
vim.o.wildmode = "noselect:lastused,longest,full"
vim.o.wildoptions = "fuzzy,pum"
vim.o.pumheight = 5
vim.o.pumborder = "rounded"
vim.o.pumwidth = 30
vim.o.incsearch = false


-- -----------------------------------------------------------------------------
-- FILE FINDER:
-- -----------------------------------------------------------------------------

function FindFiles(cmdarg, _)
	cmdarg = vim.fn.escape(cmdarg, "[")
	cmdarg = vim.fn.escape(cmdarg, "]")
	cmdarg = vim.fn.escape(cmdarg, "(")
	cmdarg = vim.fn.escape(cmdarg, ")")

	return vim.fn.systemlist(
		'rg --files --hidden -g \'!.git\' | fzf --filter ' .. cmdarg
	)
end

vim.o.findfunc = 'v:lua.FindFiles'


-- -----------------------------------------------------------------------------
-- SEARCH FOR PATTERNS:
-- -----------------------------------------------------------------------------

vim.o.grepprg = "rg --vimgrep -uu -g \'!.git\' --ignore-file .gitignore"


-- -----------------------------------------------------------------------------
-- KEYMAPS:
-- -----------------------------------------------------------------------------

vim.g.mapleader = " "


vim.keymap.set("n", "<", "<<")
vim.keymap.set("n", ">", ">>")
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

vim.keymap.set("n", "<leader>Y", '"+y', { noremap = true })
vim.keymap.set("v", "<leader>Y", '"+y', { noremap = true })

vim.keymap.set("n", "<leader>vs", ":so<CR>")
vim.keymap.set("n", "<leader>wv", ":vsplit<CR> <C-w>w")

vim.keymap.set("n", "<leader>n", ":Fern . -drawer -toggle -right -reveal=% <CR>")


vim.keymap.set("n", "<leader>q", ":cclose<CR>") -- Close quickfix list

vim.keymap.set("n", "<leader>b", ":buffer ")
vim.keymap.set("n", "<leader>f", ":find ")
vim.keymap.set("n", "<leader>/", ":silent grep! ")
vim.keymap.set("n", "<leader>h", ":help ")

vim.keymap.set("n", "<leader>a", function()
	vim.lsp.buf.code_action({
		filter = function(action)
			return action.disabled == nil
		end,
	})
end)
vim.keymap.set("n", "<leader>k", function()
	vim.lsp.buf.hover({ max_width = 50 })
end)
vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename)
vim.keymap.set("n", "<leader>s", function()
	vim.lsp.buf.document_symbol({ loclist = false })
end)
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "gr", vim.lsp.buf.references)
vim.keymap.set("n", "<leader>d", vim.diagnostic.setqflist)

vim.keymap.set("n", "<leader>xx", ":OverseerRun<CR>")
vim.keymap.set("n", "<leader>xl", ":OverseerToggle<CR>")



-- -----------------------------------------------------------------------------
-- KEY REMAPPING:
-- -----------------------------------------------------------------------------

vim.keymap.set("i", "<CR>", function()
	if tonumber(vim.fn.pumvisible()) ~= 0 then
		utils.feedkeys("<C-y>")
	else
		utils.feedkeys("<CR>")
	end
end)

vim.keymap.set({ "i", "s" }, "<Tab>", function()
	if tonumber(vim.fn.pumvisible()) ~= 0 then
		utils.feedkeys("<C-n>")
	else
		utils.feedkeys("<Tab>")
	end
end)

vim.keymap.set({ "i", "s" }, "<S-Tab>", function()
	if tonumber(vim.fn.pumvisible()) ~= 0 then
		utils.feedkeys("<C-p>")
	else
		utils.feedkeys("<S-Tab>")
	end
end)


-- -----------------------------------------------------------------------------
-- AUTOMATIC COMMANDS:
-- -----------------------------------------------------------------------------

-- `help_window_right`:
-- Open Help in a vertical window split
vim.api.nvim_create_autocmd("BufWinEnter", {
	group = vim.api.nvim_create_augroup("help_window_right", {}),
	pattern = { "*.txt" },
	callback = function()
		if vim.o.filetype == 'help' then vim.cmd.wincmd("L") end
	end
})

-- Keeps the wild menu open when typing without using <TAB>
vim.api.nvim_create_autocmd("CmdlineChanged", {
	pattern = "[:/]*",
	callback = function()
		vim.fn.wildtrigger()
	end,
})

vim.api.nvim_create_autocmd("QuickFixCmdPost", {
	group = vim.api.nvim_create_augroup("auto_open_quickfix", {}),
	callback = function()
		vim.cmd("cwindow")
	end
})

-- -----------------------------------------------------------------------------
-- PACKAGE MANAGER:
-- -----------------------------------------------------------------------------

vim.pack.add({
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/catppuccin/nvim" },
	{ src = "https://github.com/projekt0n/github-nvim-theme",    name = 'github-theme' },
	{ src = "https://github.com/lambdalisue/vim-fern" },
	{ src = "https://github.com/stevearc/conform.nvim" },
	{ src = "https://github.com/zbirenbaum/copilot.lua" },
	{ src = "https://github.com/stevearc/overseer.nvim",         version = "stevearc-rewrite" },
	{ src = "https://github.com/windwp/nvim-autopairs" }
})


-- -----------------------------------------------------------------------------
-- THEME:
-- -----------------------------------------------------------------------------
vim.cmd("colorscheme github_dark_default")


-- -----------------------------------------------------------------------------
-- FILE SYSTEM:
-- -----------------------------------------------------------------------------

local function init_fern()
	vim.keymap.set("n", "<Plug>(fern-action-open)", "<Plug>(fern-action-open:select)")
	vim.keymap.set("n", "<Tab>", "<Plug>(fern-action-expand)")
	vim.keymap.set("n", "<S-Tab>", "<Plug>(fern-action-collapse)")
end

vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("fern-custom", {}),
	pattern = "fern",
	callback = function()
		init_fern()
	end
})


-- -----------------------------------------------------------------------------
-- AUTO CLOSING DELIMETERS:
-- -----------------------------------------------------------------------------

require("nvim-autopairs").setup({
	check_ts = true
})

-- -----------------------------------------------------------------------------
-- LANGUAGE SERVER:
-- -----------------------------------------------------------------------------

require("mason").setup()

vim.lsp.enable({ "lua_ls", "ts_ls", "tailwindcss", "eslint", "dart_ls" })

local lsp_augroup = vim.api.nvim_create_augroup("lsp-custom", {})
vim.api.nvim_create_autocmd("LspAttach", {
	group = lsp_augroup,
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)

		if client == nil then
			-- NOTE: If there is no client, we cannot apply any LSP functionality.
			return
		end

		if client:supports_method('textDocument/completion') then
			local chars = {}
			for i = 32, 126 do
				table.insert(chars, string.char(i))
			end
			client.server_capabilities.completionProvider.triggerCharacters = chars

			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
		end

		if not client:supports_method('textDocument/willSaveWaitUntil')
				and client:supports_method('textDocument/formatting') then
			vim.api.nvim_create_autocmd('BufWritePre', {
				group = lsp_augroup,
				buffer = ev.buf,
				callback = function()
					require("conform").format({ bufnr = ev.buf })
				end,
			})
		end
	end
})
vim.cmd("set completeopt+=noselect")


-- -----------------------------------------------------------------------------
-- FORMATTING:
-- -----------------------------------------------------------------------------

require("conform").setup({
	formatters_by_ft = {
		javascript = { "prettier" },
		javascriptreact = { "prettier" },
		typescript = { "prettier" },
		typescriptreact = { "prettier" },
	},
	default_format_opts = {
		lsp_format = "fallback",
	},
})


-- -----------------------------------------------------------------------------
-- LSP COLORS:
-- -----------------------------------------------------------------------------

vim.lsp.document_color.enable(true, 0, { style = "virtual" })


-- -----------------------------------------------------------------------------
-- DIAGNOSTICS:
-- -----------------------------------------------------------------------------

vim.diagnostic.config({ virtual_lines = { current_line = true } })


-- -----------------------------------------------------------------------------
-- TREESITTER:
-- -----------------------------------------------------------------------------

---@diagnostic disable-next-line: missing-fields
require("nvim-treesitter.configs").setup({
	ensure_installed = { "lua", "typescript" },
	highlight = {
		enable = true
	}
})


-- -----------------------------------------------------------------------------
-- Copilot:
-- -----------------------------------------------------------------------------
require("copilot").setup({
	suggestion = {
		enabled = true,
		auto_trigger = true,
		keymap = {
			accept = "<C-j>",
		},
	},
})
