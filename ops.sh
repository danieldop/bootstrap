#!/usr/bin/env bash

K8S_VERSION=1.15.11
HELM_VERSION=2.13.0

export RC_FILE=${HOME}/.zshrc

# Install command-line tools using Homebrew.
# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Make sure we’re using the latest Homebrew.
brew update

# Install Ops tools
brew install terraform circleci go awscli awscli

## Install kubectl
curl -Lo kubectl https://storage.googleapis.com/kubernetes-release/release/v$K8S_VERSION/bin/darwin/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl

## Install helm
curl -LO -s https://storage.googleapis.com/kubernetes-helm/helm-v$HELM_VERSION-darwin-amd64.tar.gz
tar -zxvf helm-v${HELM_VERSION}-darwin-amd64.tar.gz && rm helm-v${HELM_VERSION}-darwin-amd64.tar.gz
sudo mv darwin-amd64/helm /usr/local/bin/helm
rm -rf darwin-amd64

# Dependant non-pinned packages
brew install stern kubectx

# Install k8s misc plugins

## k8s plugins
### kubectl aliases
git clone https://github.com/ahmetb/kubectl-aliases.git --depth=1
mv kubectl-aliases/.kubectl_aliases ${HOME}
rm -rf ./kubectl-aliases

### kubectl namespace selector
curl https://raw.githubusercontent.com/blendle/kns/master/bin/kns -o /usr/local/bin/kns && chmod +x $_

## kubectl zsh namespace prompt
brew tap superbrothers/zsh-kubectl-prompt
brew install zsh-kubectl-prompt

## Helm plugins
helm init --client-only
helm plugin install https://github.com/hypnoglow/helm-s3.git
helm plugin install https://github.com/mstrzele/helm-edit
helm plugin install https://github.com/databus23/helm-diff --version master

## Telepresence
brew cask install osxfuse
brew install datawire/blackbird/telepresence

## kubectl zsh namespace prompt
brew tap superbrothers/zsh-kubectl-prompt
brew install zsh-kubectl-prompt

# Finish installation into bash env
tee -a ${RC_FILE} << END

# kubectl-aliases
[[ -f ~/.kubectl_aliases ]] && source ~/.kubectl_aliases

# kubectl-prompt
autoload -U colors; colors
source /usr/local/etc/zsh-kubectl-prompt/kubectl.zsh
RPROMPT='%{$fg[red]%}($ZSH_KUBECTL_PROMPT)%{$reset_color%}'

source <(kubectl completion zsh)  # setup autocomplete in zsh into the current shell
END
