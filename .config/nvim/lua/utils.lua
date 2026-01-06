local utils = {}

---Executes the passed keys. Used for remapping keys.
---@param keys string
---@param mode string?
function utils.feedkeys(keys, mode)
	mode = mode or "n"
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(keys, true, false, true), mode, false)
end

---Checks if a filetype is present in any open window and returns the window id if found.
---@param filetype string
---@return integer?
function utils.get_win_from_ft(filetype)
	for _, win in ipairs(vim.api.nvim_list_wins()) do
		local buf = vim.api.nvim_win_get_buf(win)
		local ft = vim.api.nvim_get_option_value("filetype", { buf = buf })
		if ft == filetype then
			return win
		end
	end
	return nil
end

return utils
