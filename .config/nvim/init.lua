------ File structure --------------------
------(For searching)
--- + Vim setting
--- + Bootstrap lazy.nvim
--- + Init plugins
--- + Setup LSP
--- + Setup plugins
--- + Keys mod
--- + Color scheme
------------------------------------------


------ Vim settings ----------------------
-- set guicursor=i:ver25-iCursor
-- set expandtab
vim.cmd("set smartindent")
vim.cmd("set autoindent")
vim.cmd("set tabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set softtabstop=4")

--- Set lines nummbering: Relative with current line number
vim.cmd("set nu")
vim.cmd("set rnu")

--- " Keep {n} lines visiable before scrolling "
vim.cmd("set scrolloff=6")

--- Leaders
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
------------------------------------------

------ Bootstrap lazy.nvim ---------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.runtimepath:prepend(lazypath)
------------------------------------------

------ Init plugins ----------------------
require("lazy").setup({
  spec = {
    -- import your plugins
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
	{ 'nvim-telescope/telescope.nvim', tag = '0.1.8', dependencies = { 'nvim-lua/plenary.nvim' }  },
	{ 'stevearc/oil.nvim', opts = {}, dependencies = { { "echasnovski/mini.icons", opts = {} } }, },
	{ "nvim-lualine/lualine.nvim" },
	{
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	}
  },
})
------------------------------------------

------ Setup LSP -------------------------
require("mason").setup()
require("mason-lspconfig").setup{
	ensure_installed = { "lua_ls", "clangd", "rust_analyzer"}
}

require("lspconfig").lua_ls.setup {}
require("lspconfig").clangd.setup {}
require("lspconfig").rust_analyzer.setup {}
------------------------------------------

------ Setup utils plugins ---------------
require("oil").setup({
	view_options = { show_hidden = true }
})
require("lualine").setup({
	sections = {
		lualine_a = {'mode'},
		lualine_b = {'filename','searchcount'},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {'filetype'},
		lualine_z = {'progress','location'}
	}
})

--- Keymap for working with LSPs
vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {})
vim.keymap.set({'n', 'v'}, '<leader>ca', vim.lsp.buf.code_action, {})
------------------------------------------

------ Keys mod --------------------------
--- Telescope
local telescope_builtin = require("telescope.builtin")
vim.keymap.set('n', '<leader>ff', telescope_builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', telescope_builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', telescope_builtin.buffers, {})
vim.keymap.set('n', '<leader>fr', telescope_builtin.registers, {})
vim.keymap.set('n', '<leader>ft', telescope_builtin.treesitter, {})
vim.keymap.set('n', '<leader>fk', telescope_builtin.keymaps, {})

--- Oil
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
------------------------------------------

------ Color scheme ----------------------
--- Catppuccin
require("catppuccin").setup({
	transparent_background = true,
})
vim.cmd.colorscheme("catppuccin")
------------------------------------------
