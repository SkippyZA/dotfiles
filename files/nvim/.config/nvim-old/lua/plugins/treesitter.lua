local config = function()
  local opts = {
    ensure_installed = {
      "angular",
      "awk",
      "bash",
      "c",
      "cpp",
      "css",
      "csv",
      "dockerfile",
      "fish",
      "git_config",
      "git_rebase",
      "gitattributes",
      "gitcommit",
      "gitignore",
      "go",
      "helm",
      "html",
      "http",
      "javascript",
      "jq",
      "json",
      "jsonnet",
      "jsonc",
      "lua",
      "luap",
      "make",
      "markdown",
      "markdown_inline",
      "norg",
      "python",
      "query",
      "regex",
      "ruby",
      "scheme",
      "scss",
      "sql",
      "toml",
      "typescript",
      "terraform",
      "vim",
      "vimdoc",
      "vue",
      "yaml",
    },
    highlight = {
      enable = true,
      -- disable = { "norg" }
    },
    matchup = {
      enable = true,
    },
    {
      context_commentstring = {
        enable = true,
        enable_autocmd = true,
      },
    },
    textobjects = {
      lsp_interop = {
        enable = true,
        border = "rounded",
        floating_preview_opts = {},
        -- peek_definition_code = {
        -- 	["<leader>df"] = "@function.outer",
        -- 	["<leader>dF"] = "@class.outer",
        -- },
      },
      move = {
        enable = true,
        set_jumps = true,
        goto_next_start = {
          ["]f"] = "@function.inner",
          ["]e"] = "@function.outer",
          ["]b"] = "@parameter.outer",
          ["]d"] = "@block.inner",
          ["]a"] = "@attribute.inner",
          ["]m"] = "@this_method_call",
          ["]s"] = { query = "@scope", query_group = "locals" },
          --  TODO: 2024-01-08 - this is not working in typescript files
          ["]c"] = "@method_object_call",
          ["]o"] = "@object_declaration",
          ["]k"] = "@object_key",
          ["]v"] = "@object_value",
          ["]w"] = "@method_parameter",
        },
        goto_next_end = {
          ["]F"] = "@function.inner",
          ["]E"] = "@function.outer",
          ["]B"] = "@parameter.outer",
          ["]D"] = "@block.inner",
          ["]A"] = "@attribute.inner",
          ["]M"] = "@this_method_call",
          ["]S"] = { query = "@scope", query_group = "locals" },
          ["]C"] = "@method_object_call",
          ["]O"] = "@object_declaration",
          ["]K"] = "@object_key",
          ["]V"] = "@object_value",
          ["]W"] = "@method_parameter",
        },
        goto_previous_start = {
          ["[f"] = "@function.inner",
          ["[e"] = "@function.outer",
          ["[b"] = "@parameter.outer",
          ["[d"] = "@block.inner",
          ["[a"] = "@attribute.inner",
          ["[m"] = "@this_method_call",
          ["[s"] = { query = "@scope", query_group = "locals" },
          ["[c"] = "@method_object_call",
          ["[o"] = "@object_declaration",
          ["[k"] = "@object_key",
          ["[v"] = "@object_value",
          ["[w"] = "@method_parameter",
        },
        goto_previous_end = {
          ["[F"] = "@function.inner",
          ["[E"] = "@function.outer",
          ["[B"] = "@parameter.outer",
          ["[D"] = "@block.inner",
          ["[A"] = "@attribute.inner",
          ["[M"] = "@this_method_call",
          ["[S"] = { query = "@scope", query_group = "locals" },
          ["[C"] = "@method_object_call",
          ["[O"] = "@object_declaration",
          ["[K"] = "@object_key",
          ["[V"] = "@object_value",
          ["[W"] = "@method_parameter",
        },
      },
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@call.outer",
          ["ic"] = "@call.inner",
          ["aC"] = "@class.outer",
          ["iC"] = "@class.inner",
          ["ib"] = "@parameter.inner",
          ["ab"] = "@parameter.outer",
          ["iB"] = "@block.inner",
          ["aB"] = "@block.outer",
          ["id"] = "@block.inner",
          ["ad"] = "@block.outer",
          ["il"] = "@loop.inner",
          ["al"] = "@loop.outer",
          ["ia"] = "@attribute.inner",
          ["aa"] = "@attribute.outer",
        },
      },
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        node_incremental = "v",
        node_decremental = "V",
        init_selection = "<C-y>",
        -- scope_incremental = "<C-v>",
      },
    },
  }

  require("nvim-treesitter.configs").setup(opts)

  vim.treesitter.language.register("markdown", "octo")

  local ts_repeat_move = require("nvim-treesitter.textobjects.repeatable_move")
  -- k({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next)
  -- k({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous)
end

return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "JoosepAlviste/nvim-ts-context-commentstring",
      "CKolkey/ts-node-action",
      "nvim-treesitter/nvim-treesitter-context",
      {
        "bennypowers/template-literal-comments.nvim",
        opts = true,
        ft = {
          "javascript",
          "typescript",
        },
        enabled = true,
      },
    },
    config = config,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    config = true,
    event = "BufReadPre",
  }
}
