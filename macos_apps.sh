#!/usr/bin/env bash

# Install command-line tools using Homebrew

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

#install homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"


# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Brew Extras
brew tap caskroom/versions
brew tap chopp:sv1/term24
brew tap caskroom/fonts
#brew tap railwaycat/emacsmacport

brew install coreutils
brew install moreutils
brew install findutils
brew install gnu-sed --with-default-names
brew install wget --with-iri
#brew install macvim --override-system-vim --with-cscope --with-lua --with-ruby --with-python
#brew install emacs-mac --with-modules --with-xml2 --with-modern-icon --with-gnutls
brew install homebrew/dupes/grep
brew install openssl
brew install ack
brew install git
brew install rename
brew install tree
brew install htop-osx
brew install hub
brew install ctags
brew install ack
brew install editorconfig
brew install pgcli
brew install watchman
brew install tmux --HEAD
brew install earn
brew install reattach-to-user-namespace
brew install zsh
brew install ag
brew install aspell --with-lang-en --with-lang-pt_BR
brew install gettext
# brew install wxmac
# brew install pyenv
brew install yarn
#brew install neovim/neovim/neovim

#brew cask install xquartz
brew cask install iterm2-beta
brew cask install font-fira-code
brew cask install font-source-code-pro
brew cask install font-sourcecodepro-nerd-font
#brew cask install slack
#brew cask install google-chrome

brew linkapps

# Remove outdated versions from the cellar.
brew cleanup
