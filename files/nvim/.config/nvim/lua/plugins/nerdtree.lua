return {
  "scrooloose/nerdtree",
  dependencies = {
    {
      "ryanoasis/vim-devicons",
      config = function()
        vim.cmd("call webdevicons#refresh()")
      end
    },
    { "Xuyuanp/nerdtree-git-plugin", },
    { "tiagofumo/vim-nerdtree-syntax-highlight" },
  },
  keys = {
    { "<leader>k", [[<cmd>:NERDTreeToggle<cr>]] },
    { "<leader>y", [[<cmd>:NERDTreeFind<cr>]] },
  },
  setup = function()
    vim.cmd("call webdevicons#refresh()")
  end,
  config = function()
    vim.g.NERDTreeWinSize = 45
    vim.g.NERDTreeQuitOnOpen = 1
    vim.g.NERDTreeAutoDeleteBuffer = 1

    -- Enable highlighting of the filename too
    -- vim.g.NERDTreeFileExtensionHighlightFullName = 1
    -- vim.g.NERDTreeExactMatchHighlightFullName = 1
    -- vim.g.NERDTreePatternMatchHighlightFullName = 1
  end
}
