return {
  {
    "nvim-neorg/neorg",
    version = "*",
    lazy = false,
    keys = {
      {"<leader>ww", ":Neorg workspace notes<cr>"},
      {"<leader>wwq", ":Neorg return<cr>"},
    },
    dependencies = {
      "nvim-neorg/neorg-telescope"
    },
    config = function()
      require("neorg").setup {
        load = {
          ["core.defaults"] = {}, -- Load all the default modules
          ["core.qol.toc"] = {},
          ["core.concealer"] = {},
          ["core.dirman"] = {
            config = {
              workspaces = {
                notes = vim.fn.expand("$HOME/Library/Mobile Documents/com~apple~CloudDocs/neorg/notes"),
                make = vim.fn.expand("$HOME/Library/Mobile Documents/com~apple~CloudDocs/neorg/make"),
              },
              default_workspace = "notes",
            },
          },
          ["core.ui"] = {},
          ["core.export"] = {},
          ["core.export.markdown"] = {
            extensions = { "all" }
          },
          ["core.summary"] = {},
          ["core.integrations.treesitter"] = {},
          ["core.integrations.telescope"] = {
            config = {
              insert_file_link = {
                -- Whether to show the title preview in telescope. Affects performance with a large
                -- number of files.
                show_title_preview = true,
              },
            }
          }
        },
      }

      vim.wo.foldlevel = 99
      vim.wo.conceallevel = 2
    end
  }
}
