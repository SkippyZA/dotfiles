# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Context

This is a personal Neovim config living inside a larger dotfiles repo at `~/.dotfiles`. It is symlinked
into place by GNU Stow (`~/.config/nvim` → `~/.dotfiles/files/nvim/.config/nvim`), so edits here are live
immediately — there is no install step for config changes. The parent repo's `Makefile` handles linking
(`make symlinks`), Homebrew, tmux, etc.

Git operations affect the whole dotfiles repo; commits from here will show paths like
`files/nvim/.config/nvim/...`.

## Commands

There is no build, test, or lint tooling — validation is done by running Neovim.

```sh
nvim --headless "+Lazy! sync" +qa      # install/update plugins headlessly, surfaces spec errors
nvim --headless "+Lazy! check" +qa     # verify plugin specs load
nvim --headless "+checkhealth" +qa     # health checks (also :checkhealth lazy / nvim-treesitter / mason)
nvim --headless "+lua require('config.init')" +qa   # syntax-check a specific module
```

Inside Neovim: `:Lazy` (plugin manager UI), `:Mason` (LSP/tool installer), `:TSUpdate` (parsers).

`lazy-lock.json` pins plugin commits and is committed — plugin updates should include the lockfile change.

## Architecture

`init.lua` sets vim options, then requires four modules **in this order** (order matters):

1. `config.init` — defines the global `_G.MyVim` namespace. Must run first because plugin specs reference
   `MyVim.*` at load time.
2. `config.lazy` — bootstraps lazy.nvim and `require("lazy").setup({ spec = { { import = "plugins" } } })`,
   which auto-imports every file in `lua/plugins/`. Also registers the custom `LazyFile` event
   (`BufReadPost`/`BufNewFile`/`BufWritePre`) that several plugin specs lazy-load on.
3. `config.window` — window/tab navigation, including the global `WinMove()` function bound to `<C-h/j/k/l>`
   (moves to a window, or splits and creates one if there is none in that direction).
4. `config.keymap` — general non-plugin keymaps.

`init.lua` also registers filetype overrides at the bottom: helm chart templates → `helm`, `*.k` → `kcl`,
`Tiltfile`/`*.tiltfile` → `starlark`.

### The `MyVim` global

`lua/config/init.lua` defines `_G.MyVim` as a small hand-rolled replacement for LazyVim's util module:
`MyVim.treesitter` (from `lua/utils/treesitter.lua`), `MyVim.cmp` helpers, and `MyVim.config` (icon tables
and `kind_filter`, consumed by e.g. `lualine`). Much of this config is adapted from LazyVim source, so new
code pasted from LazyVim will reference helpers that don't exist here.

**Known gaps:** `MyVim.error` is called in `lua/plugins/treesitter.lua` and `LazyVim.warn` in
`lua/plugins/lint.lua`, but neither is defined — those paths error if hit. Add the helper to
`config.init` rather than reintroducing LazyVim.

### Plugin conventions

- One file per concern in `lua/plugins/`, each returning a lazy.nvim spec table. Files returning `{}`
  (`golang.lua`, `sql.lua`) are deliberately-disabled configs kept as commented-out references.
- `change_detection` is disabled in `config/lazy.lua` — **restart Neovim after editing config**, it will not
  reload automatically. `checker` is on (silent update checks).
- Keymaps are split across `config/keymap.lua`, `config/window.lua`, and per-plugin `keys = {}` entries;
  when adding a plugin binding, prefer the plugin spec's `keys` so it stays lazy.
- Leader is `,` and localleader is `\`.

### LSP / formatting (read before touching `lua/plugins/lsp.lua`)

Servers are enabled by `mason-lspconfig`'s automatic enabling, not by explicit `vim.lsp.enable`/`setup`
calls. Note that `nvim-lspconfig`'s spec in this file declares `opts.servers` and `setup` tables copied
from LazyVim — **nothing consumes them here**, because the spec's own `config` function overrides lazy's
opts handling and only installs keymaps (`LspAttach` autocmd). Per-server settings (the detailed `gopls`
and `vtsls` blocks) are therefore currently inert; applying them requires porting the LazyVim plumbing or
calling `vim.lsp.config()` directly.

Tools are installed by `mason-tool-installer`'s `ensure_installed`, which mixes lspconfig server names
(`bashls`, `gopls`) with Mason package names (`eslint-lsp`, `prettier`) — both forms are accepted.

Format-on-save comes from **none-ls** (`BufWritePre` → `vim.lsp.buf.format`) with `goimports`/`gofumpt`
sources. `conform.nvim` is also configured for Go (`goimports-reviser`, `gofumpt`) but isn't wired as the
format entrypoint. If Go formatting misbehaves, these two are the overlapping candidates.

### Other notable choices

- Completion: `blink.cmp` (not nvim-cmp; `lua/plugins/cmp.lua.old` is the retired nvim-cmp config).
- Treesitter: pinned to the `main` branch with the new `TS.setup`/`TS.install` API — parsers install via the
  `tree-sitter` CLI (auto-installed through Mason by `utils/treesitter.lua`). Folding/indent via treesitter
  is written but commented out; `init.lua` uses `foldmethod=syntax` with folding disabled at startup.
- File tree is NERDTree (vimscript), not neo-tree/nvim-tree.
- `snacks.nvim` is loaded eagerly and used as a utility library (`Snacks.toggle`, `Snacks.util.color`) by
  `treesitter.lua` and `ui.lua`.
- Test running is `neotest` with the golang (via `gotestsum`) and jest adapters, under `<leader>t*`.
- Octo/rhubarb need a GitHub token in `~/.netrc` (see the comment in `lua/plugins/git.lua`).
