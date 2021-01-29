.DEFAULT_GOAL := help

DOTFILES=${HOME}/.dotfiles
TMUX_SHARE=${HOME}/.local/share/tmux

all: brew fonts neovim fzf-marks ohmyzsh symlinks bat tmux

## install: Install all targets
install: all


## brew: Install brew dependencies
brew:
	@brew update
	@brew bundle --file="$(DOTFILES)/homebrew/Brewfile"
	@brew link --force helm@2


## ohmyzsh: Install Oh-My-Zsh if it is not already installed
ohmyzsh:
	@if [ ! -d ~/.oh-my-zsh ]; then git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh &>/dev/null; fi


## symlinks: Use stow to link all files in 'files' to your home directory
symlinks:
	@stow -v --stow --ignore ".DS_Store" --target="$(HOME)" --dir="$(DOTFILES)/files" alacritty
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
	@python3 -m pip install --upgrade awscli-local
	@python3 -m pip install --upgrade vimwiki-markdown
	@nvim +PlugInstall +qall

## bat: Rebuild 'bat' cache
bat:
	bat cache --build

## fzf-marks: List marks
fzf-marks:
	if [ ! -d ~/fzf-marks ]; then git clone https://github.com/urbainvaes/fzf-marks.git ${HOME}/fzf-marks; fi


## ruby: Install the latest version of ruby using RVM
ruby: brew-update
	@gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
	@curl -sSL https://get.rvm.io | bash -s stable --ruby
	@gem install neovim


## node: Install the latest lts
node:
	@curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
	@nvm install --lts
	@npm i -g yarn neovim


## fonts: Install the patched Nerd fonts (Sauce Code Pro)
fonts:
	@curl -s -o "${HOME}/Library/Fonts/Sauce Code Pro Black Nerd Font Complete Mono.ttf" "https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/patched-fonts/SourceCodePro/Black/complete/Sauce%20Code%20Pro%20Black%20Nerd%20Font%20Complete%20Mono.ttf"
	@curl -s -o "${HOME}/Library/Fonts/Sauce Code Pro Black Italic Nerd Font Complete Mono.ttf" "https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/patched-fonts/SourceCodePro/Black-Italic/complete/Sauce%20Code%20Pro%20Black%20Italic%20Nerd%20Font%20Complete%20Mono.ttf"
	@curl -s -o "${HOME}/Library/Fonts/Sauce Code Pro Bold Nerd Font Complete Mono.ttf" "https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/patched-fonts/SourceCodePro/Bold/complete/Sauce%20Code%20Pro%20Bold%20Nerd%20Font%20Complete%20Mono.ttf"
	@curl -s -o "${HOME}/Library/Fonts/Sauce Code Pro Bold Italic Nerd Font Complete Mono.ttf" "https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/patched-fonts/SourceCodePro/Bold-Italic/complete/Sauce%20Code%20Pro%20Bold%20Italic%20Nerd%20Font%20Complete%20Mono.ttf"
	@curl -s -o "${HOME}/Library/Fonts/Sauce Code Pro ExtraLight Nerd Font Complete Mono.ttf" "https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/patched-fonts/SourceCodePro/Extra-Light/complete/Sauce%20Code%20Pro%20ExtraLight%20Nerd%20Font%20Complete%20Mono.ttf"
	@curl -s -o "${HOME}/Library/Fonts/Sauce Code Pro ExtraLight Italic Nerd Font Complete Mono.ttf" "https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/patched-fonts/SourceCodePro/ExtraLight-Italic/complete/Sauce%20Code%20Pro%20ExtraLight%20Italic%20Nerd%20Font%20Complete%20Mono.ttf"
	@curl -s -o "${HOME}/Library/Fonts/Sauce Code Pro Italic Nerd Font Complete Mono.ttf" "https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/patched-fonts/SourceCodePro/Italic/complete/Sauce%20Code%20Pro%20Italic%20Nerd%20Font%20Complete%20Mono.ttf"
	@curl -s -o "${HOME}/Library/Fonts/Sauce Code Pro Light Nerd Font Complete Mono.ttf" "https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/patched-fonts/SourceCodePro/Light/complete/Sauce%20Code%20Pro%20Light%20Nerd%20Font%20Complete%20Mono.ttf"
	@curl -s -o "${HOME}/Library/Fonts/Sauce Code Pro Light Italic Nerd Font Complete Mono.ttf" "https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/patched-fonts/SourceCodePro/Light-Italic/complete/Sauce%20Code%20Pro%20Light%20Italic%20Nerd%20Font%20Complete%20Mono.ttf"
	@curl -s -o "${HOME}/Library/Fonts/Sauce Code Pro Medium Nerd Font Complete Mono.ttf" "https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/patched-fonts/SourceCodePro/Medium/complete/Sauce%20Code%20Pro%20Medium%20Nerd%20Font%20Complete%20Mono.ttf"
	@curl -s -o "${HOME}/Library/Fonts/Sauce Code Pro Medium Italic Nerd Font Complete Mono.ttf" "https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/patched-fonts/SourceCodePro/Medium-Italic/complete/Sauce%20Code%20Pro%20Medium%20Italic%20Nerd%20Font%20Complete%20Mono.ttf"
	@curl -s -o "${HOME}/Library/Fonts/Sauce Code Pro Regular Nerd Font Complete Mono.ttf" "https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/patched-fonts/SourceCodePro/Regular/complete/Sauce%20Code%20Pro%20Nerd%20Font%20Complete%20Mono.ttf"
	@curl -s -o "${HOME}/Library/Fonts/Sauce Code Pro Semibold Nerd Font Complete Mono.ttf" "https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/patched-fonts/SourceCodePro/Semibold/complete/Sauce%20Code%20Pro%20Semibold%20Nerd%20Font%20Complete%20Mono.ttf"
	@curl -s -o "${HOME}/Library/Fonts/Sauce Code Pro Semibold Italic Nerd Font Complete Mono.ttf" "https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/patched-fonts/SourceCodePro/Semibold-Italic/complete/Sauce%20Code%20Pro%20Semibold%20Italic%20Nerd%20Font%20Complete%20Mono.ttf"


brew-update:
	@brew update


## :
## help: Print out available make targets.
help: Makefile
	@echo
	@echo " Choose a command run:"
	@echo
	@sed -n 's/^##//p' $< | column -t -s ':' |  sed -e 's/^/ /'
	@echo

.PHONY: all brew symlinks tmux neovim vim fzf-marks help
