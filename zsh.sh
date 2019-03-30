#!/usr/bin/env bash

# Update Brew
brew update && brew upgrade
brew install curl

# Install Zshell
brew install zsh

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
brew install fzf && $(brew --prefix)/opt/fzf/install
