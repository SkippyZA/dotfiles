# System Dotfiles

These are my dotfiles. The repository is a copy of Jaco Nel's repository (found [here](https://github.com/jaconel/dotfiles)), but tweaked to my preference. Don't do as I did, if you want to make this your own, just give me a fork.

## Requirements

Requires that git, vim, wget and zsh is pre-installed on the server.

## Install

Run this:

```sh
git clone git@github.com:SkippyZA/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./install
```

This will symlink the appropriate files in `.dotfiles` to your home directory.
Everything is configured and tweaked within `~/.dotfiles`.

## Topical

Everything's built around topic areas. If you're adding a new area to your
forked dotfiles — say, "Java" — you can simply add a `java` directory and put
files in there. Anything with an extension of `.zsh` will get automatically
included into your shell. Anything with an extension of `.symlink` will get
symlinked without extension into `$HOME` when you run `./install`.

## Components

There's a few special files in the hierarchy.

- **bin/**: Anything in `bin/` will get added to your `$PATH` and be made
  available everywhere.
- **topic/\*.zsh**: Any files ending in `.zsh` get loaded into your
  environment.
- **topic/path.zsh**: Any file named `path.zsh` is loaded first and is
  expected to setup `$PATH` or similar.
- **topic/\*.symlink**: Any files ending in `*.symlink` get symlinked into
  your `$HOME`. This is so you can keep all of those versioned in your dotfiles
  but still keep those autoloaded files in your home directory. These get
  symlinked in when you run `./install`.
