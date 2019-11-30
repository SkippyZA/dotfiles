# reload zsh config
alias reload!='source ~/.zshrc'

# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
    colorflag="--color"
else # OS X `ls`
    colorflag="-G"
fi

alias l="ls -lah ${colorflag}"
alias la="ls -AF ${colorflag}"
alias ll="ls -lFh ${colorflag}"
alias lld="ls -l | grep ^d"
alias rmf="rm -rf"

# gcalcli
alias gcal="gcalcli"
alias cal="gcal"
alias oldcal="\cal"
alias agenda="cal agenda"
alias week="cal calw 1 --width 20"
alias myagenda="agenda --calendar $DEFAULT_GOOGLE_CALENDAR"
alias myweek="week --calendar $DEFAULT_GOOGLE_CALENDAR"

# Helpers
alias grep='grep --color=auto'
alias df='df -h' # disk free, in Gigabytes, not bytes
alias du='du -h -c' # calculate disk usage for a folder

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"

# Flush Directory Service cache
alias flush="dscacheutil -flushcache"

# Trim new lines and copy to clipboard
alias trimcopy="tr -d '\n' | pbcopy"

# Recursively delete `.DS_Store` files
alias cleanup="find . -name '*.DS_Store' -type f -ls -delete"

# File size
alias fs="stat -f \"%z bytes\""

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# Stuff I never really use but cannot delete either because of http://xkcd.com/530/
alias stfu="osascript -e 'set volume output muted true'"
alias pumpitup="osascript -e 'set volume 10'"

# Kill all the tabs in Chrome to free up memory
# [C] explained: http://www.commandlinefu.com/commands/view/402/exclude-grep-from-your-grepped-output-of-ps-alias-included-in-description
alias chromekill="ps ux | grep '[C]hrome Helper --type=renderer' | grep -v extension-process | tr -s ' ' | cut -d ' ' -f2 | xargs kill"

alias k="kubectl"

alias av="aws-vault"

# ==============================================================
# Docker
# ==============================================================
# Start the docker-compose stack in the current directory
alias dcu="docker-compose up -d"

# Start the docker-compose stack in the current directory and rebuild the images
alias dcub="docker-compose up -d --build"

# Stop, delete (down) or restart the docker-compose stack in the current directory
alias dcs="docker-compose stop"
alias dcd="docker-compose down"
alias dcr="docker-compose restart"

# Quickly run the docker-compose exec command like this: 'dce service-name bash'
alias dce="docker-compose exec "

# Show the logs for the docker-compose stack in the current directory
# May be extended with the service name to get service-specific logs, like
# 'dcl php' to get the logs of the php container
alias dcl="docker-compose logs"

# 'docker ps' displays the currently running containers
alias dps="docker ps"

# This command is a neat shell pipeline to stop all running containers no matter
# where you are and without knowing any container names
alias dsa="docker ps -q | awk '{print $1}' | xargs -o docker stop"

# Lazydocker
alias lzd="lazydocker"

# ==============================================================
# Git aliases
# ==============================================================
alias git="hub -c core.commentChar='%'"
alias gcob="git checkout -b"
alias gc="git cola"
alias gco="git checkout"
alias gs="git status -sb"
alias gst="git status -sb"
alias gd="git diff --color-words"
alias gpf="git pull --ff-only"
alias gp="git pull"
alias gpom="git pull --ff-only origin master"
alias gf="git fetch"
alias gfo="git fetch origin"
alias gm="git merge"
alias gl="git lg"
alias gb="git branch"
alias ga="git add"

# ==============================================================
# Other usefull shortcuts
# ==============================================================
alias sl="ls"
alias shutdown='sudo shutdown –h now'
alias restart='sudo shutdown –r now'
alias docker-rm-all="docker ps -a | grep 'Exited' | awk '{print $1}' | xargs docker rm"
alias dc="docker-compose"
alias lsdir="find . -maxdepth 1 -type d -mindepth 1 -exec du -hs {} \;"

# ==============================================================
# Use neovim instead of vim
# ==============================================================
alias vim="NVIM_TUI_ENABLE_TRUE_COLOR=1 nvim"
alias vi="NVIM_TUI_ENABLE_TRUE_COLOR=1 nvim"
alias oldvim="\vim"

# Close terminal with vim :q
alias :q="exit"

alias shrug="printf '¯\_(ツ)_/¯' | pbcopy"
alias flipt="printf '(╯°□°)╯︵ ┻━┻' | pbcopy"
alias fight="printf '(ง'̀-'́)ง' | pbcopy"

alias n=npx

alias icloud="cd ~/Library/Mobile\ Documents/com~apple~CloudDocs/"
