vim.g.mapleader = " "

vim.keymap.set("n", "<leader>wv", vim.cmd.vsplit)

-- vim.keymap.set("n", ",", vim.cmd.noh)

-- vim.keymap.set("n", "gl", "$", { noremap = true })
-- vim.keymap.set("v", "gl", "$", { noremap = true })
-- vim.keymap.set("n", "gs", "^", { noremap = true })
-- vim.keymap.set("v", "gs", "^", { noremap = true })
-- vim.keymap.set("n", "ge", "G", { noremap = true })
-- vim.keymap.set("v", "ge", "G", { noremap = true })

vim.keymap.set("n", "<leader>Y", '"+y', { noremap = true })
vim.keymap.set("v", "<leader>Y", '"+y', { noremap = true })

vim.keymap.set("n", "<", "<<")
vim.keymap.set("n", ">", ">>")
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")
