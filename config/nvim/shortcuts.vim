" set a map leader for more key combos
let mapleader = ','

" remap esc
inoremap jk <esc>

" shortcut to save
nmap <leader>, :w<cr>

" toggle nerdtree
nmap <silent> <leader>k :NERDTreeToggle<cr>

" expand to the path of the file in the current buffer
nmap <silent> <leader>y :NERDTreeFind<cr>

" toggle paste mode
map <leader>v :set paste!<cr>

" edit ~/.config/nvim/init.vim
map <leader>ev :e! ~/.config/nvim/init.vim<cr>

" edit gitconfig
map <leader>eg :e! ~/.gitconfig<cr>

" remove extra whitespace
nmap <leader><space> :%s/\s\+$<cr>

" switch between current and last buffer
nmap <leader>. <c-^>

" search for word under the cursor
nnoremap <leader>/ "fyiw :/<c-r>f<cr>

" fuzzy file search
nmap <silent> <c-n> :FZF<cr>

" unit testing
nmap <silent> <leader>tt :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>g :TestVisit<CR>
nmap <silent> <leader>l :TestLast<CR>

" prompt for a command to run
map <leader>np :VimuxPromptCommand<cr>
" run last command executed by RunVimTmuxCommand
map <leader>nn :VimuxRunLastCommand<cr>
" inspect runner pane
map <leader>ni :VimuxInspectRunner<cr>
" close all other tmux panes in current window
map <leader>nx :VimuxCloseRunner<cr>
" interrupt any command running in the runner pane
map <leader>nc :VimuxInterruptRunner<cr>

nmap <silent> <leader>r :Buffers<cr>
nmap <silent> <leader>e :FZF<cr>

nnoremap <C-s> :ToggleWorkspace<CR>

" scroll the viewport faster
nnoremap <C-e> 4<C-e>
nnoremap <C-y> 4<C-y>

" clear highlighted search
noremap <space> :set hlsearch! hlsearch?<cr>

" enable . command in visual mode
vnoremap . :normal .<cr>

" move between panes
map <silent> <C-h> :call functions#WinMove('h')<cr>
map <silent> <C-j> :call functions#WinMove('j')<cr>
map <silent> <C-k> :call functions#WinMove('k')<cr>
map <silent> <C-l> :call functions#WinMove('l')<cr>

" Shortcuts for dealing with tabs
nnoremap th :tabnext<CR>
nnoremap tl :tabprev<CR>
nnoremap tn :tabnew<CR>
nnoremap H gT
nnoremap L gt

" moving up and down work as you would expect
nnoremap <silent> j gj
nnoremap <silent> k gk
nnoremap <silent> ^ g^
nnoremap <silent> $ g$

" tern_for_vim
" STILL TO MAP:
" TernDef: Jump to the definition of the thing under the cursor.
" TernDoc: Look up the documentation of something.
" TernType: Find the type of the thing under the cursor.
" TernRefs: Show all references to the variable or property under the cursor.
" TernRename: Rename the variable under the cursor.

" open task warrior in a new tab
nnoremap <leader>tw :TW<CR>

" helpers for dealing with other people's code
nmap \t :set ts=2 sts=2 sw=2 noet<cr>
nmap \s :set ts=2 sts=2 sw=2 et<cr>

