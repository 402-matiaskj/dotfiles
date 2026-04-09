return {
	{
		"scottmckendry/cyberdream.nvim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		opts = function()
			-- load the colorscheme here
			vim.cmd([[colorscheme cyberdream]])
		end,
	},
	{
		"mfussenegger/nvim-dap",
		config = function()
			require("config.dap").setup()
		end,
	},
	{
		"leoluz/nvim-dap-go",
		opts = function()
			require("dap-go").setup()
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			"mfussenegger/nvim-dap",
			"nvim-neotest/nvim-nio",
		},
	},
}
