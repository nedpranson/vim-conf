return {
    "theprimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },

    opts = {
        settings = {
            save_on_toggle = true,
        },
    },

    keys = {
        { "<C-e>", function()
            local harpoon = require("harpoon")
            harpoon.ui:toggle_quick_menu(harpoon:list())
        end },
        { "<leader>a", function() require("harpoon"):list():add() end },

        { "<C-t>", function() require("harpoon"):list():select(1) end },
        { "<C-h>", function() require("harpoon"):list():select(2) end },
        { "<C-n>", function() require("harpoon"):list():select(3) end },
        { "<C-s>", function() require("harpoon"):list():select(4) end },
    }
}
