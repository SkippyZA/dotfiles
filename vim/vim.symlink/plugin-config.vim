" airline options
let g:airline_powerline_fonts = 1
let g:airline_left_sep  =''
let g:airline_right_sep  =''
let g:airline_theme  ='gruvbox'
let g:airline#extensions#ale#enabled = 1            " display ale errors in airline
let g:airline#extensions#tabline#enabled = 1        " enable airline tabline
let g:airline#extensions#tabline#tab_min_count = 2  " only show tabline if tabs are being used (more than 1 tab open)
let g:airline#extensions#tabline#show_buffers = 0   " do not show open buffers in tabline
let g:airline#extensions#tabline#show_splits = 0

" vim-test
let g:test#strategy = {
      \ 'nearest': 'neovim',
      \ 'file': 'neovim',
      \ 'suite': 'basic'
      \}

" code coverage
let g:coverage_json_report_path = 'coverage/coverage-final.json'
let g:coverage_interval = 5000

" delimitMate
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1
let g:delimitMate_matchpairs = "(:),[:],{:}"

" javascript libraries syntax.vim
let g:used_javascript_libs = 'ramda'

" NERDTree
let g:NERDTreeWinSize = 40
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeAutoDeleteBuffer = 1

" vim-wiki
let my_wiki = {}
let my_wiki.path = '~/Library/Mobile Documents/com~apple~CloudDocs/.terminal-stuff/vimwiki/'
let my_wiki.html_template = '~/Library/Mobile Documents/com~apple~CloudDocs/.terminal-stuff/vimwiki-html/'
let my_wiki.nested_syntaxes = { 'js': 'javascript' }
let g:vimwiki_list = [ my_wiki ]

" Ultisnips
let g:UltiSnipsExpandTrigger = "<c-j>"
let g:UltiSnipsSnippetsDir = '~/.vim/UltiSnips'

" Golden Ratio
let g:golden_ratio_autocommand = 0

" vim rest console
let g:vrc_trigger = ',rr'         " keybind to execute request
let g:vrc_curl_opts = {
  \ '--connect-timeout' : 10,
  \ '--location': '',
  \ '--include': '',
  \ '--silent': '',
  \ '--show-error': '',
  \ '--insecure': '',
\}                                " default curl options

" vim-coc
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:coc_global_extensions = [
  \'coc-angular',
  \'coc-css',
  \'coc-java',
  \'coc-json',
  \'coc-solargraph',
  \'coc-tslint-plugin',
  \'coc-tsserver',
  \'coc-ultisnips',
  \'coc-vetur',
  \'coc-yaml',
  \'coc-yank'
  \]

" display yank list
nnoremap <silent> <space>y  :<C-u>CocList --normal yank<cr>

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> for confirm completion.
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` for navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" tagbar
let g:tagbar_autofocus = 1    " focus tagbar when opening

" Use `:Format` for format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` for fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
