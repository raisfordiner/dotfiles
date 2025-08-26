return {
    -- {
    --     "williamboman/mason.nvim",
    --     config = function()
    --         require("mason").setup()
    --     end,
    -- },
    -- {
    --     "williamboman/mason-lspconfig.nvim",
    --     config = function()
    --         require("mason-lspconfig").setup({
    --             ensure_installed = {
    --                 --LSPs
    --                 -- "lua_ls",
    --                 -- "clangd",
    --                 -- "zls",
    --                 -- "rust_analyzer",
    --                 -- "gopls",
    --                 -- "templ",
    --                 -- "pyright",
    --                 -- "html",
    --                 -- "htmx",
    --                 -- "cssls",
    --                 -- "perlnavigator",
    --             },
    --         })
    --     end,
    -- },
    {
        "neovim/nvim-lspconfig",
        opts = {
            autoformat = false,
        },
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
                settings = {
                    haskell = {
                        formattingProvider = "stylish-haskell",
                    }
                }
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

            -- Settings and keymaps
            --
            -- local _border = "bold"
            --
            -- vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
            --     border = _border,
            -- })
            --
            -- vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
            --     border = _border,
            -- })
            --
            -- vim.diagnostic.config({
            --     float = { border = _border },
            -- })

            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
            vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, {})
            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
        end,
    },
}
