local function on_win_enter()
	vim.opt.colorcolumn = "80"
	vim.opt.cursorline = true
	vim.opt.cursorcolumn = true
end

local function on_win_leave()
	vim.opt.colorcolumn = "0"
	vim.opt.cursorline = false
	vim.opt.cursorcolumn = false
end

vim.api.nvim_create_augroup("WindowManagement", { clear = true })
vim.api.nvim_create_autocmd("WinEnter", {
	group = "WindowManagement",
	callback = on_win_enter,
})
vim.api.nvim_create_autocmd("WinLeave", {
	group = "WindowManagement",
	callback = on_win_leave,
})
