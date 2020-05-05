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
let my_wiki.path_html        = '$HOME/Documents/vimwiki-html/'
let my_wiki.path             = '$HOME/Documents/.vimwiki/'
let my_wiki.template_path    = '$HOME/Documents/.vimwiki/html-template/'
let my_wiki.template_default = 'default'
let my_wiki.template_ext     = '.tpl'
let my_wiki.nested_syntaxes = { 'js': 'javascript', 'yml': 'yaml', 'yaml': 'yaml', 'bash': 'sh', 'json': 'json', 'rb': 'ruby', 'ruby': 'ruby', 'go': 'go' }

let g:vimwiki_list = [ my_wiki ]
let g:vimwiki_dir_link = 'index'    " Open /index instead of directory listing.
let g:vimwiki_folding = 'expr'      " Enable folding.
autocmd FileType vimwiki set spell  " Enable spelling.

" " Ultisnips
" let g:UltiSnipsExpandTrigger = "<c-j>"
" let g:UltiSnipsSnippetsDir = '~/.config/nvim/UltiSnips'

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

" Avro alias for syntax highlighting
autocmd BufRead,BufNewFile *.avsc set filetype=avdl

" vim-go {{{

let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

let g:go_def_mapping_enabled = 0   " disable vim-go :GoDef short cut (gd), this is instead handled by LanguageClient [LC]
let g:go_fmt_command = "goimports" " use goimports instead of gofmt when saving

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>

" }}}

" vim-coc {{{
let g:coc_global_extensions = [
  \'coc-json',
  \'coc-go',
  \'coc-tslint-plugin',
  \'coc-tsserver',
  \'coc-snippets',
  \'coc-yaml'
  \]

let g:coc_snippet_next = '<tab>'

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> for confirm completion.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if has('patch8.1.1068')
  " Use `complete_info` if your (Neo)Vim version supports it.
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif


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

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)



" tagbar
let g:tagbar_autofocus = 1    " focus tagbar when opening
let g:tagbar_width = 60       " set the width to 60 columns (default: 40)

" Use `:Format` for format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` for fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)


" vim:fdm=marker
