return {
    {
        "catppuccin/nvim",
        enabled = false;
        name = "catppuccin",
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                flavour = "mocha",
                transparent_background = true,
                float = {
                    transparent = true,
                },
            })
            vim.cmd("colorscheme catppuccin")
        end
    },
    {
        "ellisonleao/gruvbox.nvim",
        enabled = false,
        priority = 1000,
        config = function ()
            vim.cmd("colorscheme gruvbox")
        end
        -- opts = ...,
    },
    {
        'uZer/pywal16.nvim',
        enabled = false,
        lazy = false,
        priority = 1000,
        config = function()
            require('pywal16').setup()
            vim.defer_fn(function()
                vim.cmd("colorscheme pywal16")
            end, 100)
        end,
    },
    {
        'projekt0n/github-nvim-theme',
        name = 'github-theme',
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            require('github-theme').setup({
                -- ...
            })

            vim.cmd('colorscheme github_light')
        end,
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {},
        config = function()
            require("ibl").setup({
                scope = { enabled = false },
            })
        end,
    },
    {
        "nvim-lualine/lualine.nvim",
        config = function()
            local function vim_logo()
                return [[  ]]
            end

            local function lsp_status()
                local msg = ""
                local buf_ft = vim.api.nvim_get_option_value("filetype", { buf = 0 })
                local clients = vim.lsp.get_clients()
                if next(clients) == nil then
                    return msg
                end
                for _, client in ipairs(clients) do
                    local filetypes = client.config.filetypes
                    if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                        return " "
                    end
                end
                return msg
            end


            require("lualine").setup({
                options = {
                    -- theme = 'pywal16-nvim',
                    section_separators = { left = "", right = "" },
                    component_separators = { left = "|", right = "|" },
                },
                sections = {
                    lualine_a = { vim_logo, "mode" },
                    lualine_b = { "filename", "progress" },
                    lualine_c = {},
                    lualine_x = { "searchcount", "diagnostics" },
                    lualine_y = { "filetype" },
                    lualine_z = {},
                },
                extensions = { "neo-tree", "oil" },
            })
        end,
    },
}
