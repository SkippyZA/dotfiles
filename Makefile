.DEFAULT_GOAL := help

DOTFILES=${HOME}/.dotfiles
TMUX_SHARE=${HOME}/.local/share/tmux

all: brew neovim fzf-marks ohmyzsh symlinks bat tmux

## install: Install all targets
install: all


## brew: Install brew dependencies
brew:
	@brew bundle --file="$(DOTFILES)/homebrew/Brewfile"


## ohmyzsh: Install Oh-My-Zsh if it is not already installed
ohmyzsh:
	@if [ ! -d ~/.oh-my-zsh ]; then git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh &>/dev/null; fi


## symlinks: Use stow to link all files in 'files' to your home directory
symlinks:
	@stow -v --stow --ignore ".DS_Store" --target="$(HOME)" --dir="$(DOTFILES)/files" bat
	@stow -v --stow --ignore ".DS_Store" --target="$(HOME)" --dir="$(DOTFILES)/files" --dotfiles git
	@stow -v --stow --ignore ".DS_Store" --target="$(HOME)" --dir="$(DOTFILES)/files" kitty
	@stow -v --stow --ignore ".DS_Store" --target="$(HOME)" --dir="$(DOTFILES)/files" nvim
	@stow -v --stow --ignore ".DS_Store" --target="$(HOME)" --dir="$(DOTFILES)/files" other
	@stow -v --stow --ignore ".DS_Store" --target="$(HOME)" --dir="$(DOTFILES)/files" tmux
	@stow -v --stow --ignore ".DS_Store" --target="$(HOME)" --dir="$(DOTFILES)/files" tmuxinator
	@stow -v --stow --ignore ".DS_Store" --target="$(HOME)" --dir="$(DOTFILES)/files" zsh


## tmux: Setup tpm and run a new tmux server
tmux:
	@if [ ! -d "$(TMUX_SHARE)/plugins/tpm" ]; then git clone https://github.com/tmux-plugins/tpm "$(TMUX_SHARE)/plugins/tpm"; fi
	@-tmux kill-server
	@tmux start-server
	@tmux new-session -d
	${TMUX_SHARE}/plugins/tpm/scripts/install_plugins.sh
	@tmux kill-server

## neovim: Install neovim with plugins
neovim:
	@python3 -m pip install --upgrade pynvim
	@python3 -m pip install --upgrade neovim-remote
	@nvim +PlugInstall +qall

## bat: Rebuild 'bat' cache
bat:
	bat cache --build

## fzf-marks: List marks
fzf-marks:
	if [ ! -d ~/fzf-marks ]; then git clone https://github.com/urbainvaes/fzf-marks.git ${HOME}/fzf-marks; fi


## ruby: Install the latest version of ruby using RVM
ruby:
	@gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
	@curl -sSL https://get.rvm.io | bash -s stable --ruby


## :
## help: Print out available make targets.
help: Makefile
	@echo
	@echo " Choose a command run:"
	@echo
	@sed -n 's/^##//p' $< | column -t -s ':' |  sed -e 's/^/ /'
	@echo

.PHONY: all brew symlinks tmux neovim vim fzf-marks help
