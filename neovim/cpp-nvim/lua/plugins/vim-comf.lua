return {
	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = function()
			require("config.vim-lua").setup()
		end,
	},
	{
		"Bilal2453/luvit-meta",
		ft = "lua",
		lazy = true,
	},
}
