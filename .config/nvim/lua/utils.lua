local utils = {}

---Executes the passed keys. Used for remapping keys.
---@param keys string
function utils.feedkeys(keys)
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(keys, true, false, true), 'n', true)
end

return utils
