local todo_comments = require("client-side.todo-comments")

todo_comments.setup()

vim.api.nvim_set_keymap("n", "<C-c>", ":Commentary<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<C-c>", ":Commentary<CR>", { noremap = true, silent = true })
