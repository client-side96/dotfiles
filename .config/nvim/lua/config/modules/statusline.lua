local devicons = require("nvim-web-devicons")

local statusline = {}

local surface_0 = "#313244"
local blue = "#89b4fa"
local peach = "#fab387"
local mauve = "#cba6f7"
local teal = "#94e2d5"

local mode_map = {
	n = " N ",
	i = " I ",
	v = " V ",
	c = " C ",
}

local mode_color_map = {
	n = "%#StatusNormalBg#",
	i = "%#StatusInsertBg#",
	v = "%#StatusVisualBg#",
	c = "%#StatusCommandBg#",
}

local function get_mode(mode)
	return mode_map[mode] or " OTHER "
end

local function get_mode_color(mode)
	return mode_color_map[mode] or "%#StatusNormalBg#"
end

local function get_branch()
	local branch = vim.fn.system("git branch --show-current 2> /dev/null | tr -d '\n'")

	if branch == "" then
		return ""
	else
		return string.format("  %s ", branch)
	end
end

local function get_icon(filename, extension)
	local icon = devicons.get_icon(filename, extension)
	if icon then
		return icon
	else
		return ""
	end
end

function statusline.setup()
	vim.api.nvim_set_hl(0, "StatusNormalBg", { bg = surface_0, fg = blue })
	vim.api.nvim_set_hl(0, "StatusInsertBg", { bg = surface_0, fg = peach })
	vim.api.nvim_set_hl(0, "StatusVisualBg", { bg = surface_0, fg = mauve })
	vim.api.nvim_set_hl(0, "StatusCommandBg", { bg = surface_0, fg = teal })

	local filename = vim.fn.expand("%:t")
	local extension = vim.fn.expand("%:e")
	local space = " "
	local mode = vim.api.nvim_get_mode().mode

	return table.concat({
		get_mode_color(mode),
		get_mode(mode),
		get_branch(),
		"%#StatusLine#",
		space,
		"%=",
		filename,
		"%=",
		get_mode_color(mode),
		space,
		get_icon(filename, extension),
		space,
		extension,
		space,
	})
end

return statusline
