#!/bin/sh

echo -e "\nInstalling homebrew packages..."

if test ! $(which brew); then
  echo "Installing homebrew"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# cli tools
brew install ack
brew install tree
brew install wget
brew install htop
brew install axel
brew install task

# python
brew install python
brew install python3

# development tools
brew install cmake
brew install git
brew install hub # Run the following to have vim-fugitive work with GitHub: echo 'machine api.github.com login <user> password <token>' >> ~/.netrc
brew install fzf
brew install reattach-to-user-namespace
brew install tmux
brew install zsh
brew install highlight
brew install nvm
brew install z
brew install markdown
brew install diff-so-fancy
brew install zsh-syntax-highlighting
brew install zsh-autosuggestions
brew install zsh-completions
brew install vim
brew install httpie

# install neovim
brew install neovim/neovim/neovim
