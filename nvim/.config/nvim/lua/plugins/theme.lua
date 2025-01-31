return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                transparent_background = true,
            })
            vim.cmd.colorscheme("catppuccin")
        end
    },
    {
        'norcalli/nvim-colorizer.lua',
        config = function()
            require("colorizer").setup({
                'html', 'css', 'js'
            }, { names = false })
        end
    },
    {
        "nvim-lualine/lualine.nvim",
        config = function()
            local function vim_logo()
                return [[  ]]
            end

            require("lualine").setup({
                sections = {
                    lualine_a = {vim_logo,'mode'},
                    lualine_b = {'filename','diagnostics','searchcount'},
                    lualine_c = {},
                    lualine_x = {},
                    lualine_y = {'filetype'},
                    lualine_z = {'progress','location'}
                },
                extensions = { 'neo-tree', 'oil' }
            })
        end
    }
}
