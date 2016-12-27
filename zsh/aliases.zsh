# reload zsh config
alias reload!='source ~/.zshrc'

# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
    colorflag="--color"
else # OS X `ls`
    colorflag="-G"
fi

alias vim="nvim"

# Filesystem aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias l="ls -lah ${colorflag}"
alias la="ls -AF ${colorflag}"
alias ll="ls -lFh ${colorflag}"
alias lld="ls -l | grep ^d"
alias rmf="rm -rf"

# Helpers
alias grep='grep --color=auto'
alias df='df -h' # disk free, in Gigabytes, not bytes
alias du='du -h -c' # calculate disk usage for a folder

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en1"
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"

# Flush Directory Service cache
alias flush="dscacheutil -flushcache"

# View HTTP traffic
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# Trim new lines and copy to clipboard
alias trimcopy="tr -d '\n' | pbcopy"

# Recursively delete `.DS_Store` files
alias cleanup="find . -name '*.DS_Store' -type f -ls -delete"

# File size
alias fs="stat -f \"%z bytes\""

# ROT13-encode text. Works for decoding, too! ;)
alias rot13='tr a-zA-Z n-za-mN-ZA-M'

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# Stuff I never really use but cannot delete either because of http://xkcd.com/530/
alias stfu="osascript -e 'set volume output muted true'"
alias pumpitup="osascript -e 'set volume 10'"

# Kill all the tabs in Chrome to free up memory
# [C] explained: http://www.commandlinefu.com/commands/view/402/exclude-grep-from-your-grepped-output-of-ps-alias-included-in-description
alias chromekill="ps ux | grep '[C]hrome Helper --type=renderer' | grep -v extension-process | tr -s ' ' | cut -d ' ' -f2 | xargs kill"


# ==============================================================
# Other usefull shortcuts
# ==============================================================
alias sl="ls"
alias shutdown='sudo shutdown –h now'
alias restart='sudo shutdown –r now'
alias mounted='mount | column –t'
alias docker-rm-all="docker ps -a | grep 'Exited' | awk '{print $1}' | xargs docker rm"
alias dc="docker-compose"
alias lsDir="find . -maxdepth 1 -type d -mindepth 1 -exec du -hs {} \;"

alias vim="nvim"
alias vi="nvim"
alias oldvim="\vim"


# ==============================================================
# iflix shortcuts
# ==============================================================
alias iflix-start="DISABLE_AUTO_TITLE=true tmuxinator start iflix"
alias iflix-stop="tmuxinator stop iflix"
alias iflix-logs=awsLogs


# ==============================================================
# Methods for aliasing
# ==============================================================
awsLogs() {
  if [ "$#" -ne 1  ]; then
    echo "Usage: iflix-logs <service> <env default=iflix-staging> <start default=10m>"
  else
    awslogs get $1 --start="${3:=10m}" --profile ${2:=iflix-staging} --watch --timestamp
  fi
}
