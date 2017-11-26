#!/usr/bin/env bash

DOTFILES=$HOME/.dotfiles

echo -e "\nCreating symlinks:"

linkables=$( find -H "$DOTFILES" -maxdepth 3 -name '*.symlink' )
for file in $linkables ; do
    printf "  ~${target#$HOME} "

    target="$HOME/.$( basename $file '.symlink' )"
    if [ -e $target ]; then
      echo "exists"
    else
        ln -s $file $target &>/dev/null
        echo "done"
    fi
done

if [ ! -d $HOME/.config ]; then
    echo "  Creating ~/.config"
    mkdir -p $HOME/.config
fi
for config in $DOTFILES/config/*; do
    printf "  ~${target#$HOME} "
    target=$HOME/.config/$( basename $config )
    if [ -e $target ]; then
      echo "exists"
    else
        ln -s $config $target &>/dev/null
        echo "done"
    fi
done

