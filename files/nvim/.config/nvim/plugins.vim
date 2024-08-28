call plug#begin('~/.config/nvim/plugged')

" Color schemes {{{
Plug 'jacoborus/tender.vim'
Plug 'gruvbox-community/gruvbox'
" }}}

" Workspace {{{
Plug 'scrooloose/nerdtree' | Plug 'Xuyuanp/nerdtree-git-plugin' | Plug 'ryanoasis/vim-devicons' " file drawer
"Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim' " fuzzy file finder and so much more
Plug 'junegunn/fzf.vim' " fuzzy file finder and so much more
Plug 'junegunn/fzf' " fuzzy file finder and so much more
Plug 'yuki-yano/fzf-preview.vim', { 'do': ':FzfPreviewInstall' }
Plug 'vim-airline/vim-airline' " fancy statusline
Plug 'vim-airline/vim-airline-themes' " themes for vim-airline
Plug 'tpope/vim-projectionist' " projectionist project config
Plug 'simeji/winresizer' " resize windows with h,j,k,l
Plug 'roman/golden-ratio' " resize windows to the gold ratio
Plug 'majutsushi/tagbar' " browse tags
Plug 'jlanzarotta/bufexplorer' " buffer explorer and management
" }}}

" Productivity {{{
Plug 'vimwiki/vimwiki', { 'branch': 'dev' } " personal wiki
Plug 'diepm/vim-rest-console' " http client
"Plug 'github/copilot.vim', { 'branch': 'release' } " github copilot
" }}}

" Git {{{
Plug 'tpope/vim-fugitive' " amazing git wrapper for vim
Plug 'tpope/vim-rhubarb' " enabled GBrowse
" with vim-rhubarb to enable additional features, run: echo 'machine api.github.com login <user> password <token>' >> ~/.netrc
Plug 'samoshkin/vim-mergetool'
Plug 'shumphrey/fugitive-gitlab.vim'
" }}}

" Utilities {{{
Plug 'Shougo/denite.nvim'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'Raimondi/delimitMate' " automatic closing of quotes, parenthesis, brackets, etc.
Plug 'honza/vim-snippets'
Plug 'moll/vim-bbye' " delete buffers without closing windows
Plug 'kana/vim-textobj-user' " create own test segments. required for Julian/vim-textobj-var.....
Plug 'Julian/vim-textobj-variable-segment', { 'branch': 'main' } " segments for camelCase, sanke-case etc
Plug 'AndrewRadev/splitjoin.vim' " split join blocks of code
Plug 'tpope/vim-eunuch' " unix commands in vim
Plug 'voldikss/vim-floaterm'

Plug 'mileszs/ack.vim' " search inside files using ack. Same as command line ack utility, but use :Ack
Plug 'benmills/vimux' " tmux integration for vim
Plug 'tpope/vim-unimpaired' " mappings which are simply short normal mode aliases for commonly used ex commands
Plug 'tpope/vim-commentary' " comment stuff out
Plug 'tpope/vim-surround' " mappings to easily delete, change and add such surroundings in pairs, such as quotes, parens, etc.
Plug 'tpope/vim-dispatch' " asynchronous build and test dispatcher
Plug 'tpope/vim-ragtag' " endings for html, xml, etc. - enhances surround
Plug 'tpope/vim-repeat' " enables repeating other supported plugins with the . command
Plug 'tommcdo/vim-exchange' " text exchange operation
Plug 'alvan/vim-closetag' " auto close html tags
" }}}

" Testing tools {{{
Plug 'ruanyl/coverage.vim' " code coverage
Plug 'janko-m/vim-test' " running of unit tests
" }}}

" Language {{{
Plug 'theHamsta/nvim-dap-virtual-text'
Plug 'rcarriga/nvim-dap-ui' " ui for dap
Plug 'nvim-neotest/nvim-nio'
Plug 'mfussenegger/nvim-dap'
Plug 'leoluz/nvim-dap-go' " delve debugging for golang
Plug 'neoclide/coc.nvim', { 'branch': 'master', 'do': { -> coc#util#install() } }
Plug 'plasticboy/vim-markdown' " markdown
Plug 'HerringtonDarkholme/yats.vim', { 'for': [ 'typescript' ] } " typescript
Plug 'neoclide/jsonc.vim' " json
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' } " go
Plug 'towolf/vim-helm' " helm template
Plug 'mustache/vim-mustache-handlebars' " handlebars
Plug 'jparise/vim-graphql' " graphql
Plug 'pedrohdz/vim-yaml-folds' " folding for yaml files
Plug 'leafOfTree/vim-vue-plugin' " syntax and indent plugin for vue files
" Plug 'elixir-lsp/coc-elixir', {'do': 'yarn install && yarn prepack'} " elixir
" Plug 'elixir-editors/vim-elixir', { 'for': [ 'elixir' ] }

" terraform
Plug 'hashivim/vim-terraform'
Plug 'juliosueiras/vim-terraform-completion', { 'for': [ 'tf', 'terraform' ] }

" }}}

call plug#end()
" vim:fdm=marker
