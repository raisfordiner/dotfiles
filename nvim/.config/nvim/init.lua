------ File structure --------------------
------(For searching)
--- + Vim setting
--- + Bootstrap lazy.nvim
--- + Init plugins
--- + Setup LSP
--- + Setup utils plugins
--- + Custom keybindings
--- + Custom commands
--- + Look and feel
------------------------------------------


------ Vim settings ----------------------
-- set guicursor=i:ver25-iCursor
-- set expandtab
vim.cmd("set autoindent")
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set softtabstop=4")

--- Set lines nummbering: Relative with current line number
vim.cmd("set nu")
vim.cmd("set rnu")

--- " Keep {n} lines visiable before scrolling "
vim.cmd("set scrolloff=8")

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
    { "nvim-telescope/telescope-file-browser.nvim" },
	{ 'stevearc/oil.nvim', opts = {}, dependencies = { { "echasnovski/mini.icons", opts = {} } }, },
	{ "nvim-lualine/lualine.nvim" },
	{
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	},
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
        -- use opts = {} for passing setup options
        -- this is equivalent to setup({}) function
    },
    {
        "letieu/btw.nvim",
        config = function() require('btw').setup() end,
    },
    {
        "ggandor/leap.nvim",
        dependencies = { "tpope/vim-repeat" }
    },
    { 'echasnovski/mini.ai', version = '*' },
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
  },
})
------------------------------------------

------ Setup LSP -------------------------
require("mason").setup()
require("mason-lspconfig").setup{
	ensure_installed = {
        "lua_ls",
        "clangd",
        "rust_analyzer",
        "gopls",
    }
}

require("lspconfig").lua_ls.setup {}
require("lspconfig").clangd.setup {}
require("lspconfig").rust_analyzer.setup {}
require("lspconfig").gopls.setup {}

--- Config LSP - Vim
local _border = "rounded"

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover, {
    border = _border
  }
)

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
  vim.lsp.handlers.signature_help, {
    border = _border
  }
)

vim.diagnostic.config{
  float={border=_border}
}
------------------------------------------

------ Setup utils plugins ---------------
require("oil").setup({
	view_options = {
        show_hidden = true
    },
    sort = {
      -- sort order can be "asc" or "desc"
      -- see :help oil-columns to see which columns are sortable
      { "type", "asc" },
      { "icon", "asc" },
      { "name", "asc" },
    },
})

require("telescope").load_extension "file_browser"

require("leap").add_default_mappings()

require("mini.ai").setup()
------------------------------------------

------ Custom keybindings --------------------------
--- Vim keymaps
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzz')
vim.keymap.set('n', 'N', 'Nzz')
vim.keymap.set({'n','v'}, '<leader>p', '\"_dP')
vim.keymap.set({'n','v'}, '<leader>d', '\"_d')
vim.keymap.set({'n','v'}, 'c', '\"_c')
vim.keymap.set({'n','v'}, 'x', '\"_x')
vim.keymap.set({'n','v'}, 'X', '\"_x')

--- Telescope
local telescope_builtin = require("telescope.builtin")
vim.keymap.set('n', '<leader>ff', telescope_builtin.find_files, { desc = "Find files" })
vim.keymap.set('n', '<leader>fl', telescope_builtin.live_grep, { desc = "Grep content in files" })
vim.keymap.set('n', '<leader>fb', telescope_builtin.buffers, { desc = "List of buffers" })
vim.keymap.set('n', '<leader>fr', telescope_builtin.registers, { desc = "List of registers" })
vim.keymap.set('n', '<leader>ft', telescope_builtin.treesitter, { desc = "Element via TSP" })
vim.keymap.set('n', '<leader>fk', telescope_builtin.keymaps, { desc = "List of keymaps" })
vim.keymap.set("n", "<leader>fd", telescope_builtin.diagnostics, { desc = "List of LSP diagnostics"})
vim.keymap.set('n', '<leader>fgc', telescope_builtin.git_commits, { desc = 'Git commits'})
vim.keymap.set('n', '<leader>fgb', telescope_builtin.git_branches, { desc = 'Git branches'})
vim.keymap.set('n', '<leader>fgs', telescope_builtin.git_status, { desc = 'Git status'})
vim.keymap.set('n', '<leader>fgx', telescope_builtin.git_stash, { desc = 'Git stash'})
vim.keymap.set("n", "<leader>fb", ":Telescope file_browser<CR>", {desc = "Open file navigation"})

--- Oil
vim.keymap.set("n", "<leader>-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

--- Keymap for working with LSPs
vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, {})
vim.keymap.set('n', '<leader>gD', vim.lsp.buf.declaration, {})
vim.keymap.set({'n', 'v'}, '<leader>ca', vim.lsp.buf.code_action, {})
------------------------------------------

----- Custom commands ----------------------
vim.api.nvim_create_user_command(
	'GotoEr',
    vim.diagnostic.goto_next,
    {}
)
-------------------------------------------

------ Look and feel ----------------------
--- Catppuccin color scheme
require("catppuccin").setup({
	transparent_background = true,
})
vim.cmd.colorscheme("catppuccin")

-- Lualine
require("lualine").setup({
	sections = {
		lualine_a = {'mode'},
		lualine_b = {'filename','diagnostics','searchcount'},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {'filetype'},
		lualine_z = {'progress','location'}
	}
})
------------------------------------------
