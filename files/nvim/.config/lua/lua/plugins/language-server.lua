-- require"lspconfig".gopls.setup{}

local function get_setup(conf_name)
  return function(_plugin, _opts)
    local mod = string.format("plug_conf.%s", conf_name)
    require(mod)
  end
end

return {
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = {
      { "williamboman/mason.nvim" },
      { "williamboman/mason-lspconfig.nvim" },
      { "ray-x/lsp_signature.nvim" },
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup()

      local lspconfig = require("lspconfig")
      --
      -- lspconfig["bashls"].setup({})
      -- lspconfig["cssls"].setup({})
      -- lspconfig["docker_compose_language_service"].setup({})
      -- lspconfig["dockerls"].setup({})
      -- lspconfig["html"].setup({})
      -- lspconfig["lemminx"].setup({})
      -- lspconfig["lua_ls"].setup({})
      -- lspconfig["marksman"].setup({})
      -- lspconfig["pyright"].setup({})
      -- lspconfig["tsserver"].setup({})
      -- lspconfig["yamlls"].setup({})
      --
      lspconfig["gopls"].setup({
        settings = {
          gopls = {
            env = {
                GOFLAGS = "-tags=windows,linux,unittest,integration,unit"
            }
          }
        }
      })
      --
      -- lspconfig["sqlls"].setup({
      --   root_dir = function(fname)
      --     return lspconfig.util.find_git_ancestor(fname) or vim.fn.getcwd()
      --   end,
      -- })
      --
      -- lsp_signature UI tweaks
      require("lsp_signature").setup({
        bind = true,
        handler_opts = {
          border = "rounded",
        },
      })

      -- LSP hover window UI tweaks
      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
        vim.lsp.handlers.hover, {
          border = "single"
        }
      )

      -- LSP diagnostics
      vim.diagnostic.config {
          float = { border = "single" },
          underline = true,
          virtual_text = false,
          virtual_lines = false
      }

      -- Key bindings to be set after LSP attaches to buffer
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          vim.api.nvim_buf_set_option(ev.buf, "omnifunc", "v:lua.vim.lsp.omnifunc")
          vim.api.nvim_buf_set_option(ev.buf, "formatexpr", "v:lua.vim.lsp.formatexpr()")

          local opts = { buffer = ev.buf }
          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
          vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
          vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

          vim.keymap.set("n", "gr", vim.lsp.buf.references, opts) -- SEE telescope.lua
        end,
      })
    end
  },
}
