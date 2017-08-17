" Section Plugins {{{

" FZF
"""""""""""""""""""""""""""""""""""""

let NERDTreeShowHidden=1

let g:fzf_layout = { 'down': '~25%' }

" unit testing
let test#strategy = "vimux" " run tests using vimux
let test#javascript#mocha#options = {
  \ 'nearest': '-r babel-register --reporter spec',
  \ 'file':    '-r babel-register --reporter spec',
  \ 'suite':   '-r babel-register --recursive --reporter spec tests',
\}

" airline options
let g:airline_powerline_fonts=1
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_theme='luna'
let g:airline#extensions#tabline#enabled = 1 " enable airline tabline
let g:airline#extensions#tabline#tab_min_count = 2 " only show tabline if tabs are being used (more than 1 tab open)
let g:airline#extensions#tabline#show_buffers = 0 " do not show open buffers in tabline
let g:airline#extensions#tabline#show_splits = 0

let g:tsuquyomi_disable_default_mappings = 1

" dont hide quotes in json files
let g:vim_json_syntax_conceal = 0

" ale
"""""""""""""""""""""""""""""""""""""
let g:ale_linters = {
  \'javascript': ['standard']
\}
let g:ale_sign_column_always = 1
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1

if isdirectory(".git")
    " if in a git project, use :GFiles
    nmap <silent> <c-n> :GFiles<cr>
else
    " otherwise, use :FZF
    nmap <silent> <c-n> :FZF<cr>
endif

nnoremap <silent> <Leader>C :call fzf#run({
\   'source':
\     map(split(globpath(&rtp, "colors/*.vim"), "\n"),
\         "substitute(fnamemodify(v:val, ':t'), '\\..\\{-}$', '', '')"),
\   'sink':    'colo',
\   'options': '+m',
\   'left':    30
\ })<CR>

command! FZFMru call fzf#run({
\  'source':  v:oldfiles,
\  'sink':    'e',
\  'options': '-m -x +s',
\  'down':    '40%'})

" Disable linting on *.vue files
augroup FiletypeGroup
  autocmd!
  au BufNewFile,BufRead *.vue set filetype=javascript.vue
augroup END

" YouCompleteMe
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1

" }}}
