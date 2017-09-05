echo -e "\nDoing zsh stuff:"

printf "  Installing oh-my-zsh... "
if [ ! -d ~/.oh-my-zsh ]; then
  git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh &>/dev/null
  echo "done"
else
  echo "exists"
fi

printf "  Linking zsh theme... "
if [ ! -f ~/.oh-my-zsh/themes/mytheme.zsh-theme ]; then
  ln -s ~/.dotfiles/zsh/mytheme.zsh-theme ~/.oh-my-zsh/themes/mytheme.zsh-theme &>/dev/null
  echo "done"
else
  echo "exists"
fi

printf "  Creating vim directories... "
if [ ! -d ~/.vim-tmp ]; then
  mkdir -p ~/.vim-tmp &>/dev/null
  echo "done"
else
  echo "exists"
fi
