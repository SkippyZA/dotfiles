#!/usr/bin/env bash

DOTFILES=$HOME/.dotfiles

echo -e "\nCreating symlinks"
echo "=============================="
linkables=$( find -H "$DOTFILES" -maxdepth 3 -name '*.symlink' )
for file in $linkables ; do
    target="$HOME/.$( basename $file '.symlink' )"
    if [ -e $target ]; then
        echo "~${target#$HOME} already exists... Skipping."
    else
        echo "Creating symlink for $file"
        ln -s $file $target
    fi
done

echo -e "\n\ninstalling to ~/.config"
echo "=============================="
if [ ! -d $HOME/.config ]; then
    echo "Creating ~/.config"
    mkdir -p $HOME/.config
fi
for config in $DOTFILES/config/*; do
    target=$HOME/.config/$( basename $config )
    if [ -e $target ]; then
        echo "~${target#$HOME} already exists... Skipping."
    else
        echo "Creating symlink for $config"
        ln -s $config $target
    fi
done


echo -e "\n\nCreating vim symlinks"
echo "=============================="
VIMFILES=( "$HOME/.vim:$DOTFILES/vim/.vim"
        "$HOME/.vimrc:$DOTFILES/vim/.vimrc" )

for file in "${VIMFILES[@]}" ; do
    KEY=${file%%:*}
    VALUE=${file#*:}

    if [ -e ${KEY} ] || [ -L ${KEY} ]; then
        echo "${KEY} already exists... skipping"
    else
        echo "Creating symlink for $KEY"
        ln -s ${VALUE} ${KEY}
    fi
done


echo -e "\n\nInstalling terminfo files"
echo "=============================="
if [ -e $HOME/.terminfo ]; then
  echo "~/.terminfo already exists... Skipping."
else
  echo "Creating symlink for ~/.terminfo"
  ln -s $DOTFILES/resources $HOME/.terminfo

  for file in $DOTFILES/resources/*.terminfo; do
    echo "Installing $file"
    tic $file
  done
fi
