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
                    --LSPs
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
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            lspconfig.lua_ls.setup {
                capabilities = capabilities
            }
            lspconfig.clangd.setup {
                capabilities = capabilities
            }
            -- lspconfig.cmake.setup {}
            lspconfig.rust_analyzer.setup {
                capabilities = capabilities
            }
            lspconfig.gopls.setup {
                capabilities = capabilities
            }
            lspconfig.pyright.setup {
                capabilities = capabilities
            }
        end
    },
}
