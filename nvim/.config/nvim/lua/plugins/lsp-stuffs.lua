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
                ensure_installed = {
                    --LSPs
                    -- "lua_ls",
                    -- "clangd",
                    -- "zls",
                    -- "rust_analyzer",
                    -- "gopls",
                    -- "templ",
                    -- "pyright",
                    -- "html",
                    -- "htmx",
                    -- "cssls",
                    -- "perlnavigator",
                },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            lspconfig.lua_ls.setup({
                capabilities = capabilities,
            })
            lspconfig.clangd.setup({
                capabilities = capabilities,
            })
            -- lspconfig.ccls.setup({
            --     capabilities = capabilities,
            -- })
            lspconfig.zls.setup({
                capabilities = capabilities,
            })
            lspconfig.hls.setup({
                capabilities = capabilities,
            })
            -- lspconfig.cmake.setup {}
            lspconfig.gopls.setup({
                capabilities = capabilities,
            })
            lspconfig.templ.setup({
                capabilities = capabilities,
            })
            lspconfig.pyright.setup({
                capabilities = capabilities,
            })
            lspconfig.html.setup({
                capabilities = capabilities,
            })
            lspconfig.htmx.setup({
                capabilities = capabilities,
            })
            lspconfig.cssls.setup({
                capabilities = capabilities,
            })
            lspconfig.perlnavigator.setup({
                capabilities = capabilities,
            })
        end,
    },
}
