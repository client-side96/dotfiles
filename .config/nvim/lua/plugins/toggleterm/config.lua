require("toggleterm").setup()

local Terminal = require("toggleterm.terminal").Terminal

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

function Lazygit_toggle()
	lazygit_cmd:toggle()
end

require("client-side.keymaps").set_toggleterm()
