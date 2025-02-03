return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup{
                ensure_installed = {
                    "lua_ls",
                    "clangd",
                    "rust_analyzer",
                    "gopls",
                    "pyright",
                }
            }
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup {}
            lspconfig.clangd.setup {}
            -- lspconfig.cmake.setup {}
            lspconfig.rust_analyzer.setup {}
            lspconfig.gopls.setup {}
            lspconfig.pyright.setup {}
        end
    },
}
