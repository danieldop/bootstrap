#!/usr/bin/env bash

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
# Upgrade any already-installed formulae.
brew update && brew upgrade

# Install GNU core utilities (those that come with OS X are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Install some other useful utilities like `sponge`.
brew install moreutils

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils

# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed

# Install `wget`
brew install wget

# Install Python
brew install python
brew install python3

# Install ruby-build and rbenv
brew install ruby-build
brew install rbenv
LINE='eval "$(rbenv init -)"'
grep -q "$LINE" ~/.extra || echo "$LINE" >> ~/.extra

# Install more recent versions of some OS X tools.
brew install \
 vim \
 grep \
 openssh \
 screen \
 bash

# Install font tools.
brew tap bramstein/webfonttools
brew install \
 sfnt2woff \
 sfnt2woff-zopfli \
 woff2
## Powerline Fonts
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts && ./install.sh
cd .. && rm -rf fonts

# Install some CTF tools; see https://github.com/ctfs/write-ups.
brew install \
 aircrack-ng \
 bfg \
 binutils \
 binwalk \
 cifer \
 dex2jar \
 dns2tcp \
 fcrackzip \
 foremost \
 hashpump \
 hydra \
 john \
 knock \
 netpbm \
 nmap \
 pngcheck \
 socat \
 sqlmap \
 tcpflow \
 tcpreplay \
 tcptrace \
 ucspi-tcp \
 xpdf \
 xz

# Install other useful binaries.
brew install \
 ack \
 dark-mode \
 git \
 git-lfs \
 git-flow \
 git-extras \
 hub \
 imagemagick \
 lua \
 lynx \
 p7zip \
 pigz \
 pv \
 rename \
 rhino \
 speedtest_cli \
 ssh-copy-id \
 tree \
 htop \
 webkit2png \
 zopfli \
 pkg-config \
 libffi \
 pandoc \
 jq \
 htop

## Lxml and Libxslt
#brew install \
# libxml2 \
# libxslt
#brew link libxml2 --force
#brew link libxslt --force

# Core casks
brew install --cask --appdir="/Applications" alfred
brew install --cask --appdir="~/Applications" iterm2
brew install --cask --appdir="~/Applications" spotify
brew install --cask --appdir="~/Applications" zoom
brew install --cask --appdir="~/Applications" pritunl # vpn

# Development tool casks
brew install --cask --appdir="/Applications" sublime-text
brew install --cask --appdir="/Applications" atom
brew install --cask --appdir="/Applications" macdown
brew install --cask --appdir="/Applications" postman
#brew install --cask --appdir="/Applications" sourcetree
brew install --cask --appdir="/Applications" jetbrains-toolbox
brew install --cask --appdir="/Applications" sequel-ace
brew install --cask --appdir="/Applications" gitter

# Misc casks
#brew install --cask --appdir="/Applications" google-chrome
brew install --cask --appdir="/Applications" slack
brew install --cask --appdir="/Applications" lastpass
brew install --cask --appdir="/Applications" muzzle

# Remove outdated versions from the cellar.
brew cleanup
