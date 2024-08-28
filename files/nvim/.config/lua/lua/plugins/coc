-- Use K to show documentation in preview window
function _G.show_docs()
    local cw = vim.fn.expand('<cword>')
    if vim.fn.index({'vim', 'help'}, vim.bo.filetype) >= 0 then
        vim.api.nvim_command('h ' .. cw)
    elseif vim.api.nvim_eval('coc#rpc#ready()') then
        vim.fn.CocActionAsync('doHover')
    else
        vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
    end
end

function _G.check_back_space()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

return {
  "neoclide/coc.nvim",
  lazy = false,
  keys = {
    -- Use Tab for trigger completion with characters ahead and navigate
    -- NOTE: There's always a completion item selected by default, you may want to enable
    -- no select by setting `"suggest.noselect": true` in your configuration file
    -- NOTE: Use command ':verbose imap <tab>' to make sure Tab is not mapped by
    -- other plugins before putting this into your config
    {"i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', {silent = true, noremap = true, expr = true, replace_keycodes = false}},
    {"i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], {silent = true, noremap = true, expr = true, replace_keycodes = false}},

    -- Make <CR> to accept selected completion item or notify coc.nvim to format
    -- <C-g>u breaks current undo, please make your own choice
    {"i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], {silent = true, noremap = true, expr = true, replace_keycodes = false}},

    -- Use <c-j> to trigger snippets
    {"i", "<c-j>", "<Plug>(coc-snippets-expand-jump)"},
    -- Use <c-space> to trigger completion
    {"i", "<c-space>", "coc#refresh()", {silent = true, expr = true}},

    -- GoTo code navigation
    {"n", "gd", "<Plug>(coc-definition)", {silent = true}},
    {"n", "gy", "<Plug>(coc-type-definition)", {silent = true}},
    {"n", "gi", "<Plug>(coc-implementation)", {silent = true}},
    {"n", "gr", "<Plug>(coc-references)", {silent = true}},

    -- Show documentation
    {"n", "K", '<CMD>lua _G.show_docs()<CR>', {silent = true}},
  },
  config = function()
    vim.g.coc_global_extensions = { 'coc-json', 'coc-go', 'coc-yaml' }
  end
}
