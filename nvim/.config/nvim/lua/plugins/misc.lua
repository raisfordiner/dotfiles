return {
	{
		"letieu/btw.nvim",
		config = function()
			require("btw").setup()
		end,
	},
	{
		"kawre/leetcode.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
		},
		opts = {
			-- configuration goes here
		},
	},
}
