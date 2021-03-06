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
" let my_wiki = {}
" let my_wiki.path_html        = '$HOME/Documents/vimwiki-html/'
" let my_wiki.path             = '$HOME/Documents/.vimwiki/'
" let my_wiki.template_path    = '$HOME/Documents/.vimwiki/html-template/'
" let my_wiki.template_default = 'default'
" let my_wiki.template_ext     = '.tpl'
" let my_wiki.nested_syntaxes = { 'js': 'javascript', 'yml': 'yaml', 'yaml': 'yaml', 'bash': 'sh', 'json': 'json', 'rb': 'ruby', 'ruby': 'ruby', 'go': 'go' }

" let g:vimwiki_list = [ my_wiki ]
" let g:vimwiki_dir_link = 'index'    " Open /index instead of directory listing.
" let g:vimwiki_folding = 'expr'      " Enable folding.

let g:vimwiki_list = [{
  \ 'path': '$HOME/Documents/.vimwiki/',
  \ 'template_path': '$HOME/Documents/.vimwiki/html-template/',
  \ 'template_default': 'default',
  \ 'syntax': 'markdown',
  \ 'ext': '.md',
  \ 'path_html': '$HOME/Documents/vimwiki-html/',
  \ 'custom_wiki2html': 'vimwiki_markdown',
  \ 'nested_syntaxes': { 'js': 'javascript', 'yml': 'yaml', 'yaml': 'yaml', 'bash': 'sh', 'json': 'json', 'rb': 'ruby', 'ruby': 'ruby', 'go': 'go' },
  \ 'template_ext': '.tpl'
  \ }]
let g:vimwiki_dir_link = 'index'    " Open /index instead of directory listing.
let g:vimwiki_folding = 'expr'      " Enable folding.


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

" Toggle go code coverage
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)

autocmd FileType go nmap <Leader>a :GoAlternate<CR>

" }}}

" vim-coc {{{
let g:coc_global_extensions = [
  \'coc-fzf-preview',
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
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? coc#_select_confirm() :
"       \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
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


" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>

" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>

" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>

" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>

" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>

" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>

" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>

" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" Remap for rename current word
" nmap <leader>nr <Plug>(coc-rename)
nmap <space>rn <Plug>(coc-rename)

" Use `:Format` for format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` for fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" }}}

" Floating terminal {{{
let g:floaterm_width = 0.8
let g:floaterm_height = 0.7
let g:floaterm_winblend = 0

noremap  <C-q>  :FloatermToggle<CR>
noremap! <C-q>  <Esc>:FloatermToggle<CR>
tnoremap <C-q>  <C-\><C-n>:FloatermToggle<CR>
" }}}


" tagbar
let g:tagbar_autofocus = 1    " focus tagbar when opening
let g:tagbar_width = 60       " set the width to 60 columns (default: 40)

" mergetool
let g:mergetool_layout = 'mr'
let g:mergetool_prefer_revision = 'local'


" vim:fdm=marker
