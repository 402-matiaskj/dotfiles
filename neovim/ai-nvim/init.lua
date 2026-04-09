require("config.lazy")
require("config.buffer")
require("config.diagnostics")
require("config.lsp")



-- function to put current filepath + linenum in clipboard
local function get_filepath_with_linenumber()
	local buffer = vim.api.nvim_get_current_buf()
	local cursor = vim.api.nvim_win_get_cursor(0)
	vim.fn.setreg("+", vim.api.nvim_buf_get_name(buffer) .. ":" .. cursor[1])
end

vim.keymap.set("n", "<leader>b", get_filepath_with_linenumber, { noremap = true })
