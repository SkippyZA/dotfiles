source install/common.sh

install_oh_my_zsh() {
  if [ ! -d ~/.oh-my-zsh ]; then
    git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
    success 'Checked out oh-my-zsh'
  else
    success 'Folder for oh-my-zsh already exists'
  fi
}

link_theme() {
  if [ ! -d ~/.oh-my-zsh/themes/mytheme.zsh-theme ]; then
    ln -s ~/.dotfiles/zsh/mytheme.zsh-theme ~/.oh-my-zsh/themes/mytheme.zsh-theme &>/dev/null
    success 'Linking zsh theme'
  else
    success 'Theme already installed'
  fi
}

install_oh_my_zsh
link_theme

