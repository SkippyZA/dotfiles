return {
  "fatih/vim-go",
  ft = "go",
  build = function()
    vim.cmd.GoInstallBinaries()
  end,
  config = function()
    -- do something
  end
}
