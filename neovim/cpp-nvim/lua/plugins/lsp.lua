return {
	-- LSP and LSP config
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			-- This is limited to lsp, which is kinda lame, this e.g. cannot
			-- install clang-format or goimports, which is odd
			-- TODO: move this to a different file
			ensure_installed = {
				-- lua
				"lua_ls",
				"stylua",

				-- c++
				"clangd",

				-- golang
				"gopls",
			},
		},
		dependencies = {
			{
				"mason-org/mason.nvim",
				opts = {},
			},
			{ "neovim/nvim-lspconfig" },
		},
	},

	-- Completion
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-nvim-lsp",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lua",
		},
		opts = function()
			require("config.cmp").setup()
		end,
	},

	-- fomatting
	{
		"stevearc/conform.nvim",
		opts = function()
			require("config.format").setup()
		end,
	},

	-- Linting
	{
		"mfussenegger/nvim-lint",
		config = function()
			require("config.lint").setup()
		end,
	},

	-- Syntax Highlighting
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "master",
		lazy = false,
		build = ":TSUpdate",
		opts = function()
			require("config.highlight").setup()
		end,
	},
}
