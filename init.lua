vim.g.mapleader = " "

vim.o.nu = true
vim.o.relativenumber = true

vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

vim.o.smartindent = true
vim.o.wrap = false

vim.g.omni_sql_no_default_maps = 1

vim.opt.swapfile = false
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.updatetime = 50

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("x", "<leader>p", "\"_dP")

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")

vim.keymap.set("n", "<leader>e", "<C-w>d", { remap = true })
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help)

vim.diagnostic.config({
    virtual_text = true,
    update_in_insert = false,
})

vim.api.nvim_create_autocmd("ColorScheme", {
    callback = function()
        -- transparent background
        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
        vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
        vim.api.nvim_set_hl(0, "Pmenu", { bg = "none" })
        vim.api.nvim_set_hl(0, "Terminal", { bg = "none" })
        vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
        vim.api.nvim_set_hl(0, "FoldColumn", { bg = "none" })
        vim.api.nvim_set_hl(0, "Folded", { bg = "none" })
        vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
        vim.api.nvim_set_hl(0, "WhichKeyFloat", { bg = "none" })
        vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "none" })
        vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
        vim.api.nvim_set_hl(0, "TelescopePromptBorder", { bg = "none" })
        vim.api.nvim_set_hl(0, "TelescopePromptTitle", { bg = "none" })

        -- transparent background for neotree
        vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "none" })
        vim.api.nvim_set_hl(0, "NeoTreeVertSplit", { bg = "none" })
        vim.api.nvim_set_hl(0, "NeoTreeWinSeparator", { bg = "none" })
        vim.api.nvim_set_hl(0, "NeoTreeEndOfBuffer", { bg = "none" })

        -- transparent background for nvim-tree
        vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NvimTreeVertSplit", { bg = "none" })
        vim.api.nvim_set_hl(0, "NvimTreeEndOfBuffer", { bg = "none" })

        -- transparent notify background
        vim.api.nvim_set_hl(0, "NotifyINFOBody", { bg = "none" })
        vim.api.nvim_set_hl(0, "NotifyERRORBody", { bg = "none" })
        vim.api.nvim_set_hl(0, "NotifyWARNBody", { bg = "none" })
        vim.api.nvim_set_hl(0, "NotifyTRACEBody", { bg = "none" })
        vim.api.nvim_set_hl(0, "NotifyDEBUGBody", { bg = "none" })
        vim.api.nvim_set_hl(0, "NotifyINFOTitle", { bg = "none" })
        vim.api.nvim_set_hl(0, "NotifyERRORTitle", { bg = "none" })
        vim.api.nvim_set_hl(0, "NotifyWARNTitle", { bg = "none" })
        vim.api.nvim_set_hl(0, "NotifyTRACETitle", { bg = "none" })
        vim.api.nvim_set_hl(0, "NotifyDEBUGTitle", { bg = "none" })
        vim.api.nvim_set_hl(0, "NotifyINFOBorder", { bg = "none" })
        vim.api.nvim_set_hl(0, "NotifyERRORBorder", { bg = "none" })
        vim.api.nvim_set_hl(0, "NotifyWARNBorder", { bg = "none" })
        vim.api.nvim_set_hl(0, "NotifyTRACEBorder", { bg = "none" })
        vim.api.nvim_set_hl(0, "NotifyDEBUGBorder", { bg = "none" })
    end,
})

vim.pack.add({
    "https://github.com/nedpranson/omarchy-themer",
})

require("omarchy-themer").setup()

vim.pack.add({
    "https://github.com/nvim-treesitter/nvim-treesitter",
})

vim.api.nvim_create_autocmd('FileType', {
    callback = function()
        pcall(vim.treesitter.start)
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end,
})

vim.pack.add({
    "https://github.com/neovim/nvim-lspconfig",
    "https://github.com/mason-org/mason.nvim",
    "https://github.com/mason-org/mason-lspconfig.nvim",
})

require("mason").setup()
require("mason-lspconfig").setup()

vim.pack.add({
    "https://github.com/L3MON4D3/LuaSnip",
    "https://github.com/rafamadriz/friendly-snippets",
    "https://github.com/saghen/blink.lib",
    "https://github.com/saghen/blink.cmp",
})

require("blink.cmp").build():pwait()
require("luasnip.loaders.from_vscode").lazy_load()
require("blink.cmp").setup()

vim.pack.add({
    "https://github.com/nvim-lua/plenary.nvim",
    "https://github.com/nvim-telescope/telescope.nvim",
    { src = "https://github.com/theprimeagen/harpoon", version = "harpoon2" },
})

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>pf', builtin.find_files)
vim.keymap.set('n', '<C-p>', builtin.git_files)
vim.keymap.set('n', '<leader>ps', function ()
    local ok, search  = pcall(vim.fn.input, "Grep > ")
    if ok then
        builtin.grep_string({ search = search })
    end
end)

local harpoon = require("harpoon")

harpoon:setup({ settings = { save_on_toggle = true } })

vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<C-t>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<C-h>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<C-n>", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<C-s>", function() harpoon:list():select(4) end)

vim.pack.add({
    "https://github.com/mbbill/undotree",
})

vim.keymap.set('n', '<leader>u', "<cmd>UndotreeToggle<cr>")

vim.pack.add({
    "https://github.com/zeybek/camouflage.nvim",
})

require("camouflage").setup({
    policy = {
        enabled = true,
        default_action = "ignore",
        rules = { {
            action = "mask",
            parser = "env",
        } },
    },
})

vim.keymap.set('n', '<leader>ct', "<cmd>CamouflageToggle<cr>")
vim.keymap.set('n', '<leader>cr', "<cmd>CamouflageReveal<cr>")
vim.keymap.set('n', '<leader>cy', "<cmd>CamouflageYank<cr>")
