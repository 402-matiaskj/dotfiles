vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		vim.keymap.set("n", "K", function()
			vim.lsp.buf.hover({
				max_height = 25, -- Sets the maximum height of the hover window to 25 lines
				max_width = 120, -- Sets the maximum width of the hover window to 120 characters
			})
		end, { remap = false, silent = true, buffer = ev.buf, desc = "Hover documentation" })
	end,
})

-- enable lsps --
vim.lsp.enable("clangd")
vim.lsp.enable("gopls")
