-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Set up both the traditional leader (for keymaps) as well as the local leader (for norg files)
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- {
    --   "rebelot/kanagawa.nvim", -- neorg needs a colorscheme with treesitter support
    --   config = function()
    --       vim.cmd.colorscheme("kanagawa")
    --   end,
    -- },
    {
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
    },
    {
      'sainnhe/gruvbox-material',
      lazy = false,
      priority = 1000,
      config = function()
        -- Optionally configure and load the colorscheme
        -- directly inside the plugin declaration.
        vim.g.gruvbox_material_enable_italic = true
        vim.g.gruvbox_material_enable_bold = true
        vim.g.gruvbox_material_background = 'hard'                 -- 'hard', 'medium', 'soft'
        vim.g.gruvbox_material_foreground = 'original'             -- 'material', 'mix', 'original'
        vim.g.gruvbox_material_ui_contrast = 'high'                -- 'low', 'high'
        vim.g.gruvbox_material_sign_column_background = 'grey'     -- 'grey', 'none'

        vim.g.gruvbox_material_statusline_style = 'original'

        vim.g.gruvbox_material_better_performance = 1

        vim.cmd.colorscheme('gruvbox-material')
      end
    },
    {
      'nvim-telescope/telescope.nvim',
      dependencies = { 'nvim-lua/plenary.nvim' },
      config = function()
        local default_opts = { noremap = true }
        local builtin = require("telescope.builtin")
        vim.keymap.set('n', '<C-p>', builtin.find_files, {})
        vim.keymap.set('n', '<C-P>', "<cmd>lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<cr>", default_opts)
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
        vim.keymap.set('n', '<leader>fb', "<cmd>lua require'telescope.builtin'.buffers({ show_all_buffers = true })<cr>", default_opts)
        -- vim.keymap.set('n', '<leader>fg', "<cmd>lua require'telescope.builtin'.git_status()<cr>", default_opts)
      end
    },
    {
      "nvim-treesitter/nvim-treesitter",
      version = "0.9.3",  -- the last supported version
      build = ":TSUpdate",
      dependencies = {
        "nvim-neorg/neorg-telescope"
      },
      opts = {
        ensure_installed = { "bash", "c", "dockerfile", "go", "gomod", "gosum", "gowork", "helm", "lua", "regex", "sql", "terraform", "typescript", "vim", "vimdoc", "query", "norg", "xml", "yaml" },
        highlight = { enable = true },
      },
      config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)
      end,
    },
    {
      "nvim-neorg/neorg",
      lazy = false,
      version = "*",
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

            -- ["core.defaults"] = {},
            -- ["core.concealer"] = {},
            -- ["core.dirman"] = {
            --   config = {
            --     workspaces = {
            --       notes = "~/notes",
            --     },
            --     default_workspace = "notes",
            --   },
            -- },
          },
        }
  
        vim.wo.foldlevel = 99
        vim.wo.conceallevel = 2
      end,
    },
  },
})
