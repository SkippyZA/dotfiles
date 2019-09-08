# tmux-powerline styling
set -g status on
set -g status-interval 2
set -g status-left-length 45
set -g status-right-length 90
set -g status-fg white
set -g status-bg colour234

set -g status-left '#[fg=colour235,bg=colour252,bold] ❐ #S #[fg=colour252,bg=colour238,nobold]#[fg=colour248,bg=colour238,bold] #(whoami) #[fg=colour240,bg=colour234,nobold] '
set -g window-status-format "#[fg=white,bg=colour234] #I #W "
set -g window-status-current-format "#[fg=colour234,bg=colour39]#[fg=colour20,bg=colour39] #I  #W #[fg=colour39,bg=colour234]"

set -g status-right-length 24
set -g status-right "#[fg=colour234,bg=colour238,nobold] #[fg=colour248,bg=colour238,bold]%l:%M %p %d %b %Y "
