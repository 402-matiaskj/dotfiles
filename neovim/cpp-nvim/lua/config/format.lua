-- Conform.nvim
-- Run ConformInfo to see what formatters are installed
return {
	setup = function()
		local format = require("conform")
		format.setup({
			formatters_by_ft = {
				-- lua --
				lua = { "stylua" },

				-- C --
				c = { "clang-format" },
				h = { "clang-format" },

				-- c++ --
				cpp = { "clang-format" },
				hpp = { "clang-format" },

				-- golang --
				go = {
					"goimports", -- imports
					"goimports-reviser", -- groups imports based on type
					"gofmt", -- code
				},
			},

			-- autocmd --
			-- format on save --
			-- using BufWritePost instead of BufWritePre allows us
			-- to format asynchronously.
			vim.api.nvim_create_autocmd("BufWritePost", {
				pattern = "*",
				callback = function(args)
					format.format({ async = true, bufnr = args.buf })
				end,
			}),
		})
	end,
}
