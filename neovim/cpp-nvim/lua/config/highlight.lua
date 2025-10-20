return {
	setup = function()
		local ts = require("nvim-treesitter.configs")

		ts.setup({
			modules = {},
			sync_install = false,
			ignore_install = {},
			auto_install = true,
			ensure_installed = {
				-- code
				"lua",
				"go",
				"cpp",

				-- config files
				"vim",
				"yaml",
				"json",
				"dockerfile",
			},
			highlight = {
				enable = true,

				additional_vim_regex_highlighting = false,
			},
		})
	end,
}
