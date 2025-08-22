return {
    "MeanderingProgrammer/render-markdown.nvim",
    enabled = false,
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
    opts = {},
    config = function()
        vim.keymap.set("n", "<leader>tmd", "<CMD>RenderMarkdown toggle<CR>", { desc = "Toggle Markdown renderer" })
    end,
}
