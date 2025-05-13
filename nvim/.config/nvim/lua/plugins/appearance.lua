return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        enabled = false,
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                transparent_background = true,
            })
            vim.cmd.colorscheme("catppuccin")
        end,
    },
    {
        "rose-pine/neovim",
        name = "rose-pine",
        enabled = false,
        config = function()
            require("rose-pine").setup({
                palette = {
                    main = {
                        foam = "#aac1aa",
                        pine = "#477f60"
                    }
                }
            })
            vim.cmd("colorscheme rose-pine")
        end
    },
    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000,
        config = function()
            require("gruvbox").setup({
                transparent_mode = true
            })
            vim.cmd("set background=light")
            vim.cmd("colorscheme gruvbox")
        end
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

            local catppuccin = {
                crust = "#11111b",
                red = "#f38ba8",
                blue = "#89b4fa",
                green = "#a6e3a1",
                yellow = "#eed49f",
                pink = "#f5bde6",
                mauve = "#c6a0f6",
                teal = "#8bd5ca",
                saphire = "#7dc4e4",
                lavender = "#b7bdf8",
                peach = "#f5a97f",
            }

            local rose_pine = {
                base = "#191724",
                love = "#eb6f92",
                gold = "#f6c177",
                rose = "#ebbcba",
                pine = "#477f60",
                foam = "#aac1aa",
                iris = "#c4a7e7",
            }

            local colors = rose_pine

            local customtheme = {
                visual = {
                    a = { fg = colors.base, bg = colors.iris, gui = "bold" },
                    b = { fg = colors.iris },
                    c = {},
                },
                replace = {
                    a = { fg = colors.base, bg = colors.rose, gui = "bold" },
                    b = { fg = colors.rose },
                    c = {},
                },
                inactive = {
                    a = { fg = colors.foam, bg = colors.base, gui = "bold" },
                    b = { fg = colors.foam },
                    c = {},
                },
                normal = {
                    a = { fg = colors.base, bg = colors.pine, gui = "bold" },
                    b = { fg = colors.pine },
                    c = {},
                },
                insert = {
                    a = { fg = colors.base, bg = colors.gold, gui = "bold" },
                    b = { fg = colors.gold },
                    c = {},
                },
                command = {
                    a = { fg = colors.base, bg = colors.love, gui = "bold" },
                    b = { fg = colors.love },
                    c = {},
                },
            }

            require("lualine").setup({
                options = {
                    section_separators = { left = "", right = "" },
                    component_separators = { left = "|", right = "|" },
                },
                sections = {
                    lualine_a = { vim_logo, "mode" },
                    lualine_b = { "filename", "diagnostics", "searchcount" },
                    lualine_c = {},
                    lualine_x = {},
                    lualine_y = { "filetype", lsp_status },
                    lualine_z = { "progress", "location" },
                },
                extensions = { "neo-tree", "oil" },
            })
        end,
    },
}
