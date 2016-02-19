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
brew install caskroom/cask/brew-cask
brew tap caskroom/versions
brew tap choppsv1/term24

brew install coreutils
brew install tree
brew cask install iterm2-beta
brew install htop-osx
brew cask install vagrant
brew cask install vmware-fusion7
brew install pgcli

# Docker
brew install https://raw.githubusercontent.com/Homebrew/homebrew/658b09d6767bd22cb38d06982d6b50b53b9e3f61/Library/Formula/docker.rb
#brew cask install docker-compose

# Google
brew install Caskroom/versions/google-chrome-canary

# Link apps
brew linkapps

# Remove outdated versions from the cellar.
brew cleanup
