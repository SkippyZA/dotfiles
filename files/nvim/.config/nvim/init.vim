source ~/.config/nvim/plugins.vim
source ~/.config/nvim/general.vim
source ~/.config/nvim/plugin-config.vim
source ~/.config/nvim/shortcuts.vim
source ~/.config/nvim/tmp-files.vim

" " Diffs {{{

" " Open diffs in vertical splits
" " Use 'xdiff' library options: patience algorithm with indent-heuristics (same to Git options)
" " NOTE: vim uses the external diff utility which doesn't do word diffs nor can it find moved-and-modified lines.
" " See: https://stackoverflow.com/questions/36519864/the-way-to-improve-vimdiff-similarity-searching-mechanism
" set diffopt=internal,filler,vertical,context:5,foldcolumn:1,indent-heuristic,algorithm:patience

" " Detect if vim is started as a diff tool (vim -d, vimdiff)
" " NOTE: Does not work when you start Vim as usual and enter diff mode using :diffthis
" if &diff
"   let g:is_started_as_vim_diff = 1
" endif

" augroup aug_diffs
"   au!

"   " Inspect whether some windows are in diff mode, and apply changes for such windows
"   " Run asynchronously, to ensure '&diff' option is properly set by Vim
"   au WinEnter,BufEnter * call timer_start(50, 'CheckDiffMode')

"   " Highlight VCS conflict markers
"   au VimEnter,WinEnter * if !exists('w:_vsc_conflict_marker_match') |
"         \   let w:_vsc_conflict_marker_match = matchadd('ErrorMsg', '^\(<\|=\||\|>\)\{7\}\([^=].\+\)\?$') |
"         \ endif
" augroup END

" " Get list of all windows running in diff mode
" function s:GetDiffWindows()
"   return filter(range(1, winnr('$')), { idx, val -> getwinvar(val, '&diff') })
" endfunction

" " Detect window or buffer local option is in sync with diff mode
" function s:change_option_in_diffmode(scope, option, value, ...)
"   let isBoolean = get(a:, "1", 0)
"   let backupVarname = a:scope . "_old_" . a:option

"   " Entering diff mode
"   if &diff && !exists(backupVarname)
"     exe "let " . backupVarname . "=&" . a:option
"     call s:set_option(a:option, a:value, 1, isBoolean)
"   endif

"   " Exiting diff mode
"   if !&diff && exists(backupVarname)
"     let oldValue = eval(backupVarname)
"     call s:set_option(a:option, oldValue, 1, isBoolean)
"     exe "unlet " . backupVarname
"   endif
" endfunction

" " In diff mode:
" " - Disable syntax highlighting
" " - Disable spell checking
" function CheckDiffMode(timer)
"   let curwin = winnr()

"   " Check each window
"   for _win in range(1, winnr('$'))
"     exe "noautocmd " . _win . "wincmd w"

"     call s:change_option_in_diffmode('b:', 'syntax', 'off')
"     call s:change_option_in_diffmode('w:', 'spell', 0, 1)
"   endfor

"   " Get back to original window
"   exe "noautocmd " . curwin . "wincmd w"
" endfunction

" " Diff exchange and movement actions. Mappings come from 'samoshkin/vim-mergetool'
" nmap <expr> <C-Left> &diff? '<Plug>(MergetoolDiffExchangeLeft)' : '<C-Left>'
" nmap <expr> <C-Right> &diff? '<Plug>(MergetoolDiffExchangeRight)' : '<C-Right>'
" nmap <expr> <C-Down> &diff? '<Plug>(MergetoolDiffExchangeDown)' : '<C-Down>'
" nmap <expr> <C-Up> &diff? '<Plug>(MergetoolDiffExchangeUp)' : '<C-Up>'

" " Move through diffs. [c and ]c are native Vim mappings
" nnoremap <expr> <Up> &diff ? '[czz' : ''
" nnoremap <expr> <Down> &diff ? ']czz' : ''
" nnoremap <expr> <Left> &diff? '<C-w>h' : ''
" nnoremap <expr> <Right> &diff? '<C-w>l' : ''

" " Change :diffsplit command to open diff in new tab
" cnoreabbrev <expr> diffsplit getcmdtype() == ":" && getcmdline() == 'diffsplit' ? 'tab split \| diffsplit' : 'diffsplit'
" " }}}

" " PLUGIN: samoshkin/vim-mergetool{{{
" " function s:on_mergetool_set_layout(split)
" "   " Disable syntax and spell checking highlighting in merge mode
" "   setlocal syntax=off
" "   setlocal nospell

" "   " When base is horizontal split at the bottom
" "   " Turn off diff mode, and show syntax highlighting
" "   " Also let it take less height
" "   if a:split["layout"] ==# 'mr,b' && a:split["split"] ==# 'b'
" "     setlocal nodiff
" "     setlocal syntax=on
" "     resize 15
" "   endif
" " endfunction

" " let g:mergetool_layout = 'mr'
" let g:mergetool_prefer_revision = 'local'
" " let g:MergetoolSetLayoutCallback = function('s:on_mergetool_set_layout')

" nmap <leader>mt :MergetoolToggle<cr>
" " nnoremap <silent> <leader>mb :call mergetool#toggle_layout('mr,b')<CR>
" nnoremap <leader>mb :call mergetool#toggle_layout('mr,b')<CR>

" nmap <expr> <C-Left> :MergetoolDiffExchangeLeft<cr>
" nmap <expr> <C-Right> :MergetoolDiffExchangeRight<cr>
" nmap <expr> <C-Down> :MergetoolDiffExchangeDown<cr>
" nmap <expr> <C-Up> :MergetoolDiffExchangeUp<cr>

" " }}}

" " Misc {{{

" " Set option using set or setlocal, be it string or boolean value
" function s:set_option(option, value, ...)
"   let isLocal = get(a:, "1", 0)
"   let isBoolean = get(a:, "2", 0)
"   if isBoolean
"     exe (isLocal ? "setlocal " : "set ") . (a:value ? "" : "no") . a:option
"   else
"     exe (isLocal ? "setlocal " : "set ") . a:option . "=" . a:value
"   endif
" endfunction

" " }}}


" set encoding=utf-8

" " imap <C-j> <C-X><C-O>
