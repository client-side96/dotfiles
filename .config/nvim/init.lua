local utils = require("utils")

-- -----------------------------------------------------------------------------
-- GLOBALS & CONSTANTS:
-- -----------------------------------------------------------------------------

local special_dir_chars = { "[", "]", "(", ")" }

local function escape_special_dir_chars(input)
    for _, char in ipairs(special_dir_chars) do
        input = vim.fn.escape(input, char)
    end
    return input
end

local function split(input, sep)
    local result = {}
    for part in string.gmatch(input, "[^" .. sep .. "]+") do
        table.insert(result, part)
    end
    return result
end

-- -----------------------------------------------------------------------------
-- STATE:
-- -----------------------------------------------------------------------------

local s_prev_win = nil

-- -----------------------------------------------------------------------------
-- SETTINGS:
-- -----------------------------------------------------------------------------

vim.o.number = true
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.path = "**"
vim.o.termguicolors = true
vim.o.winborder = "rounded"
vim.o.wrap = false
vim.o.scrolloff = 8
vim.o.cursorline = true
vim.o.colorcolumn = "80"

vim.o.undofile = true
vim.o.smartcase = true

vim.opt.wildignore:append({
    "*/node_modules/**",
    "*/.git/**",
    "*/.next/**",
    "*/.DS_Store",
})
vim.o.wildignorecase = true
vim.o.wildmode = "noselect:lastused,longest,full"
--vim.o.wildoptions = "fuzzy,pum"
vim.o.wildoptions = "fuzzy"
vim.o.pumheight = 5
vim.o.pumborder = "rounded"
vim.o.pumwidth = 30
vim.o.incsearch = false
vim.opt.inccommand = "split"
vim.o.syntax = "off"

vim.g.netrw_liststyle = 3
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 20

-- -----------------------------------------------------------------------------
-- FILE FINDER:
-- -----------------------------------------------------------------------------

function FindFiles(cmdarg, _)
    return vim.fn.systemlist(
        "rg --files --hidden -g '!.git' | fzf --filter "
            .. escape_special_dir_chars(cmdarg)
    )
end

vim.o.findfunc = "v:lua.FindFiles"

-- -----------------------------------------------------------------------------
-- SEARCH FOR PATTERNS:
-- -----------------------------------------------------------------------------

vim.o.grepprg = "rg --vimgrep -uu -g '!.git' --ignore-file .gitignore"

-- -----------------------------------------------------------------------------
-- KEYMAPS:
-- -----------------------------------------------------------------------------

vim.g.mapleader = " "

vim.keymap.set("n", "<", "<<")
vim.keymap.set("n", ">", ">>")
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

vim.keymap.set("t", "<ESC>", "<C-\\><C-n>")

vim.keymap.set("n", "<leader>Y", '"+y', { noremap = true })
vim.keymap.set("v", "<leader>Y", '"+y', { noremap = true })

vim.keymap.set("n", "<leader>vs", ":so<CR>")
vim.keymap.set("n", "<leader>wv", ":vsplit<CR> <C-w>w")

vim.keymap.set("n", "<leader>n", function()
    local netrw_win = utils.get_win_from_ft("netrw")
    if netrw_win ~= nil then
        if vim.api.nvim_get_current_win() == netrw_win then
            if s_prev_win ~= nil then
                vim.api.nvim_set_current_win(s_prev_win)
            end

            vim.cmd("Lexplore!")
        else
            vim.api.nvim_set_current_win(netrw_win)
        end

        return nil
    end

    s_prev_win = vim.api.nvim_get_current_win()
    local file = split(vim.fn.expand("%:p:."), "/")

    local function walk_path(parts)
        if #parts == 0 then
            return
        end

        local head = escape_special_dir_chars(parts[1])
        vim.fn.search(head)

        if #parts > 1 then
            utils.feedkeys("<CR>", "m")
        end
        table.remove(parts, 1)

        vim.defer_fn(function()
            walk_path(parts)
        end, 10)
    end

    vim.cmd("Lexplore!")
    walk_path(file)
end)

