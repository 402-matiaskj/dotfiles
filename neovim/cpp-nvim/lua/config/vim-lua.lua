return {
	setup = function()
		local lazydev = require("lazydev")
		lazydev.library = {
			-- See the configuration section for more details
			-- Load luvit types when the `vim.uv` word is found
			{ path = "luvit-meta/library", words = { "vim%.uv" } },
		}
	end,
}
