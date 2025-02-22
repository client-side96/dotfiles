local colors = require("client-side.colors")

local todo_comments = {}

local comment_map = {
	["lua"] = "--",
	["js"] = "//",
	["jsx"] = "//",
	["ts"] = "//",
	["tsx"] = "//",
	["go"] = "//",
	["rs"] = "//",
}

local comment_highlight_group = "TodoComments"

local function add_highlight(keyword, fg)
	local bg = vim.api.nvim_get_hl(0, { name = "Normal" }).bg
	vim.api.nvim_set_hl(0, comment_highlight_group .. keyword, { bg = bg, fg = fg, italic = true })
end

local function add_match(comment_char, keyword)
	vim.fn.matchadd(comment_highlight_group .. keyword, string.format("%s\\s\\zs%s:\\ze", comment_char, keyword))
end

local function highlight_comment(comment_char, keyword, fg)
	add_highlight(keyword, fg)
	add_match(comment_char, keyword)
end

function todo_comments.setup()
	local extension = vim.fn.expand("%:e")
	local comment_char = comment_map[extension] or "#"

	highlight_comment(comment_char, "TODO", colors.purple)
	highlight_comment(comment_char, "FIXME", colors.red)
	highlight_comment(comment_char, "NOTE", colors.blue)
end

return todo_comments