vim.keymap.set("n", "<leader>qq", ":cclose<CR>") -- Close quickfix list
vim.keymap.set("n", "<leader>qt", ":tabclose<CR>")

vim.keymap.set("n", "<leader>b", ":buffer ")
vim.keymap.set("n", "<leader>f", ":find ")
vim.keymap.set("n", "<leader>/", ":silent grep! ")
vim.keymap.set("n", "<leader>h", ":help ")

vim.keymap.set("n", "<leader>a", function()
    vim.lsp.buf.code_action({
        filter = function(action)
            -- NOTE: Only show code actions that are actually available
            return action.disabled == nil
        end,
    })
end)
vim.keymap.set("n", "<leader>k", function()
    vim.lsp.buf.hover({ max_width = 80 })
end)
vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename)
vim.keymap.set("n", "<leader>s", function()
    vim.lsp.buf.document_symbol({ loclist = false })
end)
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "gr", vim.lsp.buf.references)
vim.keymap.set("n", "<leader>d", vim.diagnostic.setqflist)

vim.keymap.set("n", "<leader>xx", ":OverseerRun<CR>")
vim.keymap.set("n", "<leader>xl", ":OverseerToggle righ<CR>")

-- Git
vim.keymap.set("n", "<leader>gg", ":DiffviewOpen<CR>")
vim.keymap.set("n", "<leader>ga", ":vert belowright Git add -p<CR>")
vim.keymap.set("n", "<leader>gl", ":vert belowright Git log --graph<CR>")
vim.keymap.set("n", "<leader>gc", ":vert belowright Git commit<CR>")
vim.keymap.set("n", "<leader>gzz", ":Git stash<CR>")
vim.keymap.set("n", "<leader>gzp", ":Git stash pop<CR>")
vim.keymap.set("n", "<leader>gff", ":Git pull<CR>")
vim.keymap.set("n", "<leader>gpp", ":Git push<CR>")
vim.keymap.set("n", "<leader>gpf", ":Git push --force-with-lease<CR>")
vim.keymap.set("n", "<leader>gr", ":vert belowright Git rebase -i origin/")

-- -----------------------------------------------------------------------------
-- KEY REMAPPING:
-- -----------------------------------------------------------------------------

vim.keymap.set("i", "<CR>", function()
    if tonumber(vim.fn.pumvisible()) ~= 0 then
        utils.feedkeys("<C-y>")
    else
        utils.feedkeys("<CR>")
    end
end)

vim.keymap.set({ "i", "s" }, "<Tab>", function()
    if tonumber(vim.fn.pumvisible()) ~= 0 then
        utils.feedkeys("<C-n>")
    else
        utils.feedkeys("<Tab>")
    end
end)

vim.keymap.set({ "i", "s" }, "<S-Tab>", function()
    if tonumber(vim.fn.pumvisible()) ~= 0 then
        utils.feedkeys("<C-p>")
    else
        utils.feedkeys("<S-Tab>")
    end
end)

-- -----------------------------------------------------------------------------
-- AUTOMATIC COMMANDS:
-- -----------------------------------------------------------------------------
local function netrw_touch_file()
    local filename = vim.fn.input("Enter filename: ")
    if filename ~= "" then
        local current_dir = vim.b.netrw_curdir
        local filepath = current_dir .. "/" .. filename
        -- Create the file using touch command
        vim.fn.system("touch " .. vim.fn.shellescape(filepath))
        -- Refresh the Netrw buffer
        vim.cmd("edit " .. current_dir)
    end
end

vim.api.nvim_create_autocmd("FileType", {
    pattern = "netrw",
    callback = function()
        vim.keymap.set(
            "n",
            "%",
            netrw_touch_file,
            { buffer = true, remap = true }
        )
    end,
})

-- `help_window_right`:
-- Open Help in a vertical window split
vim.api.nvim_create_autocmd("BufWinEnter", {
    group = vim.api.nvim_create_augroup("help_window_right", {}),
    pattern = { "*.txt" },
    callback = function()
        if vim.o.filetype == "help" then
            vim.cmd.wincmd("L")
        end
    end,
})

