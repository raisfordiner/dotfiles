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

-- Floating terminal
local state = {
  floating = {
    buf = -1,
    win = -1,
  }
}

local function create_floating_window(opts)
  opts = opts or {}
  local width = opts.width or math.floor(vim.o.columns * 0.8)
  local height = opts.height or math.floor(vim.o.lines * 0.8)

  -- Calculate the position to center the window
  local col = math.floor((vim.o.columns - width - 4) / 2)
  local row = math.floor((vim.o.lines - height - 4) / 2)

  -- Create a buffer
  local buf = nil
  if vim.api.nvim_buf_is_valid(opts.buf) then
    buf = opts.buf
  else
    buf = vim.api.nvim_create_buf(false, true) -- No file, scratch buffer
  end

  -- Define window configuration
  local win_config = {
    relative = "editor",
    width = width,
    height = height,
    col = col,
    row = row,
    style = "minimal", -- No borders or extra UI elements
    border = "rounded",
  }

  -- Create the floating window
  local win = vim.api.nvim_open_win(buf, true, win_config)

  return { buf = buf, win = win }
end

local toggle_terminal = function()
  if not vim.api.nvim_win_is_valid(state.floating.win) then
    state.floating = create_floating_window { buf = state.floating.buf }
    if vim.bo[state.floating.buf].buftype ~= "terminal" then
      vim.cmd('set shell=/usr/bin/zsh')
      vim.cmd.terminal()
    end
    vim.cmd('startinsert')
  else
    vim.api.nvim_win_hide(state.floating.win)
  end
end

-- Example usage:
-- Create a floating window with default dimensions
vim.api.nvim_create_user_command("Floaterminal", toggle_terminal, {})
vim.keymap.set({ "n", "v", "i", "t" }, "<C-f>", "<CMD>Floaterminal<CR>")
