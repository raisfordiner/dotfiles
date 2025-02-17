vim.api.nvim_create_autocmd({ "TextYankPost" }, {
	desc = "Highlight texts on yank",
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Some tweaks to make more sense of the builtin terminal
vim.keymap.set("t", "<ESC><ESC>", "<C-\\><C-n>", { desc = "Return to normal mode from term mode" })
vim.api.nvim_create_autocmd({ "TermOpen" }, {
	desc = "Run some config that make more sense to terminal",
	callback = function()
		vim.cmd("set nonu")
		vim.cmd("set nornu")
	end,
})
