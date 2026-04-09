return {
	{
		"olimorris/codecompanion.nvim",
		config = function()
			require("config.ai").setup()
		end,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"github/copilot.vim",
		},
	},
}
