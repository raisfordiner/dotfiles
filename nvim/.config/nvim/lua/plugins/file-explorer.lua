return {
    {
        'stevearc/oil.nvim',
        opts = {},
        dependencies = {},
        config = function()
            require("oil").setup({
                view_options = {
                    show_hidden = true
                },
                sort = {
                    -- sort order can be "asc" or "desc"
                    -- see :help oil-columns to see which columns are sortable
                    { "type", "asc" },
                    { "icon", "asc" },
                    { "name", "asc" },
                },
            })
            vim.keymap.set(
                "n",
                "<leader>-",
                "<CMD>Oil<CR>",
                { desc = "Open parent directory" }
            )
        end
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
            -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
        },
        config = function()
            vim.keymap.set(
                "n",
                "<leader>b",
                "<CMD>Neotree toggle float<CR>",
                { desc = "Toggle Neotree floating" }
            )
            vim.keymap.set(
                "n",
                "<leader>B",
                "<CMD>Neotree toggle left<CR>",
                { desc = "Toggle Neotree on left" }
            )
        end
    },
}
