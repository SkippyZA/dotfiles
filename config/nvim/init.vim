source ~/.config/nvim/plugins.vim

" Section General {{{

" Abbreviations
abbr funciton function
abbr teh the
abbr tempalte template
abbr fitler filter

set nocompatible            " not compatible with vi
set autoread                " detect when a file is changed

set history=1000            " change history to 1000
set textwidth=120

set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

let g:python2_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

" }}}

" Section User Interface {{{

" switch cursor to line when in insert mode, and block when not
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

if &term =~ '256color'
    " disable background color erase
    set t_ut=
endif

" enable 24 bit color support if supported
if (empty($TMUX) && has("termguicolors"))
    set termguicolors
endif

let g:onedark_termcolors=16
let g:onedark_terminal_italics=1

syntax on
set t_Co=256                " Explicitly tell vim that the terminal supports 256 colors"
" colorscheme onedark         " Set the colorscheme
colorscheme mustang

" make the highlighting of tabs and other non-text less annoying
highlight SpecialKey ctermbg=none ctermfg=8
highlight NonText ctermbg=none ctermfg=8

" make comments and HTML attributes italic
highlight Comment cterm=italic
highlight htmlArg cterm=italic

set number                  " show line numbers
set relativenumber          " show relative line numbers

set wrap                    " turn on line wrapping
set wrapmargin=8            " wrap lines when coming within n characters from side
set linebreak               " set soft wrapping
set showbreak=…             " show ellipsis at breaking

set autoindent              " automatically set indent of new line
set smartindent

" toggle invisible characters
" set list
" set listchars=tab:→\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
" set showbreak=↪

" highlight conflicts
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" make backspace behave in a sane manner
set backspace=indent,eol,start

" Tab control
" -- set noexpandtab             " insert tabs rather than spaces for <Tab>
" -- set smarttab                " tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
" -- set tabstop=4               " the visible width of tabs
" -- set softtabstop=4           " edit as if the tabs are 4 characters wide
" -- set shiftwidth=4            " number of spaces to use for indent and unindent
" -- set shiftround              " round indent to a multiple of 'shiftwidth'
" -- set completeopt+=longest

" code folding settings
set foldmethod=syntax       " fold based on indent
set foldnestmax=10          " deepest fold is 10 levels
set nofoldenable            " don't fold by default
set foldlevel=1

set clipboard=unnamed

set ttyfast                 " faster redrawing
set diffopt+=vertical
set laststatus=2            " show the satus line all the time
set so=7                    " set 7 lines to the cursors - when moving vertical
set wildmenu                " enhanced command line completion
set hidden                  " current buffer can be put into background
set showcmd                 " show incomplete commands
set noshowmode              " don't show which mode disabled for PowerLine
set wildmode=list:longest   " complete files like a shell
set scrolloff=5             " lines of text around cursor
set shell=$SHELL
set cmdheight=1             " command bar height
set title                   " set terminal title

" Searching
set ignorecase              " case insensitive searching
set smartcase               " case-sensitive if expresson contains a capital letter
set hlsearch                " highlight search results
set incsearch               " set incremental search, like modern browsers
set nolazyredraw            " don't redraw while executing macros

set magic                   " Set magic on, for regex

set showmatch               " show matching braces
set mat=2                   " how many tenths of a second to blink

" error bells
set noerrorbells
set visualbell
set t_vb=
set tm=500

" -- if has('mouse')
" -- 	set mouse=a
" -- 	" set ttymouse=xterm2
" -- endif

" }}}

" Section Mappings {{{

" set a map leader for more key combos
let mapleader = ','

" remap esc
inoremap jk <esc>

" wipout buffer
" -- nmap <silent> <leader>b :bw<cr>

" shortcut to save
nmap <leader>, :w<cr>

" run current file with node
nmap <leader>n :!node %<cr>

" set paste toggle
" -- set pastetoggle=<leader>v

" toggle paste mode
map <leader>v :set paste!<cr>

" edit ~/.config/nvim/init.vim
map <leader>ev :e! ~/.config/nvim/init.vim<cr>
" edit gitconfig
map <leader>eg :e! ~/.gitconfig<cr>

" clear highlighted search
noremap <space> :set hlsearch! hlsearch?<cr>

" activate spell-checking alternatives
" -- nmap ;s :set invspell spelllang=en<cr>

" markdown to html
nmap <leader>md :%!markdown --html4tags <cr>

" remove extra whitespace
nmap <leader><space> :%s/\s\+$<cr>

" -- nmap <leader>l :set list!<cr>

" switch between current and last buffer
nmap <leader>. <c-^>

" enable . command in visual mode
vnoremap . :normal .<cr>

map <silent> <C-h> :call functions#WinMove('h')<cr>
map <silent> <C-j> :call functions#WinMove('j')<cr>
map <silent> <C-k> :call functions#WinMove('k')<cr>
map <silent> <C-l> :call functions#WinMove('l')<cr>

map <leader>wc :wincmd q<cr>

" toggle cursor line
" -- nnoremap <leader>i :set cursorline!<cr>

