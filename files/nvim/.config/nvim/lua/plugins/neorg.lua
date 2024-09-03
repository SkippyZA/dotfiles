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
                notes = "/Users/s.inskip/Library/Mobile Documents/com~apple~CloudDocs/neorg/notes",
                make = "/Users/s.inskip/Library/Mobile Documents/com~apple~CloudDocs/neorg/make",
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
