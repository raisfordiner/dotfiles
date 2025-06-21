return {
    {
        "m4xshen/hardtime.nvim",
        enabled = false,
        lazy = false,
        dependencies = { "MunifTanjim/nui.nvim" },
        opts = {},
    },
    {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup({
                -- "html",
                -- "css",
                -- "js",
                -- "config",
                -- "conf",
                "*",
            }, { names = false })
        end,
    },
    {
        "ricefordinr/yet-another-surround.nvim",
        enabled = true,
        config = function()
            require("surround").setup()
        end,
    },
    {
        "abecodes/tabout.nvim",
        lazy = false,
        config = function()
            require("tabout").setup({
                tabkey = "<Tab>",             -- key to trigger tabout, set to an empty string to disable
                backwards_tabkey = "<S-Tab>", -- key to trigger backwards tabout, set to an empty string to disable
                act_as_tab = true,            -- shift content if tab out is not possible
                act_as_shift_tab = false,     -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
                default_tab = "<C-t>",        -- shift default action (only at the beginning of a line, otherwise <TAB> is used)
                -- default_shift_tab = "<C-d>", -- reverse shift default action,
                enable_backwards = true,      -- well ...
                completion = false,           -- if the tabkey is used in a completion pum
                tabouts = {
                    { open = "'", close = "'" },
                    { open = '"', close = '"' },
                    { open = "`", close = "`" },
                    { open = "(", close = ")" },
                    { open = "[", close = "]" },
                    { open = "{", close = "}" },
                },
                ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
                exclude = {}, -- tabout will ignore these filetypes
            })
        end,
    },
    {
        "rachartier/tiny-inline-diagnostic.nvim",
        event = "VeryLazy", -- Or `LspAttach`
        priority = 1000,    -- needs to be loaded in first
        config = function()
            require("tiny-inline-diagnostic").setup({
                preset = "nonerdfont",
                hi = {
                    mixing_color = "None",
                    background = "StatusLine"
                },
                options = {
                    add_messages = false,
                    multilines = {
                        enabled = true,
                        always_show = false,
                    },
                    show_all_diags_on_cursorline = false,
                },
            })
            vim.diagnostic.config({ virtual_text = false }) -- Only if needed in your configuration, if you already have native LSP diagnostics
        end,
    },
}
