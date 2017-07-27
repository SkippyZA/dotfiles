" Leader shortcuts {{{

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

" markdown to html
nmap <leader>md :%!markdown --html4tags <cr>

" remove extra whitespace
nmap <leader><space> :%s/\s\+$<cr>

" switch between current and last buffer
nmap <leader>. <c-^>

" search for word under the cursor
nnoremap <leader>/ "fyiw :/<c-r>f<cr>

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

" git fugitive shortcuts
nmap <silent> <leader>gs :Gstatus<cr>
nmap <silent> <leader>ge :Gedit<cr>
nmap <silent> <leader>gr :Gread<cr>
nmap <silent> <leader>gb :Gblame<cr>

nmap <silent> <leader>r :Buffers<cr>
nmap <silent> <leader>e :FZF<cr>
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" }}}


" Ctrl shortcuts {{{

" move between panes
map <silent> <C-h> :call functions#WinMove('h')<cr>
map <silent> <C-j> :call functions#WinMove('j')<cr>
map <silent> <C-k> :call functions#WinMove('k')<cr>
map <silent> <C-l> :call functions#WinMove('l')<cr>

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" scroll the viewport faster
nnoremap <C-e> 4<C-e>
nnoremap <C-y> 4<C-y>

" }}}

" clear highlighted search
noremap <space> :set hlsearch! hlsearch?<cr>

" enable . command in visual mode
vnoremap . :normal .<cr>

" Shortcuts for dealing with tabs
nnoremap th :tabnext<CR>
nnoremap tl :tabprev<CR>
nnoremap tn :tabnew<CR>
nnoremap H gT
nnoremap L gt
"map <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
"map <silent> <A-Right> :execute 'silent! tabmove ' . (tabpagenr()+1)<CR>

" moving up and down work as you would expect
nnoremap <silent> j gj
nnoremap <silent> k gk
nnoremap <silent> ^ g^
nnoremap <silent> $ g$

" nnoremap <silent> <leader>u :call functions#HtmlUnEscape()<cr>

" TODO: Revisit this
" map <silent> <C-b> :TernDef<cr>
" map <silent> <C-Y> :TernRefs<cr>

