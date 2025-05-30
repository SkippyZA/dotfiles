# Profile startup of zsh. Also needs "zprof" at the end of this file
# zmodload zsh/zprof

source ~/.zshrc.local

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="$PATH:$HOME/.nvm/versions/node/v16.15.0/bin"
export PATH="/usr/local/opt/libpq/bin:$PATH"

listening() {
  if [ $# -eq 0 ]; then
    sudo lsof -iTCP -sTCP:LISTEN -n -P
  elif [ $# -eq 1 ]; then
    sudo lsof -iTCP -sTCP:LISTEN -n -P | grep -i --color $1
  else
    echo "Usage: listening [pattern]"
  fi
}

# Load NVM
export NVM_DIR="$HOME/.nvm"
[[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh" --no-use

export PATH="$HOME/.tmuxifier/bin:$PATH"
eval "$(tmuxifier init -)"

# zprof
