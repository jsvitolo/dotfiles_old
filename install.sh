#!/usr/bin/env bash

touch ~/.sensitive

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

git clone https://github.com/tarjoilija/zgen.git ~/.zgen

stow colors
stow erlang
stow git
stow ruby
stow shell
stow spacemacs-dir
stow tmux
stow zsh


mkdir -p ~/.tmux/plugins
mkdir -p ~/.tmux/themes

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
git clone https://github.com/seebi/tmux-colors-solarized.git ~/.tmux/themes/solarized

git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell

echo "/usr/local/bin/zsh" | sudo tee -a /etc/shells
chsh -s /usr/local/bin/zsh

#SPACEMACS
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d

git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.3.0

rm -rf ~/.zshrc

stow zsh

source ~/.zshrc

asdf plugin-add ruby https://github.com/asdf-vm/asdf-ruby
asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang
asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir
