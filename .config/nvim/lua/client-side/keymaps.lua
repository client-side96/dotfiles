-- Global keymaps
vim.g.mapleader = " "

vim.keymap.set("n", "<leader>wv", ":vsplit<cr> <c-w>w")

vim.keymap.set("n", "<leader>Y", '"+y', { noremap = true })
vim.keymap.set("v", "<leader>Y", '"+y', { noremap = true })

vim.keymap.set("n", "<", "<<")
vim.keymap.set("n", ">", ">>")
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")
