#!/usr/bin/env bash

set -ex

xcode-select --install | true

# Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.2/install.sh | bash
nvm install --lts

# Install brew dump (lots of apps here)
brew bundle

# Oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Ohmyzsh plugins
git clone https://github.com/agkozak/zsh-z $ZSH_CUSTOM/plugins/zsh-z

cp -Rv files/ ~

# Fix .ssh permissions
chmod 700 ~/.ssh
chmod 600 ~/.ssh/*
chmod 644 ~/.ssh/*.pub

echo "All Done\!"
echo "Now follow the manual instructions at https://github.com/spamoom/dotfiles/blob/master/manual_steps.md"