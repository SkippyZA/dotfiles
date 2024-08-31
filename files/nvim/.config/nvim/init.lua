vim.g.mapleader = ","
vim.g.maplocalleader = "\\"

vim.opt.clipboard="unnamed"

vim.opt.compatible=false             -- not compatible with vi
vim.opt.autoread=true                -- detect when a file is changed
vim.opt.autowrite=true               -- save a file when calling :make

vim.opt.history=1000                 -- change history to 1000
vim.opt.textwidth=120
vim.opt.encoding="UTF-8"
vim.opt.updatetime=300
vim.opt.ttyfast=true                 -- faster redrawing

vim.opt.number=true                  -- show line numbers
vim.opt.relativenumber=true          -- show relative line numbers
vim.opt.cursorline=true              -- highlight the current line
vim.opt.signcolumn="yes"

vim.opt.showmode=false               -- don't show which mode disabled for PowerLine
vim.opt.scrolloff=5                  -- lines of text around cursor

vim.opt.title=true                   -- set terminal title
vim.opt.hidden=true                  -- current buffer can be put into background

-- Tab control
vim.opt.expandtab=true               -- on pressing tab, insert spaces
vim.opt.smarttab=true                -- tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
vim.opt.tabstop=2                    -- the visible width of tabs
vim.opt.softtabstop=2                -- edit as if the tabs are 2 characters wide
vim.opt.shiftwidth=2                 -- number of spaces to use for indent and unindent
vim.opt.shiftround=true              -- round indent to a multiple of 'shiftwidth'

-- status
vim.opt.laststatus=2
vim.opt.cmdheight=2                  -- command bar height

-- Searching
vim.opt.ignorecase=true              -- case insensitive searching
vim.opt.smartcase=true               -- case-sensitive if expresson contains a capital letter
vim.opt.hlsearch=true                -- highlight search results
vim.opt.incsearch=true               -- set incremental search, like modern browsers
vim.opt.lazyredraw=true              -- don't redraw while executing macros
vim.opt.magic=true                   -- Set magic on, for regex
vim.opt.showmatch=true               -- show matching braces
vim.opt.mat=2                        -- how many tenths of a second to blink

-- Folding
vim.opt.foldmethod = "expr"                     -- treesiter time
vim.opt.foldexpr = "nvim_treesitter#foldexpr()" -- treesiter
vim.opt.foldtext = ''

require("config.lazy")
require("config.window")
require("config.keymap")

-- Fix common typos
vim.cmd("command! -bang -nargs=* -complete=file E e<bang> <args>")
vim.cmd("command! -bang -nargs=* -complete=file W w<bang> <args>")
vim.cmd("command! -bang -nargs=* -complete=file Wq wq<bang> <args>")
vim.cmd("command! -bang -nargs=* -complete=file WQ wq<bang> <args>")
vim.cmd("command! -bang Wa wa<bang>")
vim.cmd("command! -bang WA wa<bang>")
vim.cmd("command! -bang Q q<bang>")
vim.cmd("command! -bang QA qa<bang>")
vim.cmd("command! -bang Qa qa<bang>")
