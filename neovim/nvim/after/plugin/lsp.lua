--local lsp = require("lsp-zero")
--
--vim.opt.signcolumn = "no"
--
--lsp.on_attach(function(client, bufnr)
--	lsp.default_keymaps({ buffer = bufnr })
--end)
--
--local cmp = require("cmp")
--local cmp_action = lsp.cmp_action()
--
--local cmp_select = { behavior = cmp.SelectBehavior.Select }
--
----require("luasnip.loaders.from_vscode").lazy_load()
--
--cmp.setup({
--	enabled = true,
--	window = {
--		completion = cmp.config.window.bordered(),
--		documentation = cmp.config.window.bordered(),
--	},
--
--	mapping = cmp.mapping.preset.insert({
--		-- confirm completion
--		["<CR>"] = cmp.mapping.confirm({ select = false }),
--		["<C-y>"] = cmp.mapping.confirm({ select = true }),
--
--		["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
--		["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
--
--		["<C-f>"] = cmp_action.luasnip_jump_forward(),
--		["<C-b>"] = cmp_action.luasnip_jump_backward(),
--
--		["<C-Space>"] = cmp.mapping.complete(),
--
--		["<C-u>"] = cmp.mapping.scroll_docs(-4),
--		["<C-d>"] = cmp.mapping.scroll_docs(4),
--	}),
--
--	snippet = {
--		expand = function(args)
--			require("luasnip").lsp_expand(args.body)
--		end,
--	},
--	sources = {
--		{ name = "path" },
--		{ name = "nvim_lsp" },
--		{ name = "nvim_lua" },
--		{ name = "luasnip", keyword_length = 2 },
--		{ name = "buffer", keyword_length = 3 },
--	},
--	preselect = cmp.PreselectMode.Item,
--})
--
--require("mason").setup()
--require("mason-lspconfig").setup()
--

-- Reserve a space in the gutter
-- This will avoid an annoying layout shift in the screen
vim.opt.signcolumn = "yes"

-- Add cmp_nvim_lsp capabilities settings to lspconfig
-- This should be executed before you configure any language server
local lspconfig_defaults = require("lspconfig").util.default_config
lspconfig_defaults.capabilities =
    vim.tbl_deep_extend("force", lspconfig_defaults.capabilities, require("cmp_nvim_lsp").default_capabilities())

-- This is where you enable features that only work
-- if there is a language server active in the file
vim.api.nvim_create_autocmd("LspAttach", {
    desc = "LSP actions",
    callback = function(event)
        local opts = { buffer = event.buf }

        vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
        vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
        vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
        vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
        vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
        vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
        vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
        vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
        vim.keymap.set({ "n", "x" }, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
        vim.keymap.set("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
    end,
})

local cmp = require("cmp")

cmp.setup({
    sources = {
        { name = "nvim_lsp" },
    },
    snippet = {
        expand = function(args)
            -- You need Neovim v0.10 to use vim.snippet
            vim.snippet.expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({}),
})

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(event)
        local id = vim.tbl_get(event, "data", "client_id")
        local client = id and vim.lsp.get_client_by_id(id)
        if client == nil then
            return
        end

        -- make sure there is at least one client with formatting capabilities
        if client.supports_method("textDocument/formatting") then
            require("lsp-zero").buffer_autoformat()
        end
    end,
})

require("mason").setup({})
require("mason-lspconfig").setup({
    -- Replace the language servers listed here
    -- with the ones you want to install
    ensure_installed = { "lua_ls", "rust_analyzer" },
    handlers = {
        function(server_name)
            require("lspconfig")[server_name].setup({})
        end,
    },
})
