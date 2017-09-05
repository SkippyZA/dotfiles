#!/usr/bin/env bash

echo -e "Install Skippy's dotfiles"
echo -e "-------------------------"

read -r -p "Install brew packages? [y/N] " response
case "$response" in
    [yY][eE][sS]|[yY]) 
        source install/brew.sh
        ;;
    *)
        ;;
esac

source install/python.sh
source install/link.sh
source install/zsh.sh
source install/fonts.sh

echo -e "\nComplete"
