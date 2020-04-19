.DEFAULT_GOAL := help

DOTFILES=${HOME}/.dotfiles
TMUX_SHARE=${HOME}/.local/share/tmux

all: brew neovim vim fzf-marks symlinks bat tmux

## brew: Install brew dependencies
brew:
	@brew bundle --file="$(DOTFILES)/extra/homebrew/Brewfile"

## symlinks: Use stow to link all files in 'files' to your home directory
symlinks:
	@if [ ! -d ~/.oh-my-zsh ]; then git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh &>/dev/null; fi
	@if [ ! -f ~/.oh-my-zsh/themes/skippy.zsh-theme ]; then ln -s ~/.dotfiles/extra/zsh/skippy.zsh-theme ~/.oh-my-zsh/themes/skippy.zsh-theme &>/dev/null; fi
	@stow -v --stow --ignore ".DS_Store" --target="$(HOME)" --dir="$(DOTFILES)/files" bat
	@stow -v --stow --ignore ".DS_Store" --target="$(HOME)" --dir="$(DOTFILES)/files" --dotfiles git
	@stow -v --stow --ignore ".DS_Store" --target="$(HOME)" --dir="$(DOTFILES)/files" kitty
	@stow -v --stow --ignore ".DS_Store" --target="$(HOME)" --dir="$(DOTFILES)/files" nvim
	@stow -v --stow --ignore ".DS_Store" --target="$(HOME)" --dir="$(DOTFILES)/files" other
	@stow -v --stow --ignore ".DS_Store" --target="$(HOME)" --dir="$(DOTFILES)/files" tmux
	@stow -v --stow --ignore ".DS_Store" --target="$(HOME)" --dir="$(DOTFILES)/files" zsh

unstow:
	@stow -v --delete --dotfiles --ignore ".DS_Store" --target="$(HOME)" --dir="$(DOTFILES)" files


## tmux: Setup tpm and run a new tmux server
tmux:
	@if [ ! -d "$(TMUX_SHARE)/plugins/tpm" ]; then git clone https://github.com/tmux-plugins/tpm "$(TMUX_SHARE)/plugins/tpm"; fi
	@-tmux kill-server
	@tmux start-server
	@tmux new-session -d 
	${TMUX_SHARE}/plugins/tpm/scripts/install_plugins.sh
	@tmux kill-server

## neovim: Install neovim with plugings
neovim:
	@python3 -m pip install --upgrade pynvim
	@nvim +PlugInstall +qall

## vim: Link neovim files for use with vim
vim:
	@ln -sf ${DOTFILES}/files/.config/nvim ${HOME}/.vim
	@ln -sf ${DOTFILES}/files/.config/nvim/init.vim ${HOME}/.vimrc

## bat: Rebuild 'bat' cache
bat:
	bat cache --build

## fzf-marks: List marks
fzf-marks:
	if [ ! -d ~/fzf-marks ]; then git clone https://github.com/urbainvaes/fzf-marks.git ${HOME}/fzf-marks; fi

## :
## help: Print out available make targets.
help: Makefile
	@echo
	@echo " Choose a command run:"
	@echo
	@sed -n 's/^##//p' $< | column -t -s ':' |  sed -e 's/^/ /'
	@echo

.PHONY: all brew symlinks tmux neovim vim fzf-marks help
