
------ Vim settings ----------------------
-- vim.cmd("set guicursor=i:ver25-iCursor")
vim.cmd("set termguicolors")
-- vim.cmd("set expandtab")
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

----- Keymapping -------------------------
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzz')
vim.keymap.set('n', 'N', 'Nzz')
vim.keymap.set({'n','v'}, '<leader>p', '\"_dP')
vim.keymap.set({'n','v'}, '<leader>d', '\"_d')
vim.keymap.set({'n','v'}, '<leader>D', '\"_d')
vim.keymap.set({'n','v'}, 'c', '\"_c')
vim.keymap.set({'n','v'}, 'x', '\"_x')
vim.keymap.set({'n','v'}, 'X', '\"_x')
------------------------------------------

----- Custom commands ----------------------
vim.api.nvim_create_user_command(
	'GotoEr',
    vim.diagnostic.goto_next,
    {}
)
