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
        -- -- example using `opts` for defining servers
        -- opts = {
        --     servers = {
        --         lua_ls = {},
        --         clangd = {},
        --         rust_analyzer = {},
        --         gopls = {}
        --     }
        -- },
        -- config = function(_, opts)
        --     local lspconfig = require('lspconfig')
        --     for server, config in pairs(opts.servers) do
        --         -- passing config.capabilities to blink.cmp merges with the capabilities in your
        --         -- `opts[server].capabilities, if you've defined it
        --         config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
        --         lspconfig[server].setup(config)
        --     end
        -- end
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
