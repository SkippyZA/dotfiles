return {
  {
    "nvim-neorg/neorg",
    lazy = false,
    config = function()
      require("neorg").setup {
        load = {
          ["core.defaults"] = {}, -- Load all the default modules
          ["core.qol.toc"] = {},
          ["core.concealer"] = {},
          ["core.dirman"] = {
            config = {
              workspaces = {
                notes = "~/notes",
                -- journal = "~/notes/"
              },
              default_workspace = "notes",
            },
          },
          ["core.ui"] = {},
          ["core.export"] = {},
          ["core.export.markdown"] = {
            -- extensions = { "todo-items-basic", "todo-items-pending", "todo-items-extended", "definition-lists", "mathematics", "metadata" }
            extensions = { "all" }
          },
          ["core.summary"] = {},
          ["core.integrations.treesitter"] = {},
          -- ["core.keybinds"] = {
          --   config = {
          --     hook = function(keybinds)
          --       keybinds.remap_key("norg", "n", "<CR>", "<leader>ll")
          --     end
          --   }
          -- },
        },
      }

      vim.keymap.set("n", "<leader>ww", ":Neorg workspace notes<cr>")
      vim.keymap.set("n", "<leader>wd", ":Neorg journal today<cr>")
      vim.keymap.set("n", "<leader>lc", ":Neorg keybind all core.looking-glass.magnify-code-block<cr>")
      vim.keymap.set("n", "<leader>lm", ":Neorg inject-metadata<cr>")

      vim.wo.foldlevel = 99
      vim.wo.conceallevel = 2
    end,
  }
}
