local M = {}
local keymap = vim.api.nvim_set_keymap
local default_opts = {noremap = true, silent = true}

function M.setup()
    keymap("n", "<leader>T", "<Cmd>NERDTreeClose<CR>", default_opts)
end

return M
