" set a map leader for more key combos
let mapleader = ','

" remap esc
inoremap jk <esc>

" shortcut to save
nmap <leader>, :w<cr>

" ack without opening the first match
cnoreabbrev Ack Ack!

" move between panes
map <silent> <C-h> :call functions#WinMove('h')<cr>
map <silent> <C-j> :call functions#WinMove('j')<cr>
map <silent> <C-k> :call functions#WinMove('k')<cr>
map <silent> <C-l> :call functions#WinMove('l')<cr>

" nerdtree
nmap <silent> <leader>k :NERDTreeToggle<cr>
nmap <silent> <leader>y :NERDTreeFind<cr>

" tagbar
nmap <silent> <leader>tb :TagbarToggle<cr>
nmap <silent> <F8> :TagbarToggle<cr>
imap <silent> <F8> :TagbarToggle<cr>

" close quickfix
nmap <silent> <leader>qc :cclose<cr>

" toggle paste mode
map <leader>v :set paste!<cr>

" remove extra whitespace
nmap <leader><space> :%s/\s\+$<cr>

" switch between current and last buffer
nmap <leader>. <c-^>

" search for word under the cursor
nnoremap <leader>/ "fyiw :/<c-r>f<cr>

" fuzzy file search - if in a git project, use :GFiles, otherwise, use :FZF
" if isdirectory(".git")
"   nmap <silent> <c-n> :GFiles<cr>
" else
  " nmap <silent> <c-n> :FZF<cr>
" endif

" unit testing
nmap <silent> <leader>tt :TestNearest<CR>
nmap <silent> <leader>T  :TestFile<CR>
nmap <silent> <leader>ta :TestSuite<CR>
nmap <silent> <leader>l  :TestLast<CR>

" prompt for a command to run
map <leader>np :VimuxPromptCommand<cr>
" run last command executed by RunVimTmuxCommand
map <leader>nn :VimuxInterruptRunner<cr>:VimuxRunLastCommand<cr>
" map <leader>nn :VimuxRunLastCommand<cr>
" interrupt any command running in the runner pane
map <leader>nc :VimuxInterruptRunner<cr>

" open a list of buffers
" nmap <silent> <leader>r :Buffers<cr>

" open fzf
nmap <silent> <leader>e :FZF<cr>

" scroll the viewport faster
nnoremap <C-e> 4<C-e>
nnoremap <C-y> 4<C-y>

" clear highlighted search
noremap <space> :set hlsearch! hlsearch?<cr>

" create a new tab
nnoremap tn :tabnew<CR>
" move to tab on the left
nnoremap H gT
" move to tab on the right
nnoremap L gt

" moving up and down work as you would expect
nnoremap <silent> j gj
nnoremap <silent> k gk
nnoremap <silent> ^ g^
nnoremap <silent> $ g$

" vim-bbye
nnoremap <Leader>q :Bdelete<CR>
" nnoremap <Leader>qa :bufdo :Bdelete<CR>

" nnoremap <silent> <leader>ff :%!python -m json.tool<cr>

" helpers for dealing with other people's code
nmap \t :set ts=2 sts=2 sw=2 noet<cr>
nmap \s :set ts=2 sts=2 sw=2 et<cr>

" run selected text in tmux session
vmap <silent> <leader>vs "vy :call VimuxRunCommand("clear; " . @v)<cr>
nmap <silent> <leader>vs vip<leader>vs<CR>

" remap win resizer
let g:winresizer_start_key = '<C-T>'

" fugitive git bindings
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gb :Gblame<CR>

" Table table mode
nnoremap <leader>tm :TableModeToggle<CR>


" fzf-preview

let g:fzf_preview_command = 'bat --color=always --style=grid --theme=gruvbox {-1}'

nnoremap <silent> <C-n>        :<C-u>FzfPreviewFromResources project git<CR>
" nnoremap <silent> <leader>fgs    :<C-u>FzfPreviewGitStatus<CR>
nnoremap <silent> <leader>fb     :<C-u>FzfPreviewBuffers<CR>
nnoremap <silent> <leader>fB     :<C-u>FzfPreviewAllBuffers<CR>
nnoremap <silent> <leader>fo     :<C-u>FzfPreviewFromResources buffer project<CR>
nnoremap <silent> <leader>f<C-o> :<C-u>FzfPreviewJumps<CR>
nnoremap <silent> <leader>fg;    :<C-u>FzfPreviewChanges<CR>
nnoremap <silent> <leader>f/     :<C-u>FzfPreviewLines -add-fzf-arg=--no-sort -add-fzf-arg=--query="'"<CR>
nnoremap <silent> <leader>f*     :<C-u>FzfPreviewLines -add-fzf-arg=--no-sort -add-fzf-arg=--query="'<C-r>=expand('<cword>')<CR>"<CR>
nnoremap          <leader>fgr    :<C-u>FzfPreviewProjectGrep<Space>
xnoremap          <leader>fgr    "sy:FzfPreviewProjectGrep<Space>-F<Space>"<C-r>=substitute(substitute(@s, '\n', '', 'g'), '/', '\\/', 'g')<CR>"
nnoremap <silent> <leader>ft     :<C-u>FzfPreviewBufferTags<CR>
nnoremap <silent> <leader>fq     :<C-u>FzfPreviewQuickFix<CR>
nnoremap <silent> <leader>fl     :<C-u>FzfPreviewLocationList<CR>


