-- Keymaps
vim.keymap.set("n", "<leader>xx", function()
	require("trouble").toggle("diagnostics")
end)
vim.keymap.set("n", "<leader>xq", function()
	require("trouble").toggle("quickfix")
end)
vim.keymap.set("n", "<leader>xl", function()
	require("trouble").toggle("loclist")
end)
-- I have replaced the standard quickfix window with trouble
vim.keymap.set("n", "gr", function()
	require("trouble").toggle("lsp_references")
end)
