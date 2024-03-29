" set a map leader for more key combos
let mapleader = ','

" common typos .. (W, Wq WQ)
if has("user_commands")
  command! -bang -nargs=* -complete=file E e<bang> <args>
  command! -bang -nargs=* -complete=file W w<bang> <args>
  command! -bang -nargs=* -complete=file Wq wq<bang> <args>
  command! -bang -nargs=* -complete=file WQ wq<bang> <args>
  command! -bang Wa wa<bang>
  command! -bang WA wa<bang>
  command! -bang Q q<bang>
  command! -bang QA qa<bang>
  command! -bang Qa qa<bang>
endif

" remap esc
inoremap jk <esc>

" shortcut to save
nmap <leader>, :w<cr>

" toggle spellcheck
function! ToggleSpellCheck()
  set spell!
  if &spell
    echo "Spellcheck ON"
  else
    echo "Spellcheck OFF"
  endif
endfunction
nnoremap <silent> <leader>S :call ToggleSpellCheck()<CR>

" ack without opening the first match
cnoreabbrev Ack Ack!

" move between panes
nmap <silent> <C-h> :call functions#WinMove('h')<cr>
nmap <silent> <C-j> :call functions#WinMove('j')<cr>
nmap <silent> <C-k> :call functions#WinMove('k')<cr>
nmap <silent> <C-l> :call functions#WinMove('l')<cr>

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
map <leader>np :VimuxInterruptRunner<cr>:VimuxPromptCommand<cr>
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
nnoremap <leader>gs :Git<CR>
nnoremap <leader>gb :Git blame<CR>

" Table table mode
nnoremap <leader>tm :TableModeToggle<CR>


" fzf-preview

let g:fzf_preview_command = 'bat --color=always --style=grid --theme=gruvbox {-1}'

nnoremap <silent> <C-n>          :CocCommand fzf-preview.FromResources project git<CR>
nnoremap <silent> <leader>fb     :CocCommand fzf-preview.Buffers<CR>
nnoremap <silent> <leader>fB     :CocCommand fzf-preview.AllBuffers<CR>
nnoremap <silent> <leader>fo     :CocCommand fzf-preview.FromResources buffer project<CR>
nnoremap <silent> <leader>f<C-o> :CocCommand fzf-preview.Jumps<CR>
nnoremap <silent> <leader>fg;    :CocCommand fzf-preview.Changes<CR>
nnoremap <silent> <leader>f/     :CocCommand fzf-preview.Lines -add-fzf-arg=--no-sort -add-fzf-arg=--query="'"<CR>
nnoremap <silent> <leader>f*     :CocCommand fzf-preview.Lines -add-fzf-arg=--no-sort -add-fzf-arg=--query="'<C-r>=expand('<cword>')<CR>"<CR>
nnoremap          <leader>fgr    :CocCommand fzf-preview.ProjectGrep<Space>
xnoremap          <leader>fgr    "sy:CocCommand fzf-preview.ProjectGrep<Space>-F<Space>"<C-r>=substitute(substitute(@s, '\n', '', 'g'), '/', '\\/', 'g')<CR>"
nnoremap <silent> <leader>ft     :CocCommand fzf-preview.BufferTags<CR>
nnoremap <silent> <leader>fq     :CocCommand fzf-preview.QuickFix<CR>
nnoremap <silent> <leader>fl     :CocCommand fzf-preview.LocationList<CR>
