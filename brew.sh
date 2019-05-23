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
brew update

# Upgrade any already-installed formulae.
brew upgrade --all

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

# Install `wget` with IRI support.
brew install wget --with-iri

# Install Python
brew install python
brew install python3

# Install ruby-build and rbenv
brew install ruby-build
brew install rbenv
LINE='eval "$(rbenv init -)"'
grep -q "$LINE" ~/.extra || echo "$LINE" >> ~/.extra

# Install more recent versions of some OS X tools.
brew install vim --override-system-vi
brew install homebrew/dupes/grep
brew install homebrew/dupes/openssh
brew install homebrew/dupes/screen

# Install font tools.
brew tap bramstein/webfonttools
brew install
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
 homebrew/x11/xpdf \
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
 imagemagick --with-webp \
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
 webkit2png \
 zopfli \
 pkg-config \
 libffi \
 pandoc \
 jq \
 htop

# Lxml and Libxslt
brew install \
 libxml2 \
 libxslt
brew link libxml2 --force
brew link libxslt --force

# Core casks
brew cask install --appdir="/Applications" alfred
brew cask install --appdir="~/Applications" iterm2
brew cask install --appdir="~/Applications" spotify
brew cask install --appdir="~/Applications" zoom
brew cask install --appdir="~/Applications" pritunl # vpn

# Development tool casks
brew cask install --appdir="/Applications" sublime-text
brew cask install --appdir="/Applications" atom
brew cask install --appdir="/Applications" virtualbox
brew cask install --appdir="/Applications" macdown
brew cask install --appdir="/Applications" postman


brew cask install --appdir="/Applications" gitter

# Run sections based on command line arguments
for ARG in "$@"
do
	if [[ $ARG == "server" ]] || [[ $ARG == "all" ]]; then
		echo ""
		echo "---------------------------------"
		echo "Install Server Development Tools."
		echo "---------------------------------"
		echo ""
		brew cask install --appdir="/Applications" intellij-idea

	fi
	if [[ $ARG == "web" ]] || [[ $ARG == "all" ]]; then
		echo ""
		echo "------------------------------"
		echo "Install Web Development Tools."
		echo "------------------------------"
		echo ""
		brew cask install --appdir="/Applications" webstorm
		brew cask install --appdir="/Applications" vscodium # vs-code
	fi
done

# Misc casks
brew cask install --appdir="/Applications" google-chrome
brew cask install --appdir="/Applications" slack
brew cask install --appdir="/Applications" lastpass
brew cask install --appdir="/Applications" muzzle

# Install Docker, which requires virtualbox
brew install docker
brew install boot2docker

# Install developer friendly quick look plugins; see https://github.com/sindresorhus/quick-look-plugins
brew cask install \
 qlcolorcode \
 qlstephen \
 qlmarkdown \
 quicklook-json \
 qlimagesize \
 webpquicklook \
 suspicious-package \
 quicklookase \
 qlvideo

# Remove outdated versions from the cellar.
brew cleanup

## Apply DotFiles
#for file in ~/.{path,exports,aliases,functions,extra}; do
#	[[ -r "$file" ]] && [[ -f "$file" ]] && source "$file";
#done;
#unset file;
