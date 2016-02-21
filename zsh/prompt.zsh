autoload colors && colors

if (( $+commands[git] ))
then
  git="$commands[git]"
else
  git="/usr/bin/git"
fi

git_commit_count_master() {
    cc=$(git log --oneline origin/master..HEAD 2>/dev/null | wc -l)
    if [[ $cc == 0 ]]
    then
        echo ""
    else
        echo " %{$fg_no_bold[magenta]%}[$cc]%{$reset_color%}"
    fi
}

git_branch() {
  echo $($git symbolic-ref HEAD 2>/dev/null | awk -F/ {'print $NF'})
}

git_dirty() {
  st=$($git status 2>/dev/null | sed '/^\s*$/d' | tail -n 1)
  if [[ $st == "" ]]
  then
    echo ""
  else
    if [[ "$st" =~ ^nothing ]]
    then
        echo " %{$fg_no_bold[green]%}($(git_prompt_info))%{$reset_color%}"
    else
        echo " %{$fg_no_bold[red]%}($(git_prompt_info))%{$reset_color%}"
    fi
  fi
}

git_prompt_info () {
 ref=$($git symbolic-ref HEAD 2>/dev/null) || return
 echo "${ref#refs/heads/}"
}


unpushed () {
  $git cherry -v @{upstream} 2>/dev/null
}

need_push () {
  if [[ $(unpushed) == "" ]]
  then
    echo ""
  else
    echo " (%{$fg_no_bold[magenta]%}x%{$reset_color%})"
  fi
}

directory_name(){
  echo "%{$fg_no_bold[cyan]%}%~%{$reset_color%}"
}

date_time_info(){
  echo "%{$fg_no_bold[cyan]%}%D %T%{$reset_color%}"
}

export PROMPT=$'$(directory_name)$(git_dirty) › '
set_prompt () {
  #export RPROMPT=$'$(date_time_info)'
}

precmd() {
  title "zsh" "%m" "%55<...<%~"
  set_prompt
}
