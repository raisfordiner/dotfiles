return {
	{
		"letieu/btw.nvim",
		config = function()
			require("btw").setup({
				text = "I use Neovim ( btw! )",
			})
		end,
	},
	-- {
	-- 	"kawre/leetcode.nvim",
	-- 	dependencies = {
	-- 		"nvim-telescope/telescope.nvim",
	-- 		"nvim-lua/plenary.nvim",
	-- 		"MunifTanjim/nui.nvim",
	-- 	},
	-- 	opts = {
	-- 		-- configuration goes here
	-- 	},
	-- },
}
