-- imports --
local format = require("conform")

-- Keybinds --

-- conform --
vim.keymap.set("", "<leader>f", function()
	format.format({ async = true, lsp_fallback = true })
end)
