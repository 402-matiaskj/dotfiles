local lsp = require("lsp-zero")

-- Setup language servers
-- Golang is handled through the vim-go plugin
require("mason-lspconfig").setup({
	handlers = {
		lsp.default_setup,
		angularls = function()
			require("lspconfig").angularls.setup({})
		end,

		lua_ls = function()
			local lua_opts = lsp.nvim_lua_ls()
			require("lspconfig").lua_ls.setup(lua_opts)
		end,

		vtsls = function()
			require("lspconfig").vtsls.setup({})
		end,

		-- Not installed, find out if ensure installed still works
		--dartls = function ()
		--    require'lspconfig'.dartls.setup({})
		--end,
	},
})

-- Linter test, this will not reside here in the future
-- revisit when we get formatters to work
-- eslint complains about missing config, I need to figure out how to set the
-- config for eslint
require("lint").linters_by_ft = {
	javascript = { "eslint_d" },
	typescript = { "eslint_d" },
}
-- lint whenever we exit insert mode I think, and only when text changed
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	callback = function()
		require("lint").try_lint()
	end,
})
