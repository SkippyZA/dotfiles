#!/bin/sh

if test ! $(which brew); then
    echo "Installing homebrew"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo -e "\n\nInstalling homebrew packages..."
echo "=============================="

# cli tools
brew install ack
brew install tree
brew install wget
brew install htop
brew install axel

# python
brew install python
brew install python3

# development tools
brew install git
brew install hub
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
Brew install zsh-completions

# install neovim
brew install neovim/neovim/neovim

# install neomutt
brew install neomutt/homebrew-neomutt/neomutt
brew install elinks

exit 0
