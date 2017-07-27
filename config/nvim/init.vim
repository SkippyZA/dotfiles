source ~/.config/nvim/plugins.vim
source ~/.config/nvim/general.vim
source ~/.config/nvim/shortcuts.vim
source ~/.config/nvim/plugin-config.vim

" helpers for dealing with other people's code
nmap \t :set ts=2 sts=2 sw=2 noet<cr>
nmap \s :set ts=2 sts=2 sw=2 et<cr>

" Section AutoGroups {{{
" file type specific settings
augroup configgroup
    autocmd!

    " automatically resize panes on resize
    autocmd VimResized * exe 'normal! \<c-w>='

    autocmd BufWritePost .vimrc,.vimrc.local,init.vim source %
    " save all files on focus lost, ignoring warnings about untitled buffers
    autocmd FocusLost * silent! wa

    " make quickfix windows take all the lower section of the screen
    " when there are multiple windows open
    autocmd FileType qf wincmd J

    autocmd BufNewFile,BufReadPost *.md set filetype=markdown
    let g:markdown_fenced_languages = ['css', 'javascript', 'js=javascript', 'json=javascript', 'stylus', 'html']

    autocmd BufNewFile,BufRead,BufWrite *.md syntax match Comment /\%^---\_.\{-}---$/
augroup END

" }}}

" vim:foldmethod=marker:foldlevel=0
