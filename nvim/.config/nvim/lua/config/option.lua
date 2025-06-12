------ Vim settings ----------------------
-- vim.cmd("set guicursor=i:ver25-iCursor")
vim.cmd("set termguicolors")
vim.cmd("set nowrap")
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

--- No timmeout on key sequence
vim.cmd("set notimeout")
vim.cmd("set ttimeout")

--- Used lualine to show mode instead
vim.cmd("set noshowmode")

--- Leaders
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

------------------------------------------

----- Keymapping -------------------------
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")
vim.keymap.set({ "n", "v" }, "<leader>p", '"_dP')
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d')
vim.keymap.set({ "n", "v" }, "<leader>D", '"_d')
vim.keymap.set({ "n", "v" }, "c", '"_c')
vim.keymap.set({ "n", "v" }, "x", '"_x')
vim.keymap.set({ "n", "v" }, "X", '"_x')
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<leader><leader>X", "<CMD>:source %<CR>")
vim.keymap.set("n", "<leader><leader>x", ":.lua<CR>")
vim.keymap.set("v", "<leader><leader>x", ":lua<CR>")

vim.keymap.set("v", "Y", '"+y')
------------------------------------------

----- Custom commands ----------------------
vim.api.nvim_create_user_command("GotoEr", vim.diagnostic.goto_next, {})
