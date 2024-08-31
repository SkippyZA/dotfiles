lua require('dap-go').setup()

lua require("nvim-dap-virtual-text").setup({
  \ commented = true,
  \ })

lua require("dapui").setup()

nmap <F9> :lua require'dap'.continue()<CR>
nmap <F10> :lua require'dap'.step_over()<CR>
nmap <F11> :lua require'dap'.step_into()<CR>
nmap <F12> :lua require'dap'.step_out()<CR>

nmap <silent> <C-b> :lua require'dap'.toggle_breakpoint()<CR>
nmap <silent> <leader>dr :lua require'dap'.repl.open()<CR>


