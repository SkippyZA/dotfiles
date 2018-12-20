" set a map leader for more key combos
let mapleader = ','

" remap esc
inoremap jk <esc>

" shortcut to save
nmap <leader>, :w<cr>

" move between panes
map <silent> <C-h> :call functions#WinMove('h')<cr>
map <silent> <C-j> :call functions#WinMove('j')<cr>
map <silent> <C-k> :call functions#WinMove('k')<cr>
map <silent> <C-l> :call functions#WinMove('l')<cr>

" nerdtree
nmap <silent> <leader>k :NERDTreeToggle<cr>
nmap <silent> <leader>y :NERDTreeFind<cr>

" toggle paste mode
map <leader>v :set paste!<cr>

" remove extra whitespace
nmap <leader><space> :%s/\s\+$<cr>

" switch between current and last buffer
nmap <leader>. <c-^>

" search for word under the cursor
nnoremap <leader>/ "fyiw :/<c-r>f<cr>

" fuzzy file search - if in a git project, use :GFiles, otherwise, use :FZF
if isdirectory(".git")
  nmap <silent> <c-n> :GFiles<cr>
else
  nmap <silent> <c-n> :FZF<cr>
endif

" unit testing
nmap <silent> <leader>tt :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>

" prompt for a command to run
map <leader>np :VimuxPromptCommand<cr>
" run last command executed by RunVimTmuxCommand
map <leader>nn :VimuxRunLastCommand<cr>
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
nnoremap <Leader>qa :bufdo :Bdelete<CR>

" nnoremap <silent> <leader>ff :%!python -m json.tool<cr>

" helpers for dealing with other people's code
nmap \t :set ts=2 sts=2 sw=2 noet<cr>
nmap \s :set ts=2 sts=2 sw=2 et<cr>

" run selected text in tmux session
vmap <silent> <leader>vs "vy :call VimuxRunCommand("clear; " . @v)<cr>
nmap <silent> <leader>vs vip<leader>vs<CR>

" remap win resizer
let g:winresizer_start_key = '<C-T>'

" Language specific mappings
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Golang
" """""""""""""""""""
autocmd FileType go nmap <c-b> :GoDef<cr>

" TypeScript
" """""""""""""""""""
" autocmd FileType typescript nmap <c-b> :TsuDefinition<cr>
" autocmd FileType typescript nmap <c-b> :TsuSplitDefinition<cr>

