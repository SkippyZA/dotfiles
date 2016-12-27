#!/usr/bin/env bash

source install/common.sh

info "Installing dotfiles"

source install/link.sh

if [ "$(uname)" == "Darwin" ]; then
    info "Running on OSX"

#    source install/brew.sh
fi

source install/zsh.sh

info "Creating vim directories"
mkdir -p ~/.vim-tmp

info "Done."
