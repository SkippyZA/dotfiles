" airline options
let g:airline_powerline_fonts=1
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_theme='codedark'
let g:airline#extensions#ale#enabled = 1 " display ale errors in airline
let g:airline#extensions#tabline#enabled = 1 " enable airline tabline
let g:airline#extensions#tabline#tab_min_count = 2 " only show tabline if tabs are being used (more than 1 tab open)
let g:airline#extensions#tabline#show_buffers = 0 " do not show open buffers in tabline
let g:airline#extensions#tabline#show_splits = 0

" ale
let g:ale_linters = { 'javascript': ['standard'] }
let g:ale_sign_column_always = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 1 " disable linting when opening a file

" delimitMate
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1
let delimitMate_matchpairs = "(:),[:],{:}"

" fzf
let g:fzf_layout = { 'down': '~25%' }

" unit testing
let test#strategy = "vimux" " run tests using vimux

" code coverage
let g:coverage_json_report_path = 'coverage/coverage-final.json'
let g:coverage_interval = 5000

" vim json
let g:vim_json_syntax_conceal = 0

" tern for vim
let g:tern#command = ['tern']
let g:tern#arguments = ['--persistent']
let g:tern_request_timeout=1 " set timeout
let g:tern_show_argument_hints='on_hold' " display argument type hints when the cursor is left over a function
let g:tern_show_signature_in_pum='1' " display function signature in the completion menu

" javascript libraries syntax.vim
let g:used_javascript_libs='ramda'

" vim-javascript
let g:javascript_plugin_jsdoc = 1

" deoplete
set completeopt=longest,menuone,preview
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#enable_camel_case = 1
let g:deoplete#enable_refresh_always = 1
let g:deoplete#max_abbr_width = 0
let g:deoplete#max_menu_width = 0

let g:deoplete#omni#input_patterns = get(g:,'deoplete#omni#input_patterns',{})
let g:deoplete#omni#functions = {}
let g:deoplete#omni#functions.javascript = [
  \ 'tern#Complete',
  \ 'jspc#omni'
\]

let g:deoplete#sources = {}
let g:deoplete#sources['javascript'] = ['file', 'ultisnips', 'ternjs']
let g:deoplete#sources#ternjs#types = 1
let g:deoplete#sources#ternjs#docs = 1

call deoplete#custom#set('_', 'matchers', ['matcher_full_fuzzy'])

" supertab
let g:SuperTabClosePreviewOnPopupClose = 1 " close the preview window when you're not using it
autocmd FileType javascript let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" Ultisnips
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsSnippetsDir='~/.dotfiles/config/nvim/UltiSnips'

" vim-wiki
let my_wiki = {}
let my_wiki.path = '~/Library/Mobile Documents/com~apple~CloudDocs/.terminal-stuff/vimwiki/'
let my_wiki.html_template = '~/Library/Mobile Documents/com~apple~CloudDocs/.terminal-stuff/vimwiki-html/'
let my_wiki.nested_syntaxes = { 'js': 'javascript' }
let g:vimwiki_list = [ my_wiki ]

" vim-taskwarrior
let g:task_rc_override = 'rc.defaultwidth=0'

" magit
let g:magit_default_fold_level=0
let g:magit_auto_foldopen=0
let g:magit_default_show_all_files=0

" List themes to switch between
nnoremap <silent> <Leader>C :call fzf#run({
\   'source':
\     map(split(globpath(&rtp, "colors/*.vim"), "\n"),
\         "substitute(fnamemodify(v:val, ':t'), '\\..\\{-}$', '', '')"),
\   'sink':    'colo',
\   'options': '+m',
\   'left':    30
\ })<CR>
