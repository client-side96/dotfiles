local statusline = require("config.modules.statusline")
vim.opt.number = true

vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.colorcolumn = { "80", "100", "120" }
vim.opt.signcolumn = "yes"

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

vim.opt.statusline = "%{%v:lua.require('config.modules.statusline').setup()%}"
