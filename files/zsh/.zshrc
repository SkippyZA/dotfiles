# zmodload zsh/zprof # profile zsh startup
source ~/.zshrc.local

# add default node version to path
export PATH="$PATH:$HOME/.nvm/versions/node/v10.16.3/bin"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

## zprof # profile zsh startup
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$PATH:$HOME/bin"

export GOPATH="$HOME/Development/golang"
export PATH="$PATH:$GOPATH/bin"
#export GO111MODULE="on"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/skippy/.sdkman"
[[ -s "/Users/skippy/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/skippy/.sdkman/bin/sdkman-init.sh"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