-- Keeps the wild menu open when typing without using <TAB>
vim.api.nvim_create_autocmd("CmdlineChanged", {
    pattern = "[:/]*",
    callback = function()
        vim.fn.wildtrigger()
    end,
})

vim.api.nvim_create_autocmd("QuickFixCmdPost", {
    group = vim.api.nvim_create_augroup("auto_open_quickfix", {}),
    callback = function()
        vim.cmd("cwindow")
    end,
})

-- -----------------------------------------------------------------------------
-- PACKAGE MANAGER:
-- -----------------------------------------------------------------------------

vim.pack.add({
    { src = "https://github.com/mason-org/mason.nvim" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
    { src = "https://github.com/stevearc/conform.nvim" },
    { src = "https://github.com/zbirenbaum/copilot.lua" },
    { src = "https://github.com/stevearc/overseer.nvim" },
    { src = "https://github.com/sindrets/diffview.nvim" },
    { src = "https://github.com/tpope/vim-fugitive" },
})

vim.cmd("colorscheme minimal")

-- -----------------------------------------------------------------------------
-- LANGUAGE SERVER:
-- -----------------------------------------------------------------------------

require("mason").setup()

vim.lsp.enable({
    "biome",
    "lua_ls",
    "ts_ls",
    "tailwindcss",
    "eslint",
    "dart_ls",
		"rust_analyzer",
    "zls",
})

local lsp_augroup = vim.api.nvim_create_augroup("lsp-custom", {})
vim.api.nvim_create_autocmd("LspAttach", {
    group = lsp_augroup,
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)

        if client == nil then
            -- NOTE: If there is no client, we cannot apply any LSP functionality.
            return
        end

        if client:supports_method("textDocument/completion") then
            local chars = {}
            for i = 32, 126 do
                table.insert(chars, string.char(i))
            end
            client.server_capabilities.completionProvider.triggerCharacters =
                chars

            vim.lsp.completion.enable(
                true,
                client.id,
                ev.buf,
                { autotrigger = true }
            )
        end

        if
            not client:supports_method("textDocument/willSaveWaitUntil")
            and client:supports_method("textDocument/formatting")
        then
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = lsp_augroup,
                buffer = ev.buf,
                callback = function()
                    require("conform").format({ bufnr = ev.buf })
                end,
            })
        end
    end,
})

vim.cmd("set completeopt+=noselect")

-- -----------------------------------------------------------------------------
-- FORMATTING:
-- -----------------------------------------------------------------------------

require("conform").setup({
    formatters_by_ft = {
        javascript = { "prettier" },
        javascriptreact = { "prettier" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
        lua = { "stylua" },
    },
    default_format_opts = {
        lsp_format = "fallback",
    },
})

-- -----------------------------------------------------------------------------
-- LSP COLORS:
-- -----------------------------------------------------------------------------

vim.lsp.document_color.enable(true, 0, { style = "virtual" })

-- -----------------------------------------------------------------------------
-- DIAGNOSTICS:
-- -----------------------------------------------------------------------------

vim.diagnostic.config({ virtual_lines = { current_line = true } })

-- -----------------------------------------------------------------------------
-- TREESITTER:
-- -----------------------------------------------------------------------------

---@diagnostic disable-next-line: missing-fields
require("nvim-treesitter.configs").setup({
    ensure_installed = {
        "bash",
        "css",
        "dart",
        "dockerfile",
        "go",
        "html",
        "javascript",
        "json",
        "lua",
        "rust",
        "toml",
        "tsx",
        "typescript",
        "xml",
        "yaml",
        "zig",
    },
    highlight = {
        enable = true,
    },
})

-- -----------------------------------------------------------------------------
-- Copilot:
-- -----------------------------------------------------------------------------
require("copilot").setup({
    suggestion = {
        enabled = false,
        auto_trigger = true,
        keymap = {
            accept = "<C-j>",
        },
    },
})

-- -----------------------------------------------------------------------------
-- Diffview:
-- -----------------------------------------------------------------------------
require("diffview").setup({
    use_icons = false,
    file_panel = {
        listing_style = "list",
    },
})
