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

-- Get default capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()

-- For golang we need to set this to true so that when we import a package that
-- we havent donwloaded with go get, we don't have to restart vim to get rid of
-- the import error.
capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = true

vim.lsp.config("gopls", {
	capabilities = capabilities,
})

-- enable lsps --
vim.lsp.enable("clangd")
vim.lsp.enable("gopls")
