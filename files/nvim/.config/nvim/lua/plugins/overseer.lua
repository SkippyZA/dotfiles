return {
  {
    'stevearc/overseer.nvim',
    lazy = true,
    keys = {
      { "<C-o><C-r>", [[<cmd>:OverseerRun<cr>]] },
      { "<C-o><C-t>", [[<cmd>:OverseerToggle<cr>]] },
    },
    opts = {},
  }
}
