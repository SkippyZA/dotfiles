vim.g.mapleader = ","
vim.g.maplocalleader = "\\"

require("config.window")
require("config.lazy")

local api = vim.api
local home = vim.env.HOME

vim.opt.compatible=false      -- not compatible with vi
vim.opt.autoread=true         -- detect when a file is changed
vim.opt.autowrite=true        -- save a file when calling :make

vim.opt.history=1000          -- change history to 1000
vim.opt.textwidth=120

vim.opt.updatetime=300

vim.opt.encoding="UTF-8"

vim.opt.ignorecase=true       -- case insensitive searching
vim.opt.smartcase=true        -- case-sensitive if expresson contains a capital letter
vim.opt.hlsearch=true         -- highlight search results
vim.opt.incsearch=true        -- set incremental search, like modern browsers
vim.opt.lazyredraw=false      -- don't redraw while executing macros
vim.opt.magic=true            -- Set magic on, for regex
vim.opt.showmatch=true        -- show matching braces
vim.opt.mat=2                 -- how many tenths of a second to blink

vim.opt.ttyfast=true          -- faster redrawing

vim.opt.number=true                  -- show line numbers
vim.opt.relativenumber=true          -- show relative line numbers
-- vim.opt.signcolumn="yes"


vim.opt.cursorline=true              -- highlight the current line
vim.opt.ttyfast=true                 -- faster redrawing

--
-- vim.opt.ignorecase = true                       -- search case
-- vim.opt.smartcase = true                        -- search matters if capital letter
-- vim.opt.inccommand = "split"                    -- "for incsearch while sub
-- vim.opt.lazyredraw = true                       -- redraw for macros
-- vim.opt.number = true                           -- line number on
-- vim.opt.relativenumber = true                   -- relative line number on
-- vim.opt.undofile = true                         -- undo even when it closes
-- vim.opt.foldmethod = "expr"                     -- treesiter time
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()" -- treesiter
-- vim.opt.foldtext = ''
-- vim.opt.scrolloff = 8                           -- number of lines to always go down
-- vim.opt.signcolumn = "number"
-- vim.opt.colorcolumn = "99999"                   -- fix columns
-- vim.opt.mouse = "a"                             -- set mouse to be on
-- vim.opt.shortmess:append("c")                   -- no ins-completion messages
-- -- vim.opt.cmdheight = 0                           -- status line smaller
-- vim.opt.laststatus = 3
-- vim.opt.breakindent = true                      -- break indentation for long lines
-- vim.opt.breakindentopt = {shift = 2}
-- vim.opt.showbreak = "↳"                         -- character for line break
-- vim.opt.splitbelow = true                       -- split windows below
-- vim.opt.splitright = true                       -- split windows right
-- vim.opt.wildmode = "list:longest,list:full"     -- for : stuff
-- vim.opt.wildignore:append({".javac", "node_modules", "*.pyc"})
-- vim.opt.wildignore:append({".aux", ".out", ".toc"}) -- LaTeX
-- vim.opt.wildignore:append({
--     ".o", ".obj", ".dll", ".exe", ".so", ".a", ".lib", ".pyc", ".pyo", ".pyd",
--     ".swp", ".swo", ".class", ".DS_Store", ".git", ".hg", ".orig"
-- })
-- vim.opt.suffixesadd:append({".java", ".rs"})    -- search for suffexes using gf
-- vim.opt.diffopt:append("linematch:50")
-- vim.opt.cursorline = true
-- vim.opt.cursorlineopt = "number"
-- vim.opt.showmode = false
-- vim.opt.virtualedit = "all"
-- -- vim.opt.shell = "/opt/homebrew/bin/fish"
-- api.nvim_create_user_command("FixWhitespace", [[%s/\s\+$//e]], {})
