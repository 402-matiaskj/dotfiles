return {
    --{
    --    "folke/tokyonight.nvim",
    --    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    --    priority = 1000, -- make sure to load this before all the other start plugins
    --    config = function()
    --        -- load the colorscheme here
    --        vim.cmd([[colorscheme tokyonight]])
    --    end,
    --},

    {
        "scottmckendry/cyberdream.nvim",
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            -- load the colorscheme here
            vim.cmd([[colorscheme cyberdream]])
        end,
    },

    {
        "nvim-treesitter/nvim-treesitter",
        lazy = true,
        priority = 100,
    },

    {
        "fatih/vim-go",
        ft = "go",
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "nvim-tree/nvim-web-devicons", -- optional, but recommended
        },
        lazy = false,             -- neo-tree will lazily load itself
    },
    {
        "GeorgesAlkhouri/nvim-aider",
        cmd = "Aider",
        -- Example key mappings for common actions:
        keys = {
            { "<leader>a/", "<cmd>Aider toggle<cr>",       desc = "Toggle Aider" },
            {
                "<leader>as",
                "<cmd>Aider send<cr>",
                desc = "Send to Aider",
                mode = { "n", "v" },
            },
            { "<leader>ac", "<cmd>Aider command<cr>",      desc = "Aider Commands" },
            { "<leader>ab", "<cmd>Aider buffer<cr>",       desc = "Send Buffer" },
            { "<leader>a+", "<cmd>Aider add<cr>",          desc = "Add File" },
            { "<leader>a-", "<cmd>Aider drop<cr>",         desc = "Drop File" },
            { "<leader>ar", "<cmd>Aider add readonly<cr>", desc = "Add Read-Only" },
            { "<leader>aR", "<cmd>Aider reset<cr>",        desc = "Reset Session" },
            -- Example nvim-tree.lua integration if needed
            { "<leader>a+", "<cmd>AiderTreeAddFile<cr>",   desc = "Add File from Tree to Aider",    ft = "NvimTree" },
            { "<leader>a-", "<cmd>AiderTreeDropFile<cr>",  desc = "Drop File from Tree from Aider", ft = "NvimTree" },
        },
        dependencies = {
            "folke/snacks.nvim",
            --- The below dependencies are optional
            "catppuccin/nvim",
            "nvim-tree/nvim-tree.lua",
        },
        config = true,
    },
    {
        "folke/trouble.nvim",
        opts = {}, -- for default options, refer to the configuration section for custom setup.
        cmd = "Trouble",
        keys = {
            {
                "<leader>xx",
                "<cmd>Trouble diagnostics toggle<cr>",
                desc = "Diagnostics (Trouble)",
            },
            {
                "<leader>xX",
                "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
                desc = "Buffer Diagnostics (Trouble)",
            },
            {
                "<leader>cs",
                "<cmd>Trouble symbols toggle focus=false<cr>",
                desc = "Symbols (Trouble)",
            },
            {
                "<leader>cl",
                "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
                desc = "LSP Definitions / references / ... (Trouble)",
            },
            {
                "<leader>xL",
                "<cmd>Trouble loclist toggle<cr>",
                desc = "Location List (Trouble)",
            },
            {
                "<leader>xQ",
                "<cmd>Trouble qflist toggle<cr>",
                desc = "Quickfix List (Trouble)",
            },
        },
    },
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        -- or                              , branch = '0.1.x',
        dependencies = { "nvim-lua/plenary.nvim" },
    },
}
