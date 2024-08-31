return {
  "vim-airline/vim-airline-themes",
  {
    "vim-airline/vim-airline",
    lazy = false,
    dependencies = {
      "vim-airline/vim-airline-themes"
    },
    config = function()
      vim.g.airline_powerline_fonts=1
      vim.g.airline_left_sep =''
      vim.g.airline_right_sep =''
      vim.g.airline_theme='gruvbox_material'

      vim.g["airline#extensions#ale#enabled"]=1
      vim.g["airline#extensions#tabline#enabled"]=1
      vim.g["airline#extensions#tabline#tab_min_count"]=2
      vim.g["airline#extensions#tabline#show_buffers"]=0
      vim.g["airline#extensions#tabline#show_splits"]=0
    end
  },
}
