return {
  "vim-test/vim-test",
  keys = {
    { "<leader>tt", [[<cmd>:TestNearest<cr>]], { silent = true, desc = "Run closest test" } },
    { "<leader>T", [[<cmd>:TestFile<cr>]], { silent = true, desc = "Run tests for current file" } },
    { "<leader>ta", [[<cmd>:TestSuite<cr>]], { silent = true, desc = "Run all tests" } },
    { "<leader>l", [[<cmd>:TestLast<cr>]], { silent = true, desc = "Rerun the last test" } },
  },
  config = function ()
    vim.g["test#strategy"] = {
      nearest = "neovim",
      file    = "neovim",
      suite   = "basic",
    }
  end
}
