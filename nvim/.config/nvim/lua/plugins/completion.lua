return {
    'saghen/blink.cmp',
    version = '*',
    opts = {
        enabled = function()
            return not vim.tbl_contains({ "lua", "markdown", "rust" }, vim.bo.filetype)
            and vim.bo.buftype ~= "prompt"
            and vim.b.completion ~= false
        end,

        keymap = { preset = 'default' },

        appearance = {
            use_nvim_cmp_as_default = true,
            nerd_font_variant = 'mono'
        },
        sources = {
            default = { 'lsp', 'path', 'buffer', 'snippets' },
        },
        completion = {
            list = {
                selection = { preselect = false, auto_insert = true }
            },
            menu = { border = 'rounded' },
            documentation = {
                auto_show = true,
                window = { border = 'rounded' },
            }
        },
        signature = {
            enabled = false,
            window = { border = 'rounded' },
        },
    },
    opts_extend = { "sources.default" }
}
