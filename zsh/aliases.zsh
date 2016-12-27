# ==============================================================
# Other usefull shortcuts
# ==============================================================
alias untar="tar -zxvf"
alias ls="ls -lAhtF"
alias sl="ls"
alias e='exit'
alias s='sudo'
alias c='clear'
alias shutdown='sudo shutdown –h now'
alias restart='sudo shutdown –r now'
alias mounted='mount | column –t'
alias tar-gz='tar -zcvf'
alias untar-gz='tar -zxvf'
alias docker-rm-all="docker ps -a | grep 'Exited' | awk '{print $1}' | xargs docker rm"
alias dc="docker-compose"
alias lsDir="find . -maxdepth 1 -type d -mindepth 1 -exec du -hs {} \;"

alias vim="nvim"
alias vi="nvim"
alias oldvim="\vim"

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

