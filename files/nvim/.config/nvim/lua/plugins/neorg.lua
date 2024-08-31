vim.wo.foldlevel = 99
vim.wo.conceallevel = 2

return {
  {
    "nvim-neorg/neorg",
    lazy = true,
    keys = {
      {"<leader>ww", ":Neorg workspace notes<cr>"},
      {"<leader>wwq", ":Neorg return<cr>"},
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
                notes = "/Users/skippy/Library/Mobile Documents/com~apple~CloudDocs/Documents/neorg/notes",
                make = "/Users/skippy/Library/Mobile Documents/com~apple~CloudDocs/Documents/neorg/make",
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
        },
      }
    end
  }
}
