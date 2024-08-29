function check_back_space()
  local col = vim.fn.col('.') - 1
  if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
    return true
  else
    return false
  end
end

return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/nvim-cmp",
    {
      "L3MON4D3/LuaSnip",
      dependencies = {
        "rafamadriz/friendly-snippets",
        "saadparwaiz1/cmp_luasnip",
      },
    },
  },
  config = function()
    local cmp = require('cmp')
    local luasnip = require("luasnip")

    luasnip.config.set_config({
      history = false,
      updateevents = "TextChanged,TextChangedI",
    })

    luasnip.snippets = {
      html = {}
    }

    luasnip.filetype_extend("javascriptreact", { "html" })
    luasnip.filetype_extend("typescriptreact", { "html" })
    luasnip.snippets.javascript = luasnip.snippets.html
    luasnip.snippets.javascriptreact = luasnip.snippets.html
    luasnip.snippets.typescriptreact = luasnip.snippets.html

    require("luasnip.loaders.from_vscode").load({include = {"html"}})
    require("luasnip.loaders.from_vscode").lazy_load()

    function select_next_fn (fallback)
      if cmp.visible() then
        cmp.select_next_item(select_opts)
      elseif check_back_space() then
        fallback()
      else
        cmp.complete()
      end
    end

    function select_prev_fn(fallback)
      if cmp.visible() then
        cmp.select_prev_item(select_opts)
      else
        fallback()
      end
    end

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },

      mapping = {
        ['<Tab>'] = cmp.mapping(select_next_fn, {'i', 's'}),
        ['<Down>'] = cmp.mapping(select_next_fn, {'i', 's'}),

        ['<S-Tab>'] = cmp.mapping(select_prev_fn, {'i', 's'}),
        ['<Up>'] = cmp.mapping(select_prev_fn, {'i', 's'}),

        ['<CR>'] = cmp.mapping.confirm({ select = true }),
      },

      -- Order of sources determines order of sourcing
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "treesitter" },
        { name = "buffer" },
        { name = "luasnip" },
        { name = "nvim_lua" },
        { name = "path" },
      }),
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
    })
  end
}
