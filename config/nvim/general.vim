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

" }}}

" Section User Interface {{{

" switch cursor to line when in insert mode, and block when not
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

set t_ut=
set t_Co=256                " Explicitly tell vim that the terminal supports 256 colors"
" colorscheme mustang
" colorscheme atom-dark-256
colorscheme tender
syntax on

highlight LineNr ctermfg=8

set number                  " show line numbers
set relativenumber          " show relative line numbers

"set wrap                    " turn on line wrapping
set wrapmargin=8            " wrap lines when coming within n characters from side
set linebreak               " set soft wrapping
set showbreak=…             " show ellipsis at breaking

set autoindent              " automatically set indent of new line
set smartindent

" highlight conflicts
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" make backspace behave in a sane manner
set backspace=indent,eol,start

" set splitbelow              " preview window opened at the bottom

" Tab control
set expandtab               " on pressing tab, insert spaces
set smarttab                " tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
set tabstop=2               " the visible width of tabs
set softtabstop=2           " edit as if the tabs are 2 characters wide
set shiftwidth=2            " number of spaces to use for indent and unindent
set shiftround              " round indent to a multiple of 'shiftwidth'

" code folding settings
set foldmethod=syntax       " fold based on syntax
set foldnestmax=10          " deepest fold is 10 levels
set nofoldenable            " don't fold by default
set foldlevel=1

set clipboard=unnamed

set ttyfast                 " faster redrawing
set laststatus=2            " show the satus line all the time
set so=7                    " set 7 lines to the cursors - when moving vertical
set wildmenu                " enhanced command line completion
set hidden                  " current buffer can be put into background
set showcmd                 " show incomplete commands
set noshowmode              " don't show which mode disabled for PowerLine
set wildmode=list:longest   " complete files like a shell
set scrolloff=5             " lines of text around cursor
set cmdheight=1             " command bar height
set title                   " set terminal title
set diffopt+=vertical
set shell=$SHELL

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

set mouse=a
" }}}
