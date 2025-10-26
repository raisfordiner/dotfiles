local LSPs = {
    "lua_ls",
    "clangd",
    -- "zls",
    -- "rust_analyzer",
    -- "gopls",
    -- "templ",
    -- "pyright",
    -- "html",
    -- "htmx",
    -- "cssls",
    -- "perlnavigator",
}

return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = LSPs,
            })
        end,
    },
}
