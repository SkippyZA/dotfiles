return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    version = false, -- last release is way too old and doesn't work on Windows
    build = function()
      local TS = require("nvim-treesitter")
      if not TS.get_installed then
        MyVim.error("Please restart Neovim and run `:TSUpdate` to use the `nvim-treesitter` **main** branch.")
        return
      end
      MyVim.treesitter.ensure_treesitter_cli(function()
        TS.update(nil, { summary = true })
      end)
    end,
    lazy = vim.fn.argc(-1) == 0, -- load treesitter early when opening a file from the cmdline
    event = { "LazyFile", "VeryLazy" },
    cmd = { "TSUpdate", "TSInstall", "TSLog", "TSUninstall" },
    opts_extend = { "ensure_installed" },
    opts = {
      indent = { enable = true },
      highlight = { enable = true },
      folds = { enable = true },
      ensure_installed = {
        "bash",
        "c",
        "diff",
        "dockerfile",
        "git_config",
        "git_rebase",
        "gitattributes",
        "gitcommit",
        "gitignore",
        "go",
        "gomod",
        "gosum",
        "gowork",
        "helm",
        "html",
        "javascript",
        "jsdoc",
        "json",
        "jsonnet",
        "kcl",
        "lua",
        "luadoc",
        "luap",
        "markdown",
        "markdown_inline",
        -- "norg",
        "printf",
        "python",
        "query",
        "regex",
        "sql",
        "starlark",
        "terraform",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "xml",
        "yaml",
      },
    },
    config = function(_, opts)
      local TS = require("nvim-treesitter")
      --
      -- some quick sanity checks
      if not TS.get_installed then
        return MyVim.error("Please use `:Lazy` and update `nvim-treesitter`")
      elseif type(opts.ensure_installed) ~= "table" then
        return MyVim.error("`nvim-treesitter` opts.ensure_installed must be a table")
      end

      -- setup treesitter
      TS.setup(opts)

      -- install missing parsers
      local install = vim.tbl_filter(function(lang)
        return not MyVim.treesitter.have(lang)
      end, opts.ensure_installed or {})

      if #install > 0 then
        MyVim.treesitter.ensure_treesitter_cli(function()
          TS.install(install, { summary = false }):await(function()
            MyVim.treesitter.get_installed(true) -- refresh the installed langs
          end)
        end)
      end

      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("lazyvim_treesitter", { clear = true }),
        callback = function(ev)
          if not MyVim.treesitter.have(ev.match) then
            return
          end

          -- highlighting
          if vim.tbl_get(opts, "highlight", "enable") ~= false then
            pcall(vim.treesitter.start)
          end

          -- -- indents
          -- if vim.tbl_get(opts, "indent", "enable") ~= false and LazyVim.treesitter.have(ev.match, "indents") then
          --   LazyVim.set_default("indentexpr", "v:lua.LazyVim.treesitter.indentexpr()")
          -- end
          --
          -- -- folds
          -- if vim.tbl_get(opts, "folds", "enable") ~= false and LazyVim.treesitter.have(ev.match, "folds") then
          --   if LazyVim.set_default("foldmethod", "expr") then
          --     LazyVim.set_default("foldexpr", "v:lua.LazyVim.treesitter.foldexpr()")
          --   end
          -- end
        end,
      })
    end

    -- ---@param opts TSConfig
    -- config = function(_, opts)
    --   -- if type(opts.ensure_installed) == "table" then
    --   --   opts.ensure_installed = LazyVim.dedup(opts.ensure_installed)
    --   -- end
    --   require("nvim-treesitter.configs").setup(opts)
    -- end,
  },

  {
    "nvim-treesitter/nvim-treesitter-context",
    -- event = "LazyFile",
    opts = function()
      local tsc = require("treesitter-context")
      Snacks.toggle({
        name = "Treesitter Context",
        get = tsc.enabled,
        set = function(state)
          if state then
            tsc.enable()
          else
            tsc.disable()
          end
        end,
      }):map("<leader>ut")
      return { mode = "cursor", max_lines = 3 }
    end,
  },

  -- Automatically add closing tags for HTML and JSX
  {
    "windwp/nvim-ts-autotag",
    event = "LazyFile",
    opts = {},
  },
}
