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

local function insert_recenter()
	local cursor_pos = vim.api.nvim_win_get_cursor(0)
	local row, col = cursor_pos[1], cursor_pos[2]
	local line = vim.api.nvim_get_current_line()

	if not line then
		return
	end -- Prevent errors if the line is nil

	local at_end = col >= #line

	vim.cmd("normal! zz")

	-- Fix position of cursor at end of line
	if at_end then
		vim.api.nvim_win_set_cursor(0, { row, math.min(col + 1, #line) })
	end
end

local group = vim.api.nvim_create_augroup("KeepCentered", { clear = true })

vim.api.nvim_create_autocmd("CursorMoved", {
	group = group,
	pattern = "*",
	command = "normal! zz",
})

vim.api.nvim_create_autocmd("TextChangedI", {
	group = group,
	pattern = "*",
	callback = insert_recenter,
})
