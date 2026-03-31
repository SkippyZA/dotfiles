# Profile startup of zsh. Also needs "zprof" at the end of this file
# zmodload zsh/zprof
# zprof

source ~/.zshrc.local

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="$PATH:$HOME/.nvm/versions/node/v16.15.0/bin"
export PATH="/usr/local/opt/libpq/bin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"

listening() {
  if [ $# -eq 0 ]; then
    sudo lsof -iTCP -sTCP:LISTEN -n -P +c 0
  elif [ $# -eq 1 ]; then
    sudo lsof -iTCP -sTCP:LISTEN -n -P +c 0 | grep -i --color $1
  else
    echo "Usage: listening [pattern]"
  fi
}


eval "$(fnm env --use-on-cd --shell zsh)"


export PATH="/usr/local/bin:$PATH"
