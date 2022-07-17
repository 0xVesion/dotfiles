local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- Open Lexplore
keymap("n", "<Leader>e", ":Lex 15<cr>", opts)

