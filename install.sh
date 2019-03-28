#!/usr/bin/env bash

# Install Brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update && brew upgrade

# Install Zshell
brew install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
brew install fzf && $(brew --prefix)/opt/fzf/install

# Install GnuPG to enable PGP-signing commits.
brew install gnupg

# Install more recent versions of some macOS tools.
brew install macvim grep openssh screen coreutils moreutils findutils gnu-sed
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.

# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff sfnt2woff-zopfli woff2

# Powerline Fonts
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts && ./install.sh
cd .. && rm -rf fonts

# Install some CTF tools; see https://github.com/ctfs/write-ups.
brew install aircrack-ng bfg binutils binwalk cifer dex2jar dns2tcp fcrackzip foremost \
	hashpump hydra john knock netpbm nmap pngcheck socat sqlmap tcpflow tcpreplay \
	tcptrace ucspi-tcp xpdf xz wget

# Install other useful binaries.
brew install ack git git-lfs imagemagick lua lynx p7zip pigz pv rename rlwrap \
	ssh-copy-id tree vbindiff zopfli jq htop circleci

# Install k8s tools
brew install kops kubernetes-cli kubernetes-helm stern
## Zsh namespace prompt
brew tap superbrothers/zsh-kubectl-prompt
brew install zsh-kubectl-prompt
git clone https://github.com/ahmetb/kubectl-aliases.git --depth=1
mv kubectl-aliases/.kubectl-aliases ${HOME} && rm -rf kubectl-aliases
echo "[ -f ~/.kubectl_aliases ] && source ~/.kubectl_aliases" >> ${HOME}/.zshrc
## Telepresence
brew cask install osxfuse
brew install datawire/blackbird/telepresence

# Install Mongo
brew tap mongodb/brew
brew install mongodb-community

# Install Java8
brew tap caskroom/versions
brew cask install java8

# Remove outdated versions from the cellar.
brew cleanup

# Install Janus VIM
curl -L https://bit.ly/janus-bootstrap | bash
