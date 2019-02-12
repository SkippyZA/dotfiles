" airline options
let g:airline_powerline_fonts=1
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_theme='tender'
let g:airline#extensions#ale#enabled = 1 " display ale errors in airline
let g:airline#extensions#tabline#enabled = 1 " enable airline tabline
let g:airline#extensions#tabline#tab_min_count = 2 " only show tabline if tabs are being used (more than 1 tab open)
let g:airline#extensions#tabline#show_buffers = 0 " do not show open buffers in tabline
let g:airline#extensions#tabline#show_splits = 0

" vim-test
let g:test#javascript#mocha#file_pattern = '\vtests?/.*\.(js|jsx|coffee|ts|tsx)$'
let g:test#strategy = "vimux" " run tests using vimux

" ale
let g:ale_linters = {
      \ 'javascript': ['standard'],
      \ 'typescript': ['tslint', 'tsserver'],
      \ 'go': []
      \}
let g:ale_sign_column_always = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 1 " disable linting when opening a file

" code coverage
let g:coverage_json_report_path = 'coverage/coverage-final.json'
let g:coverage_interval = 5000

" delimitMate
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1
let g:delimitMate_matchpairs = "(:),[:],{:}"

" typescript
let g:tsuquyomi_disable_quickfix = 1
let g:tsuquyomi_disable_default_mappings = 1
let g:tsuquyomi_completion_detail = 1

" tern for vim
let g:tern#command = ['tern']
let g:tern#arguments = ['--persistent']
let g:tern_request_timeout=1 " set timeout
let g:tern_show_signature_in_pum='1' " display function signature in the completion menu

" javascript libraries syntax.vim
let g:used_javascript_libs='ramda'

" nerdtree
let g:NERDTreeWinSize=40

" vim-wiki
let my_wiki = {}
let my_wiki.path = '~/Library/Mobile Documents/com~apple~CloudDocs/.terminal-stuff/vimwiki/'
let my_wiki.html_template = '~/Library/Mobile Documents/com~apple~CloudDocs/.terminal-stuff/vimwiki-html/'
let my_wiki.nested_syntaxes = { 'js': 'javascript' }
let g:vimwiki_list = [ my_wiki ]

" vim-taskwarrior
let g:task_rc_override = 'rc.defaultwidth=0'

" vue
autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css
autocmd FileType vue syntax sync fromstart

" Ultisnips
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsSnippetsDir='~/.vim/UltiSnips'

" Golden Ratio
let g:golden_ratio_autocommand = 0

" vim-coc
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

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

" Use `:Format` for format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` for fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)