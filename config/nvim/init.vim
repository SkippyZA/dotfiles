source ~/.config/nvim/plugins.vim
source ~/.config/nvim/general.vim
source ~/.config/nvim/shortcuts.vim
source ~/.config/nvim/plugin-config.vim

" file type specific settings
augroup configgroup
  autocmd!

  " make quickfix windows take all the lower section of the screen when there are multiple windows open
  autocmd FileType qf wincmd J
augroup END

" vim:foldmethod=marker:foldlevel=0
