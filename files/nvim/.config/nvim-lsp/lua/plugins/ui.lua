return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      statuscolumn = { enabled = true },
      profiler = { enabled = true },
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    init = function()
      vim.g.lualine_laststatus = vim.o.laststatus
      if vim.fn.argc(-1) > 0 then
        -- set an empty statusline till lualine loads
        vim.o.statusline = " "
      else
        -- hide the statusline on the starter page
        vim.o.laststatus = 0
      end
    end,
    opts = function()
      -- PERF: we don't need this lualine require madness 🤷
      local lualine_require = require("lualine_require")
      lualine_require.require = require

      local icons = MyVim.config.icons

      vim.o.laststatus = vim.g.lualine_laststatus

      local opts = {
        options = {
          theme = "auto",
          globalstatus = vim.o.laststatus == 3,
          disabled_filetypes = { statusline = { "dashboard", "alpha", "ministarter", "snacks_dashboard", "neotree" } },
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = {
            { 'branch' },
            {
              'diff' ,
              symbols = {
                added = icons.git.added,
                modified = icons.git.modified,
                removed = icons.git.removed,
              },
            }
          },
          lualine_c = {
            {
              "diagnostics",
              symbols = {
                error = icons.diagnostics.Error,
                warn = icons.diagnostics.Warn,
                info = icons.diagnostics.Info,
                hint = icons.diagnostics.Hint,
              },
            },
            'filename',
          },

          lualine_x = {
            'filetype',
            {
              'lsp_status',
              icon = '', -- f013
              symbols = {
                -- Standard unicode symbols to cycle through for LSP progress:
                spinner = { '⠋', '⠙', '⠹', '⠸', '⠼', '⠴', '⠦', '⠧', '⠇', '⠏' },
                -- Standard unicode symbol for when LSP is done:
                done = '✓',
                -- Delimiter inserted between LSP names:
                separator = ' ',
              },
              -- List of LSP names to ignore (e.g., `null-ls`):
              ignore_lsp = {},
            },
            {
              function() return "  " .. require("dap").status() end,
              cond = function() return package.loaded["dap"] and require("dap").status() ~= "" end,
              color = function() return { fg = Snacks.util.color("Debug") } end,
            },
          },
          lualine_y = {
            { "progress" },
          },
          lualine_z = {
            { "location" },
          },
        },
        -- extensions = { "neo-tree", "lazy", "fzf" },
      }

      -- -- do not add trouble symbols if aerial is enabled
      -- -- And allow it to be overriden for some buffer types (see autocmds)
      -- if vim.g.trouble_lualine and LazyVim.has("trouble.nvim") then
      --   local trouble = require("trouble")
      --   local symbols = trouble.statusline({
      --     mode = "symbols",
      --     groups = {},
      --     title = false,
      --     filter = { range = true },
      --     format = "{kind_icon}{symbol.name:Normal}",
      --     hl_group = "lualine_c_normal",
      --   })
      --   table.insert(opts.sections.lualine_c, {
      --     symbols and symbols.get,
      --     cond = function()
      --       return vim.b.trouble_lualine ~= false and symbols.has()
      --     end,
      --   })
      -- end

      return opts
    end,
  }
}
