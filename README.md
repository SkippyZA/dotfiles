# Dotfiles for OSX

## Requirements

Requires the following to be pre-installed.
 * xcode cli tools
 * zsh

## Install

```sh
git clone git@github.com:SkippyZA/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./install.sh
```

This will symlink the appropriate files in `.dotfiles` to your home directory.
Everything is configured and tweaked within `~/.dotfiles`.

## Neovim

To get neovim pluggins installed, first node needs to be installed and active
as there are some plugins that require a `npm install` to be run on them to
work. (Use nvm to install node)

To install the plugins, run: `:PlugInstall` inside vim

## Switching to zsh shell

```bash
sudo dscl . -create /Users/$USER UserShell $(brew list zsh | grep bin/zsh$ | head -n 1)
```
