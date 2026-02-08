return {
    "nvim-telescope/telescope.nvim", version = "*",
    dependencies = { "nvim-lua/plenary.nvim" },

    cmd = "Telescope",
    keys = {
        { "<leader>pf", function() require('telescope.builtin').find_files() end },
        { "<C-p>", function() require('telescope.builtin').git_files() end },
        { "<leader>ps", function()
            local builtin = require('telescope.builtin')

            local ok, search  = pcall(vim.fn.input, "Grep > ")
            if not ok then
                return
            end

            builtin.grep_string({ search = search })
        end }
    }
}
