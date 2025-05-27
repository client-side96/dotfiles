local harpoon = require("harpoon")

harpoon.setup()

vim.keymap.set("n", "<leader>wa", function()
	harpoon:list():add()
end)
vim.keymap.set("n", "<leader>ww", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end)

vim.keymap.set("n", "<leader>wj", function()
	harpoon:list():prev()
end)
vim.keymap.set("n", "<leader>wk", function()
	harpoon:list():next()
end)
