#!/usr/bin/env bash

set -ex

# Get sudo
sudo -v

xcode-select --install | true

# Git config
git config --global user.email "sam@netsells.co.uk"
git config --global user.name "Sam Jordan"

mkdir ~/bin

# Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.2/install.sh | bash
nvm install --lts

# Install brew dump (lots of apps here)
brew bundle

# Select xcode
sudo xcode-select -s /Applications/Xcode.app/Contents/Developer
sudo xcodebuild -license

# Oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Ohmyzsh plugins
git clone https://github.com/agkozak/zsh-z $ZSH_CUSTOM/plugins/zsh-z

cp -Rv files/ ~

# Fix .ssh permissions
chmod 700 ~/.ssh
chmod 600 ~/.ssh/*
chmod 644 ~/.ssh/*.pub

# Non-brewable
sudo pip3 install awscli-local

./macos.sh

echo "All Done\!"
echo "You should probably restart then follow the manual instructions at https://github.com/spamoom/dotfiles/blob/master/manual_steps.md"
