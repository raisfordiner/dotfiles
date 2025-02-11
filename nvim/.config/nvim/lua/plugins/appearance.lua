return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				transparent_background = true,
			})
			vim.cmd.colorscheme("catppuccin")
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			local function vim_logo()
				return [[  ]]
			end

			require("lualine").setup({
				sections = {
					lualine_a = { vim_logo, "mode" },
					lualine_b = { "filename", "diagnostics", "searchcount" },
					lualine_c = {},
					lualine_x = {},
					lualine_y = { "filetype" },
					lualine_z = { "progress", "location" },
				},
				extensions = { "neo-tree", "oil" },
			})
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {},
		config = function()
			require("ibl").setup({
				scope = { enabled = false },
			})
		end,
	},
}
