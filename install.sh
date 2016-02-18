#!/bin/sh

# https://github.com/thoughtbot/dotfiles/blob/master/install.sh

function install() {
  for name in *; do
    target="$HOME/.$name"

    if [ "$name" != 'install.sh' ] && [ "$name" != 'README.md' ] && [ "$name" != 'oh-my-zsh' ]; then
      rm -rf "$target"
      echo "ln -s "$PWD/$name" "$target""
      ln -s "$PWD/$name" "$target"
    fi
  done

  touch ~/.sensitive

  cp -R ~/.dotfiles/oh-my-zsh/custom ~/.oh-my-zsh/

  git clone https://github.com/tarjoilija/zgen.git ~/.zgen


}

install
