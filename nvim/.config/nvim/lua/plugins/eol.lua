return {
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup({
				"html",
				"css",
				"js",
			}, { names = false })
		end,
	},
	{
		"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
		config = function()
			require("lsp_lines").setup()
			vim.diagnostic.config({
				virtual_text = false,
			})
			vim.keymap.set("", "<Leader>tvl", require("lsp_lines").toggle, { desc = "Toggle virtual lsp_lines" })
		end,
	},
}
