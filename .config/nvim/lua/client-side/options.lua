vim.opt.number = true

vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.colorcolumn = { "80", "100", "120" }
vim.opt.signcolumn = "yes"

vim.opt.list = true
vim.opt.listchars:append({ space = "·", tab = "  " })
vim.opt.fillchars = { eob = "." }

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.softtabstop = 2

vim.opt.swapfile = false
vim.opt.backup = false

vim.opt.scrolloff = 8
vim.opt.updatetime = 50

vim.opt.wrap = false
vim.opt.showmode = false

vim.opt.exrc = true
vim.opt.laststatus = 2 -- Or 3 for global statusline
vim.opt.statusline = " %t %m %= %l:%c ♥ "
vim.opt.wrap = true

vim.cmd.colorscheme("carbonfox")
