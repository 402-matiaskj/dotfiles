-- Load settings
require("settings")

-- Load keybinds
require("keybinds")

-- Load plugins
require("config.lazy")

vim.diagnostic.config({
    virtual_text = false,
    --virtual_lines = true,
    virtual_lines = {
        current_line = true,
    },
})

-- autocmd to to copy file name and line number to clipboard so that i can
-- create breakpoints in delve faster.
