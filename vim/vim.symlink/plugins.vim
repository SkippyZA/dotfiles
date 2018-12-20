call plug#begin('~/.vim/plugged')

" colorschemes
Plug 'jacoborus/tender.vim'

" workspace
Plug 'scrooloose/nerdtree' | Plug 'Xuyuanp/nerdtree-git-plugin' | Plug 'ryanoasis/vim-devicons' " file drawer
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim' " fuzzy file finder and so much more
Plug 'vim-airline/vim-airline' " fancy statusline
Plug 'vim-airline/vim-airline-themes' " themes for vim-airline
Plug 'tpope/vim-projectionist' " projectionist project config
Plug 'simeji/winresizer' " resize windows with h,j,k,l

" productivity
Plug 'blindFS/vim-taskwarrior' " task warrior plugin
Plug 'tbabej/taskwiki' " taskwarrior integration with vim-wiki
Plug 'vimwiki/vimwiki' " personal wiki

" git
Plug 'tpope/vim-fugitive' " amazing git wrapper for vim
Plug 'jreybert/vimagit' " vim clone of emacs magit
Plug 'tpope/vim-rhubarb' " GitHub extension for vim-fugitive

" utilities
Plug 'Shougo/denite.nvim'
" Plug 'Shougo/unite.vim'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
" Plug 'ervandew/supertab' " everything in tab
Plug 'Raimondi/delimitMate' " automatic closing of quotes, parenthesis, brackets, etc.
Plug 'SirVer/ultisnips' " snippets plugin
Plug 'moll/vim-bbye' " delete buffers without closing windows
Plug 'kana/vim-textobj-user' " create own test segments. required for Julian/vim-textobj-var.....
Plug 'Julian/vim-textobj-variable-segment' " segments for camelCase, sanke-case etc
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'AndrewRadev/splitjoin.vim' " split join blocks of code

Plug 'mileszs/ack.vim' " search inside files using ack. Same as command line ack utility, but use :Ack
Plug 'benmills/vimux' " tmux integration for vim
Plug 'tpope/vim-unimpaired' " mappings which are simply short normal mode aliases for commonly used ex commands
Plug 'tpope/vim-commentary' " comment stuff out
Plug 'tpope/vim-surround' " mappings to easily delete, change and add such surroundings in pairs, such as quotes, parens, etc.
Plug 'tpope/vim-dispatch' " asynchronous build and test dispatcher
Plug 'tpope/vim-ragtag' " endings for html, xml, etc. - enhances surround
Plug 'tpope/vim-repeat' " enables repeating other supported plugins with the . command

" testing tools
Plug 'ruanyl/coverage.vim' " code coverage
" Plug 'w0rp/ale' " asynchronous lint execution
Plug 'janko-m/vim-test' " running of unit tests

Plug 'neoclide/coc.nvim', { 'tag': '*', 'do': { -> coc#util#install() } }

" typescript
Plug 'HerringtonDarkholme/yats.vim', { 'for': [ 'typescript' ] }
" Plug 'Quramy/tsuquyomi', { 'for': [ 'typescript' ] }

" javascript
Plug 'pangloss/vim-javascript', { 'for': [ 'javascript', 'jsx' ] }
Plug 'ternjs/tern_for_vim', { 'for': ['javascript', 'jsx'], 'do': 'npm install' }
Plug 'othree/jspc.vim', { 'for': [ 'javascript', 'jsx' ] }
Plug 'othree/yajs.vim', { 'for': [ 'javascript', 'jsx' ] }
Plug 'moll/vim-node', { 'for': [ 'javascript' ] } " node support

" json
Plug 'neoclide/jsonc.vim'

" java
Plug 'artur-shaik/vim-javacomplete2', { 'for': [ 'java' ] }

" go
Plug 'fatih/vim-go', { 'for': [ 'go', 'golang' ] }

" graphql
Plug 'jparise/vim-graphql'

" terraform
Plug 'hashivim/vim-terraform'
Plug 'juliosueiras/vim-terraform-completion', { 'for': [ 'tf', 'terraform' ] }

call plug#end()
