local keyset = vim.keymap.set

return {
  -- search inside files using ack. Same as command line ack utility, but use :Ack
  {
    "mileszs/ack.vim",
    lazy = false,
    config = function()
      -- ack without opening the first match (replaces Ack with Ack!)
      vim.keymap.set('ca', 'Ack', [[Ack!]])
    end
  },

  -- Unix commands in vim
  {
    "tpope/vim-eunuch",
  },

  -- easily interact with tmux from vim
  {
    "preservim/vimux",
    lazy = false,
    config = function()
      keyset("n", "<leader>np", ":VimuxInterruptRunner<cr>:VimuxPromptCommand<cr>")
      keyset("n", "<leader>nn", ":VimuxInterruptRunner<cr>:VimuxRunLastCommand<cr>")
      keyset("n", "<leader>nc", ":VimuxInterruptRunner<cr>")

      vim.cmd("vmap <silent> <leader>vs \"vy :call VimuxRunCommand(\"clear; \" . @v)<cr>")
      vim.cmd("nmap <silent> <leader>vs vip<leader>vs<CR>")
    end,
  },

  -- resize windows with h,j,k,l
  {
    "simeji/winresizer",
    keys = {
      {"<c-t>", "<cmd>:WinResizerStartResize<cr>"},
    },
    config = true
  },

  -- browse tags
  {
    "majutsushi/tagbar",
    keys = {
      {"<leader>tb", ":TagbarToggle<cr>"}
    },
    config = function()
      vim.g.tagbar_autofocus = 1    -- focus tagbar when opening
      vim.g.tagbar_width = 60       -- set the width to 60 columns (default: 40)
    end
  }
}
