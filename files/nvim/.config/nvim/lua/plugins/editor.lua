return {
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({})
    end
  },

  -- Custom text objects to select parts of a variable
  { 
    "kana/vim-textobj-user",
    dependencies = {
      "Julian/vim-textobj-variable-segment",
    }
  },

  -- Unix commands in vim
  {
    "tpope/vim-eunuch",
  },

  -- easily interact with tmux from vim
  {
    "preservim/vimux",
    -- vmap <silent> <leader>vs "vy :call VimuxRunCommand("clear; " . @v)<cr>
    -- nmap <silent> <leader>vs vip<leader>vs<CR>
  },

  -- resize windows with h,j,k,l
  {
    "simeji/winresizer",
    keys = {
      {"<c-t>", "<cmd>:WinResizerStartResize<cr>"},
    },
    config = true
  }
}
