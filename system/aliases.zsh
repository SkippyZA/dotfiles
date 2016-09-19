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
