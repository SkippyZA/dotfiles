return {
  {
    "tpope/vim-fugitive",
    lazy = false,
    keys = {
      { "<leader>gs", [[<cmd>:Git<cr>]], desc = "Open git status" },
    },
  },
  {
    "tpope/vim-rhubarb",
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end
  }
}
