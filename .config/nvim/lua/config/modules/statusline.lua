local devicons = require("nvim-web-devicons")
local colors = require("core.colors")

local statusline = {}

local function get_mode(mode)
	local mode_map = {
		n = " N ",
		i = " I ",
		v = " V ",
		c = " C ",
	}
	return mode_map[mode] or " OTHER "
end

local function get_mode_color(mode)
	local mode_color_map = {
		n = "%#StatusLineNormal#",
		i = "%#StatusLineInsert#",
		v = "%#StatusLineVisual#",
		c = "%#StatusLineCommand#",
	}
	return mode_color_map[mode] or "%#StatusLineNormal#"
end

local function get_branch()
	local branch = vim.fn.system("git branch --show-current 2> /dev/null | tr -d '\n'")

	if branch == "" then
		return ""
	else
		return string.format("  %s ", branch)
	end
end

function statusline.setup()
	vim.api.nvim_set_hl(0, "StatusLineNormal", { bg = colors.subtle_bg, fg = colors.blue })
	vim.api.nvim_set_hl(0, "StatusLineInsert", { bg = colors.subtle_bg, fg = colors.yellow })
	vim.api.nvim_set_hl(0, "StatusLineVisual", { bg = colors.subtle_bg, fg = colors.purple })
	vim.api.nvim_set_hl(0, "StatusLineCommand", { bg = colors.subtle_bg, fg = colors.cyan })

	local filename = vim.fn.expand("%:t")
	local extension = vim.fn.expand("%:e")
	local space = " "
	local mode = vim.api.nvim_get_mode().mode

	return table.concat({
		get_mode_color(mode),
		get_mode(mode),
		get_branch(),
		"%#StatusLine:StatusLineNC#",
		space,
		"%=",
		filename,
		"%=",
		get_mode_color(mode),
		space,
		devicons.get_icon(filename, extension) or "",
		space,
		space,
	})
end

return statusline
