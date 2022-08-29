#!/usr/bin/env bash
#
# List of (and hopefully installs) all the apps I use on macos
#

# Install xcode before anything so xcode-select points to
# developer tool chain.
# If not whole xcode, just download the binaries for xcode-select

# Using Homebrew as package manager

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install \
  git \
  node \
  npm \
  go \
  python \
  fzf \
  ripgrep \
  fd \
  exa \
  exercism \
  neovim \
  moc \
  rsync \
  watch \
  z \
  stow \
  wget \
  zsh-autosuggestions \
  zsh-syntax-highlighting \
  chromaprint \

brew install --cask \
  android-studio \
  gimp \
  authy \
  kitty \
  bitwarden \
  megasync \
  breaktimer \
  nextcloud \
  displaperture \
  slack \
  docker \
  firefox \
  syncthing \
  zoom \
  font-fira-mono-nerd-font \

# At this point, pull dotfiles from git and stow links
# Ensure pip, python, npm are setup properly

pip install \
  black \
  pynvim \
  beets \
  pyacoustid \
  youtube-dl \
  twine \
  requests \
  ipython \
  bpytop \

npm --location=global install \
  neovim \
  prettier \
