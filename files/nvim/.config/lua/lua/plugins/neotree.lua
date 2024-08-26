return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  keys = {
    { "<leader>k", [[<cmd>:Neotree toggle<cr>]] },
    { "<leader>y", [[<cmd>:Neotree toggle reveal<cr>]] },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  config = function()
    require("neo-tree").setup({
      close_if_last_window = true,
      window = {
        position = "left",
        width = 40,
      },
      event_handlers = {
        {
          event = "file_open_requested",
          handler = function()
            -- auto close
            -- vim.cmd("Neotree close")
            -- OR
            require("neo-tree.command").execute({ action = "close" })
          end
        },
      },
      default_component_configs = {
        indent = {
          with_expanders = true,
          expander_collapsed = "",
          expander_expanded = "",
          expander_highlight = "NeoTreeExpander",
        },
      },
    })
  end
}
