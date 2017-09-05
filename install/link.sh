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


VIMFILES=( "$HOME/.vim:$DOTFILES/vim/.vim"
        "$HOME/.vimrc:$DOTFILES/vim/.vimrc" )

for file in "${VIMFILES[@]}" ; do
    KEY=${file%%:*}
    VALUE=${file#*:}

    printf "  ~${KEY#$HOME} "
    if [ -e ${KEY} ] || [ -L ${KEY} ]; then
      echo "exists"
    else
      ln -s ${VALUE} ${KEY} &>/dev/null
      echo "done"
    fi
done


if [ -e $HOME/.terminfo ]; then
  echo "  ~/.terminfo exists"
else
  printf "  ~/.terminfo "
  ln -s $DOTFILES/resources $HOME/.terminfo &>/dev/null
  echo "done"

  for file in $DOTFILES/resources/*.terminfo; do
    printf "  ~${file#$HOME} "
    tic $file &>/dev/null
    echo "done"
  done
fi
