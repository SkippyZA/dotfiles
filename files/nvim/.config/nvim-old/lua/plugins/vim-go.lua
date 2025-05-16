local generalSettingsGroup = vim.api.nvim_create_augroup('General settings', { clear = true })

function build_go_files()
  local file = vim.fn.expand('%')
  if string.match(file, "_test.go$") then
    vim.cmd([[ GoTestFile ]])
  elseif string.match(file, ".go$") then
    vim.cmd([[ GoBuild ]])
  end
end


return {
  "fatih/vim-go",
  ft = "go",
  setup = function()
    vim.cmd("GoInstallBinaries()")
  end,
  config = function()
    vim.keymap.set('n', '<leader>a', [[ <cmd>GoAlternate<cr> ]], { desc = "Switch between source and test files" })
    vim.keymap.set('n', '<leader>b', [[ :lua build_go_files()<cr> ]], { desc = "Build or test golang file based on filename" })

    vim.g.go_def_mode='gopls'
    vim.g.go_info_mode='gopls'

    vim.g.go_def_mapping_enabled = 0   -- disable vim-go :GoDef short cut (gd), this is instead handled by LanguageClient [LC]
    vim.g.go_fmt_command = "goimports" -- use goimports instead of gofmt when saving
  end
}
