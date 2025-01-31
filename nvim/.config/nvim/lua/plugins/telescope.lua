return {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            local builtin = require("telescope.builtin")
            vim.keymap.set(
                'n',
                '<leader>ff',
                builtin.find_files,
                { desc = "Find files" }
            )
            vim.keymap.set(
                'n',
                '<leader>fg',
                builtin.live_grep,
                { desc = "Grep content in files" }
            )
            vim.keymap.set(
                'n',
                '<leader>fb',
                builtin.buffers,
                { desc = "List of buffers" }
            )
            vim.keymap.set(
                'n',
                '<leader>fr',
                builtin.registers,
                { desc = "List of registers" }
            )
            vim.keymap.set(
                'n',
                '<leader>ft',
                builtin.treesitter,
                { desc = "Element via TSP" }
            )
            vim.keymap.set(
                'n',
                '<leader>fk',
                builtin.keymaps,
                { desc = "List of keymaps" }
            )
            vim.keymap.set(
                "n",
                "<leader>fd",
                builtin.diagnostics,
                { desc = "List of LSP diagnostics" }
            )
            vim.keymap.set(
                "n",
                "<leader>fc",
                builtin.commands,
                { desc = "List of Vim commands" }
            )
        end
    },
}