" scroll the viewport faster
nnoremap <C-e> 5<C-e>
nnoremap <C-y> 5<C-y>

" moving up and down work as you would expect
nnoremap <silent> j gj
nnoremap <silent> k gk
nnoremap <silent> ^ g^
nnoremap <silent> $ g$

" Shortcuts for dealing with tabs
nnoremap th :tabnext<CR>
nnoremap tl :tabprev<CR>
nnoremap tn :tabnew<CR>
nnoremap H gT
nnoremap L gt
"map <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
"map <silent> <A-Right> :execute 'silent! tabmove ' . (tabpagenr()+1)<CR>

" search for word under the cursor
nnoremap <leader>/ "fyiw :/<c-r>f<cr>

" inoremap <tab> <c-r>=Smart_TabComplete()<CR>

" -- map <leader>r :call RunCustomCommand()<cr>
" -- " map <leader>s :call SetCustomCommand()<cr>
" -- let g:silent_custom_command = 0

" helpers for dealing with other people's code
nmap \t :set ts=2 sts=2 sw=2 noet<cr>
nmap \s :set ts=2 sts=2 sw=2 et<cr>

nnoremap <silent> <leader>u :call functions#HtmlUnEscape()<cr>

" TODO: Revisit this
" map <silent> <C-b> :TernDef<cr>
" map <silent> <C-Y> :TernRefs<cr>

" }}}

" Section AutoGroups {{{
" file type specific settings
augroup configgroup
    autocmd!

    " automatically resize panes on resize
    autocmd VimResized * exe 'normal! \<c-w>='
    " -- autocmd BufWritePost .vimrc,.vimrc.local,init.vim source %
    " -- autocmd BufWritePost .vimrc.local source %
    " save all files on focus lost, ignoring warnings about untitled buffers
    autocmd FocusLost * silent! wa

    " make quickfix windows take all the lower section of the screen
    " when there are multiple windows open
    autocmd FileType qf wincmd J

    autocmd BufNewFile,BufReadPost *.md set filetype=markdown
    let g:markdown_fenced_languages = ['css', 'javascript', 'js=javascript', 'json=javascript', 'stylus', 'html']

    autocmd BufNewFile,BufRead,BufWrite *.md syntax match Comment /\%^---\_.\{-}---$/
augroup END

" }}}

" Section Plugins {{{

" FZF
"""""""""""""""""""""""""""""""""""""

" Toggle NERDTree
nmap <silent> <leader>k :NERDTreeToggle<cr>
" expand to the path of the file in the current buffer
nmap <silent> <leader>y :NERDTreeFind<cr>

let NERDTreeShowHidden=1

" -- let g:fzf_layout = { 'down': '~25%' }

" -- if isdirectory(".git")
" --     " if in a git project, use :GFiles
" --     nmap <silent> <leader>t :GFiles<cr>
" -- else
" --     " otherwise, use :FZF
" --     nmap <silent> <leader>t :FZF<cr>
" -- endif

" -- nmap <silent> <leader>r :Buffers<cr>
" -- nmap <silent> <leader>e :FZF<cr>
" -- nmap <leader><tab> <plug>(fzf-maps-n)
" -- xmap <leader><tab> <plug>(fzf-maps-x)
" -- omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
" -- imap <c-x><c-k> <plug>(fzf-complete-word)
" -- imap <c-x><c-f> <plug>(fzf-complete-path)
" -- imap <c-x><c-j> <plug>(fzf-complete-file-ag)
" -- imap <c-x><c-l> <plug>(fzf-complete-line)

" -- nnoremap <silent> <Leader>C :call fzf#run({
" -- \   'source':
" -- \     map(split(globpath(&rtp, "colors/*.vim"), "\n"),
" -- \         "substitute(fnamemodify(v:val, ':t'), '\\..\\{-}$', '', '')"),
" -- \   'sink':    'colo',
" -- \   'options': '+m',
" -- \   'left':    30
" -- \ })<CR>

" -- command! FZFMru call fzf#run({
" -- \  'source':  v:oldfiles,
" -- \  'sink':    'e',
" -- \  'options': '-m -x +s',
" -- \  'down':    '40%'})

" Unit testing
"""""""""""""""""""""""""""""""""""""
let test#strategy = "vimux" " run tests using vimux
let test#javascript#mocha#options = {
  \ 'nearest': '-r babel-register --reporter spec',
  \ 'file':    '-r babel-register --reporter spec',
  \ 'suite':   '-r babel-register --recursive --reporter spec tests',
\}
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>


" Fugitive Shortcuts
"""""""""""""""""""""""""""""""""""""
nmap <silent> <leader>gs :Gstatus<cr>
nmap <leader>ge :Gedit<cr>
nmap <silent><leader>gr :Gread<cr>
nmap <silent><leader>gb :Gblame<cr>

nmap <leader>m :MarkedOpen!<cr>
nmap <leader>mq :MarkedQuit<cr>
nmap <leader>* *<c-o>:%s///gn<cr>

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

" don't hide quotes in json files
let g:vim_json_syntax_conceal = 0

" }}}

" vim:foldmethod=marker:foldlevel=0

