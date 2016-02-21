# ==============================================================
# Other usefull shortcuts
# ==============================================================
alias untar="tar -zxvf"
alias p="python"
alias ls="ls -lAhtF"
alias sl="ls"
alias e='exit'
alias s='sudo'
alias c='clear'
alias shutdown='sudo shutdown –h now'
alias restart='sudo shutdown –r now'
alias mounted='mount | column –t'
alias virt='virtualenv --no-site-packages --prompt=\(venv:$(pwd|sed "s/.*\///")\) venv/; source venv/bin/activate'
alias tar-gz='tar -zcvf'
alias untar-gz='tar -zxvf'
alias b2d='boot2docker'
alias docker-rm-all="docker ps -a | grep 'Exited' | awk '{print $1}'"
