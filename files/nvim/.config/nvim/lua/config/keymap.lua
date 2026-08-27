vim.keymap.set('i', 'jk', '<esc>', { silent = true, desc = "Escape" })
vim.keymap.set('n', '<leader>,', ':w<cr>', { silent = true, desc = "Write the current file" })
vim.keymap.set('n', '<leader>.', '<c-^>', { desc = "Switch between current and previous buffer" })

vim.keymap.set('n', '<leader><space>', [[ <cmd>:%s/\s\+$<cr> ]], { desc = "Remove extra whitespace" })
vim.keymap.set('n', '<leader>/', [[ "fyiw :/<c-r>f<cr> ]], { noremap = true, desc = "Search for word under the cursor" })
vim.keymap.set('n', '<space>', [[ <cmd>:set hlsearch! hlsearch?<cr> ]], { noremap = true, desc = "Clear highlighted search" })

vim.keymap.set('n', '\\t', ':set ts=2 sts=2 sw=2 noet<cr>', { desc = "Use tabs" })
vim.keymap.set('n', '\\s', ':set ts=2 sts=2 sw=2 et<cr>', { desc = "Use tabs" })
