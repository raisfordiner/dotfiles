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

			local colors = {
				crust = "#11111b",
				red = "#f38ba8",
				blue = "#89b4fa",
				green = "#a6e3a1",
				yellow = "#eed49f",
				pink = "#f5bde6",
				mauve = "#c6a0f6",
				teal = "#8bd5ca",
				saphire = "#7dc4e4",
				lavender = "#b7bdf8",
				peach = "#f5a97f",
			}

			local customtheme = {
				visual = {
					a = { fg = colors.crust, bg = colors.mauve, gui = "bold" },
					b = { fg = colors.mauve },
					c = {},
				},
				replace = {
					a = { fg = colors.crust, bg = colors.peach, gui = "bold" },
					b = { fg = colors.peach },
					c = {},
				},
				inactive = {
					a = { fg = colors.blue, bg = colors.crust, gui = "bold" },
					b = { fg = colors.lavender },
					c = {},
				},
				normal = {
					a = { fg = colors.crust, bg = colors.saphire, gui = "bold" },
					b = { fg = colors.saphire },
					c = {},
				},
				insert = {
					a = { fg = colors.crust, bg = colors.green, gui = "bold" },
					b = { fg = colors.green },
					c = {},
				},
				command = {
					a = { fg = colors.crust, bg = colors.red, gui = "bold" },
					b = { fg = colors.red },
					c = {},
				},
			}

			require("lualine").setup({
				options = {
					theme = customtheme,
					section_separators = { left = "", right = "" },
					component_separators = { left = "|", right = "|" },
				},
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
