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
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
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
let g:tern_request_timeout=1 " set timeout
let g:tern_show_argument_hints='on_hold' " display argument type hints when the cursor is left over a function
let g:tern_show_signature_in_pum='0' " display function signature in the completion menu

" javascript libraries syntax.vim
let g:used_javascript_libs='ramda'

" vim-javascript
let g:javascript_plugin_jsdoc = 1

" vim-workspace
let g:workspace_session_name = '.session.vim'

" YouCompleteMe
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1