" " floaterm
" let g:floaterm_position      = 'center'
" let g:floaterm_keymap_new    = '<F7>'
" let g:floaterm_keymap_prev   = '<F8>'
" let g:floaterm_keymap_next   = '<F9>'
" let g:floaterm_keymap_toggle = '<F10>'

" " Creates a floating window with a most recent buffer to be used
" function! CreateCenteredFloatingWindow()
"   let width = float2nr(&columns * 0.8)
"   let height = float2nr(&lines * 0.8)
"   let top = ((&lines - height) / 2) - 1
"   let left = (&columns - width) / 2
"   let opts = {'relative': 'editor', 'row': top, 'col': left, 'width': width, 'height': height, 'style': 'minimal'}

"   let top = "╭" . repeat("─", width - 2) . "╮"
"   let mid = "│" . repeat(" ", width - 2) . "│"
"   let bot = "╰" . repeat("─", width - 2) . "╯"
"   let lines = [top] + repeat([mid], height - 2) + [bot]
"   let s:buf = nvim_create_buf(v:false, v:true)
"   call nvim_buf_set_lines(s:buf, 0, -1, v:true, lines)
"   call nvim_open_win(s:buf, v:true, opts)
"   set winhl=Normal:Floating
"   let opts.row += 1
"   let opts.height -= 2
"   let opts.col += 2
"   let opts.width -= 4
"   call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
"   autocmd BufWipeout <buffer> call CleanupBuffer(s:buf)
"   tnoremap <buffer> <silent> <Esc> <C-\><C-n><CR>:call DeleteUnlistedBuffers()<CR>
" endfunction

" " When term starts, auto go into insert mode
" autocmd TermOpen * startinsert

" " Turn off line numbers etc
" autocmd TermOpen * setlocal listchars= nonumber norelativenumber

" function! ToggleTerm(cmd)
"   if empty(bufname(a:cmd))
"     call CreateCenteredFloatingWindow()
"     call termopen(a:cmd, { 'on_exit': function('OnTermExit') })
"   else
"     call DeleteUnlistedBuffers()
"   endif
" endfunction

" " Open Project
" function! ToggleProject()
"   call ToggleTerm('tmuxinator-fzf-start.sh')
" endfunction

" " Opens a throwaway/scratch terminal
" function! ToggleScratchTerm()
"   call ToggleTerm('zsh')
" endfunction

" " Opens lazygit
" function! ToggleLazyGit()
"   call ToggleTerm('lazygit')
" endfunction

" " Opens lazydocker
" function! ToggleLazyDocker()
"   call ToggleTerm('lazydocker')
" endfunction
" nnoremap <silent> <Leader>' :call ToggleLazyDocker()<CR>

" " Opens harvest starti
" function! ToggleHarvest()
"   call ToggleTerm('hstarti')
" endfunction

" function! OnTermExit(job_id, code, event) dict
"   if a:code == 0
"     call DeleteUnlistedBuffers()
"   endif
" endfunction

" function! DeleteUnlistedBuffers()
"   for n in nvim_list_bufs()
"     if ! buflisted(n)
"       let name = bufname(n)
"       if name == '[Scratch]' ||
"             \ matchend(name, ":zsh") ||
"             \ matchend(name, ":lazygit") ||
"             \ matchend(name, ":tmuxinator-fzf-start.sh") ||
"             \ matchend(name, ":hstarti")
"         call CleanupBuffer(n)
"       endif
"     endif
"   endfor
" endfunction

" function! CleanupBuffer(buf)
"   if bufexists(a:buf)
"     silent execute 'bwipeout! '.a:buf
"   endif
" endfunction


" " Use ripgrep for fzf
" " let $FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --iglob "!.DS_Store" --iglob "!.git"'
" " let $FZF_DEFAULT_COMMAND='fzf'

" " Configure FZF to use a floating window configuration
" " let $FZF_DEFAULT_OPTS = '--layout=reverse --cycle'
" let $FZF_DEFAULT_OPTS = '--cycle'
" let g:fzf_colors =
"       \ { 'fg':    ['fg', 'Normal'],
"       \ 'bg':      ['bg', 'Normal'],
"       \ 'hl':      ['fg', 'Comment'],
"       \ 'fg+':     ['fg', 'CursorLine'],
"       \ 'bg+':     ['bg', 'Normal'],
"       \ 'hl+':     ['fg', 'Statement'],
"       \ 'info':    ['fg', 'PreProc'],
"       \ 'border':  ['fg', 'CursorLine'],
"       \ 'prompt':  ['fg', 'Conditional'],
"       \ 'pointer': ['fg', 'Exception'],
"       \ 'marker':  ['fg', 'Keyword'],
"       \ 'spinner': ['fg', 'Label'],
"       \ 'header':  ['fg', 'Comment'] }

" let g:fzf_layout = { 'window': 'call CreateCenteredFloatingWindow()' }

" Language specific mappings
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Golang
" """""""""""""""""""
" autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')
" autocmd FileType go nmap <c-b> :GoDef<cr>
autocmd FileType go nmap gd :GoDef<cr>

" Toggle go code coverage
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)

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

" use goimports instead of gofmt when saving
let g:go_fmt_command = "goimports"



" TypeScript
" """""""""""""""""""
" autocmd FileType typescript nmap <c-b> :TsuDefinition<cr>
" autocmd FileType typescript nmap <c-b> :TsuSplitDefinition<cr>

