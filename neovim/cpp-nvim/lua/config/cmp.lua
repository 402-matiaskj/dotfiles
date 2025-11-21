-- TODO: add icons to the compleation menu, simmilar to how vscode does it
return {
    setup = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")

        cmp.setup({
            -- we tell nvim-cmp to use luasnip to expand snippets
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },

            -- Keymaps
            -- not sure where i have these from but i quite like them
            mapping = cmp.mapping.preset.insert({
                ["<C-n>"] = cmp.mapping.select_next_item(),
                ["<C-p>"] = cmp.mapping.select_prev_item(),

                ["<C-y>"] = cmp.mapping.confirm({
                    select = true,
                }),
            }),

            -- group index creates a hierarchy of sources such that
            -- if a completion with a lower number is found all other
            -- with higher values are not concidered
            -- priority affects the order of the sources shown
            sources = {
                { name = "nvim_lsp" },
                { name = "luasnip" },
                {
                    name = "buffer",
                    group_index = 2,
                },
                {
                    name = "path",
                    group_index = 2,
                },
                {
                    name = "lazydev",
                    group_index = 0, -- not quite sure why we set this to 0
                },
            },

            -- DEBUG: enable this to show the source in the suggesion list
            formatting = {
                format = function(entry, vim_item)
                    vim_item.menu = "[" .. entry.source.name .. "]"
                    return vim_item
                end,
            },

            -- show some cool virtual text of the current selected compleation
            experimental = {
                ghost_text = true,
            },

            -- we use the custom view for entries in the pmenu since
            -- native is not very well supported, i had hoped that
            -- native would make the menu respect 'vim.o.winborder'
            -- but it does not
            view = {
                entries = {
                    name = "custom",
                    selection_order = "near_cursor", -- better presentation if window is rendered above the cursor
                },
            },

            -- make the virtual window easier to distinguish from the text around
            -- For some reason the 'vim.o.winborder = "double"' results in
            -- thinner lines for native windows. e.g. the K menu
            -- (documenteation). So there is a bit of a discrepency in the
            -- styling here, but I'l just have to live with it untill i can find
            -- a solution
            window = {
                documentation = {
                    border = "double",
                },
                completion = {
                    border = "double",
                },
            },
        })
    end,
}
