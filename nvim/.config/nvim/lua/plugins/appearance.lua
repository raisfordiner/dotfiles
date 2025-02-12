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
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {},
		config = function()
			require("ibl").setup({
				scope = { enabled = false },
			})
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			local function vim_logo()
				return [[  ]]
			end

			local function lsp_status()
				local msg = ""
				local buf_ft = vim.api.nvim_get_option_value("filetype", { buf = 0 })
				local clients = vim.lsp.get_clients()
				if next(clients) == nil then
					return msg
				end
				for _, client in ipairs(clients) do
					local filetypes = client.config.filetypes
					if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
						return " "
					end
				end
				return msg
			end

			require("lualine").setup({
				sections = {
					lualine_a = { vim_logo, "mode" },
					lualine_b = { "filename", "diagnostics", "searchcount" },
					lualine_c = {},
					lualine_x = {},
					lualine_y = { "filetype", lsp_status },
					lualine_z = { "progress", "location" },
				},
				extensions = { "neo-tree", "oil" },
			})
		end,
	},
}
