local gitsigns = require("gitsigns")
local Terminal = require("toggleterm.terminal").Terminal

gitsigns.setup({
	current_line_blame = true,
})

local lazygit_cmd = Terminal:new({
	cmd = "lazygit",
	hidden = true,
	direction = "float",
	float_opts = {
		width = function()
			return math.floor(vim.o.columns * 0.95)
		end,
		height = function()
			return math.floor(vim.o.lines * 0.95)
		end,
	},
})

local lazydocker_cmd = Terminal:new({
	cmd = "lazydocker",
	hidden = true,
	direction = "float",
	float_opts = {
		width = function()
			return math.floor(vim.o.columns * 0.95)
		end,
		height = function()
			return math.floor(vim.o.lines * 0.95)
		end,
	},
})

local top_cmd = Terminal:new({
	cmd = "btm",
	hidden = true,
	direction = "float",
	float_opts = {
		width = function()
			return math.floor(vim.o.columns * 0.95)
		end,
		height = function()
			return math.floor(vim.o.lines * 0.95)
		end,
	},
})

function Lazygit_toggle()
	lazygit_cmd:toggle()
end

function Lazydocker_toggle()
	lazydocker_cmd:toggle()
end

function Top_toggle()
	top_cmd:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>gg", "<cmd>lua Lazygit_toggle()<CR>", {
	noremap = true,
	silent = true,
})

vim.api.nvim_set_keymap("n", "<leader>md", "<cmd>lua Lazydocker_toggle()<CR>", {
	noremap = true,
	silent = true,
})
vim.api.nvim_set_keymap("n", "<leader>mm", "<cmd>lua Top_toggle()<CR>", {
	noremap = true,
	silent = true,
})
