local api = vim.api
local home = vim.env.HOME

-- Key remapping
local keyset = vim.keymap.set

_G.MUtils = {}

-- Use K to show documentation in preview window
function MUtils.show_docs()
  local cw = vim.fn.expand('<cword>')
  if vim.fn.index({'vim', 'help'}, vim.bo.filetype) >= 0 then
    vim.api.nvim_command('h ' .. cw)
  elseif vim.api.nvim_eval('coc#rpc#ready()') then
    vim.fn.CocActionAsync('doHover')
  else
    vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
  end
end

-- function MUtils.check_back_space()
--   local col = vim.fn.col('.') - 1
--   return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
-- end

function MUtils.check_back_space()
  local col = api.nvim_win_get_cursor(0)[2]
  local has_backspace =
  api.nvim_get_current_line():sub(col, col):match("%s") ~= nil
  return col == 0 or has_backspace
end

function MUtils.diagnostic()
  vim.fn.CocActionAsync("diagnosticList", "", function(err, res)
    if err == vim.NIL then
      if vim.tbl_isempty(res) then return end
      local items = {}
      for _, d in ipairs(res) do
        local text = ""
        local type = d.severity
        local msg = d.message:match("([^\n]+)\n*")
        local code = d.code
        if code == vim.NIL or code == nil or code == "NIL" then
          text = ("[%s] %s"):format(type, msg)
        else
          text = ("[%s|%s] %s"):format(type, code, msg)
        end

        local item = {
          filename = d.file,
          lnum = d.lnum,
          end_lnum = d.end_lnum,
          col = d.col,
          end_col = d.end_col,
          text = text
        }
        table.insert(items, item)
      end
      vim.fn.setqflist({}, " ",
      {title = "CocDiagnosticList", items = items})
      vim.cmd("bo cope")
    end
  end)
end


function MUtils.tab_complete()
  if vim.fn["coc#pum#visible"]() ~= 0 then
    return vim.fn["coc#pum#next"](1)
  else
    if MUtils.check_back_space() then
      local key = api.nvim_replace_termcodes("<tab>", true, true, true)
      api.nvim_feedkeys(key, "n", false)
    else
      return vim.fn["coc#refresh"]()
    end
  end
end

function MUtils.back_tab_complete()
  if vim.fn["coc#pum#visible"]() ~= 0 then
    return vim.fn["coc#pum#prev"](1)
  else
    local key = api.nvim_replace_termcodes("<C-h>", true, true, true)
    api.nvim_feedkeys(key, "n", false)
  end
end

function MUtils.enter()
  if vim.fn["coc#pum#visible"]() ~= 0 then
    return vim.fn["coc#_select_confirm"]()
  else
    local key = api.nvim_replace_termcodes("<C-g>u<CR>", true, true, true)
    api.nvim_feedkeys(key, "n", false)
    return vim.fn["coc#on_enter"]()
  end
end

function MUtils.help()
  local cw = vim.fn.expand("<cword>")
  if vim.fn.index({"vim", "help"}, vim.bo.filetype) >= 0 then
    api.nvim_command("h " .. cw)
  elseif api.nvim_eval("coc#rpc#ready()") then
    vim.fn.CocActionAsync("doHover")
  else
    api.nvim_command(string.format("!%s %s", vim.o.keywordprg, cw))
  end
end



return {
  {
    "neovim/nvim-lspconfig",
    config = function()
    end
  },
  {
    "neoclide/coc.nvim",
    lazy = false,
    build = "npm ci",
    config = function()
      vim.g.coc_global_extensions = { 'coc-json', 'coc-go', 'coc-yaml', 'coc-sh', 'coc-markdownlint', 'coc-snippets', 'coc-tsserver', 'coc-tslint-plugin', 'coc-swagger' }

      vim.cmd("au FileType yaml if bufname(\"%\") =~# \"docker-compose.yml\" | set ft=yaml.docker-compose | endif")
      vim.cmd("au FileType yaml if bufname(\"%\") =~# \"compose.yml\" | set ft=yaml.docker-compose | endif")
      vim.cmd("let g:coc_filetype_map = { 'yaml.docker-compose': 'dockercompose' }")

      -- auto complete
      local opts = {silent = true, noremap = true, expr = true}
      keyset("i", "<Tab>", _G.MUtils.tab_complete, opts)
      keyset("i", "<S-Tab>", _G.MUtils.back_tab_complete, opts)
      keyset("i", "<CR>", _G.MUtils.enter, opts)
      keyset("i", "<c-j>", "<Plug>(coc-snippets-expand-jump)")
      keyset("i", "<c-space>", "coc#refresh()", {silent = true, expr = true})

      -- scroll through documentation
      opts = {silent = true, nowait = true, expr = true}
      keyset("n", "<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', opts)
      keyset("n", "<C-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', opts)
      keyset("i", "<C-f>", 'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(1)<cr>" : "<Right>"', opts)
      keyset("i", "<C-b>", 'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(0)<cr>" : "<Left>"', opts)
      keyset("v", "<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', opts)
      keyset("v", "<C-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', opts)

      -- go to definition and other things
      keyset("n", "<c-k>", "<Plug>(coc-rename)", {silent = true})
      keyset("n", "[g", "<Plug>(coc-diagnostic-prev)", {silent = true})
      keyset("n", "]g", "<Plug>(coc-diagnostic-next)", {silent = true})
      keyset("n", "gd", "<Plug>(coc-definition)", {silent = true})
      keyset("n", "gy", "<Plug>(coc-type-definition)", {silent = true})
      keyset("n", "gi", "<Plug>(coc-implementation)", {silent = true})
      keyset("n", "gr", "<Plug>(coc-references)", {silent = true})

      -- code actions and coc stuff
      opts = {silent = true, nowait = true}
      keyset("n", "<space>a", "<Plug>(coc-codeaction-cursor)", opts)
      keyset("n", "<space>s", "<Plug>(coc-codeaction-refactor)", opts)
      keyset("n", "<space>x", "<Plug>(coc-codeaction-line)", opts)
      keyset("n", "<space>g", "<Plug>(coc-codelens-action)", opts)
      keyset("n", "<space>f", "<Plug>(coc-fix-current)", opts)
      keyset({'n', 'x'}, "<space>z", "<Plug>(coc-codeaction-selected", opts)
      keyset({'n', 'x'}, "<space>r", "<Plug>(coc-codeaction-refactor-selected", opts)
      keyset("n", "<space>e", ":<C-u>CocList extensions<cr>", opts)
      keyset("n", "<space>c", ":<C-u>CocList commands<cr>", opts)
      keyset("n", "<space>o", ":<C-u>CocList outline<cr>", opts)
      keyset("n", "<space>q", ":<C-u>CocList<cr>", opts)
      keyset("n", "<space>d", _G.MUtils.diagnostic, opts)
      keyset("n", "K", _G.MUtils.help, {silent = true})

    end
  }
}
