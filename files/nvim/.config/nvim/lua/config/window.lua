function WinMove(key)
  local curwin = vim.fn.winnr()

  vim.cmd("wincmd " .. key)

  if (curwin == vim.fn.winnr()) then
    if ( key == "j" or key == "k" ) then
      print("--- 1 key = " .. key)
      vim.cmd("wincmd s")
    else
      print("--- 2 key = " .. key)
      vim.cmd("wincmd v")
    end

    vim.cmd("wincmd " .. key)
  end
end

vim.keymap.set('n', '<C-h>', '<cmd>lua WinMove("h")<cr>', { silent = true, desc = "Move to window (or create) - left" })
vim.keymap.set('n', '<C-j>', '<cmd>lua WinMove("j")<cr>', { silent = true, desc = "Move to window (or create) - down" })
vim.keymap.set('n', '<C-k>', '<cmd>lua WinMove("k")<cr>', { silent = true, desc = "Move to window (or create) - up" })
vim.keymap.set('n', '<C-l>', '<cmd>lua WinMove("l")<cr>', { silent = true, desc = "Move to window (or create) - right" })

vim.keymap.set('n', 'tn', '<cmd>tabnew<cr>', { silent = true, desc = "Create a new tab" })
vim.keymap.set('n', 'H', 'gT', { silent = true, desc = "move to tab on the left" })
vim.keymap.set('n', 'L', 'gt', { silent = true, desc = "move to tab on the right" })
