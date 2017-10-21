call plug#begin('~/.config/nvim/plugged')

" colorschemes
Plug 'dracula/vim'
Plug 'tomasiser/vim-code-dark'
Plug 'croaker/mustang-vim'

" workspace
Plug 'scrooloose/nerdtree' | Plug 'Xuyuanp/nerdtree-git-plugin' | Plug 'ryanoasis/vim-devicons' " file drawer
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim' " fuzzy file finder and so much more
Plug 'vim-airline/vim-airline' " fancy statusline
Plug 'vim-airline/vim-airline-themes' " themes for vim-airline
Plug 'thaerkh/vim-workspace'

" utilities
Plug 'mileszs/ack.vim' " search inside files using ack. Same as command line ack utility, but use :Ack
Plug 'benmills/vimux' " tmux integration for vim
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer' } " auto complete
Plug 'vimwiki/vimwiki' " personal wiki
Plug 'Raimondi/delimitMate' " automatic closing of quotes, parenthesis, brackets, etc.
Plug 'tpope/vim-unimpaired' " mappings which are simply short normal mode aliases for commonly used ex commands
Plug 'tpope/vim-commentary' " comment stuff out
Plug 'tpope/vim-surround' " mappings to easily delete, change and add such surroundings in pairs, such as quotes, parens, etc.
Plug 'tpope/vim-dispatch' " asynchronous build and test dispatcher
Plug 'tpope/vim-repeat' " enables repeating other supported plugins with the . command
Plug 'tpope/vim-fugitive' " amazing git wrapper for vim
Plug 'tpope/vim-rhubarb' " GitHub extension for vim-fugitive

" testing tools
Plug 'ruanyl/coverage.vim' " code coverage
Plug 'w0rp/ale' " asynchronous lint execution
Plug 'janko-m/vim-test' " running of unit tests

" html / templates
Plug 'othree/html5.vim', { 'for': [ 'html', 'vue' ] } " html5 support
Plug 'mattn/emmet-vim', { 'for': [ 'html', 'vue' ] } " emmet support for vim - easily create markdup wth CSS-like syntax
Plug 'gregsexton/MatchTag', { 'for': [ 'html', 'vue' ] } " match tags in html, similar to paren support
Plug 'alvan/vim-closetag', { 'for': [ 'html', 'vue' ] } " auto close html tags

" JavaScript
Plug 'pangloss/vim-javascript', { 'for': [ 'javascript', 'jsx' ] }
Plug 'ternjs/tern_for_vim', { 'for': ['jsx', 'javascript'], 'do': 'npm install' }
Plug 'othree/jspc.vim', { 'for': [ 'javascript' ] }
Plug 'othree/javascript-libraries-syntax.vim', { 'for': [ 'javascript' ] }
Plug 'jelera/vim-javascript-syntax', { 'for': 'javascript' } " enhanced javascript syntax for vim
Plug 'moll/vim-node', { 'for': 'javascript' } " node support

" styles
Plug 'ap/vim-css-color', { 'for': ['css','stylus','scss'] } " set the background of hex color values to the color
Plug 'posva/vim-vue', { 'for': ['vue', 'javascript'] } " vue syntax highlighting

" markdown
Plug 'tpope/vim-markdown', { 'for': 'markdown' } " markdown support

" language-specific plugins
Plug 'elzr/vim-json', { 'for': 'json' } " JSON support

call plug#end()


" Plug 'editorconfig/editorconfig-vim' " .editorconfig support
" Plug 'tpope/vim-sleuth' " detect indent style (tabs vs. spaces)
" Plug 'sickill/vim-pasta' " context-aware pasting
" Plug 'tpope/vim-ragtag' " endings for html, xml, etc. - enhances surround
" Plug 'garbas/vim-snipmate' " snippet manager
" Plug 'MarcWeber/vim-addon-mw-utils' " interpret a file by function and cache file automatically
" Plug 'tomtom/tlib_vim' " utility functions for vim
" Plug 'ervandew/supertab' " Perform all your vim insert mode completions with Tab
" Plug 'tpope/vim-vinegar'
" Plug 'vim-scripts/matchit.zip' " extended % matching
" Plug 'sotte/presenting.vim', { 'for': 'markdown' } " a simple tool for presenting slides in vim based on text files
" Plug 'benekastah/neomake' " neovim replacement for syntastic using neovim's job control functonality

" Plug 'mustache/vim-mustache-handlebars' " mustach support
" Plug 'juvenn/mustache.vim', { 'for': 'mustache' } " mustache support

" Plug 'gavocanov/vim-js-indent', { 'for': 'javascript' } " JavaScript indent support
" Plug 'mxw/vim-jsx', { 'for': ['jsx', 'javascript'] } " JSX support
" Plug 'posva/vim-vue', { 'for': ['vue', 'javascript'] }

" Plug 'wavded/vim-stylus', { 'for': ['stylus', 'markdown'] } " markdown support
" Plug 'groenewege/vim-less', { 'for': 'less' } " less support
" Plug 'hail2u/vim-css3-syntax', { 'for': 'css' } " CSS3 syntax support
" Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' } " sass scss syntax support

" Plug 'Shougo/vimproc.vim', { 'do': 'make' } " interactive command execution in vim
