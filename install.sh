#!/usr/bin/env bash

# Update Brew
brew update && brew upgrade
brew tap caskroom/cask
brew tap homebrew/services

# Install GnuPG to enable PGP-signing commits.
brew install gnupg

# Install more recent versions of some macOS tools.
brew install macvim grep openssh screen coreutils moreutils findutils gnu-sed
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.

# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff sfnt2woff-zopfli woff2


# Install some CTF tools; see https://github.com/ctfs/write-ups.
brew install aircrack-ng bfg binutils binwalk cifer dex2jar dns2tcp fcrackzip foremost \
	hashpump hydra john knock netpbm nmap pngcheck socat sqlmap tcpflow tcpreplay \
	tcptrace ucspi-tcp xpdf xz wget

# Install other useful binaries.
brew install ack git git-lfs imagemagick lua lynx p7zip pigz pv rename rlwrap \
	ssh-copy-id tree vbindiff zopfli jq htop circleci terraform
brew cask install docker

# Install k8s tools
brew install kops kubernetes-cli kubernetes-helm stern
## Zsh namespace prompt
brew tap superbrothers/zsh-kubectl-prompt
brew install zsh-kubectl-prompt
git clone https://github.com/ahmetb/kubectl-aliases.git --depth=1
mv kubectl-aliases/.kubectl_aliases ${HOME}
echo "[ -f ~/.kubectl_aliases ] && source ~/.kubectl_aliases" >> ${HOME}/.zshrc
rm -rf ./kubectl-aliases
## Namespace selector
curl https://raw.githubusercontent.com/blendle/kns/master/bin/kns -o /usr/local/bin/kns && chmod +x $_
## Telepresence
brew cask install osxfuse
brew install datawire/blackbird/telepresence

# Install Mongo
brew tap mongodb/brew
brew install mongodb-community
sudo mkdir -p /data/db
sudo chown -R `{whoami}`: /data/db

# Install Mysql
brew install mysql

# Install Java8
brew tap caskroom/versions
brew cask install java8

# Remove outdated versions from the cellar.
brew cleanup

# Powerline Fonts
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts && ./install.sh
cd .. && rm -rf fonts

# Install Janus VIM
curl -L https://bit.ly/janus-bootstrap | bash

# Apply DotFiles
for file in ~/.{path,exports,aliases,functions,extra,path}; do
	[[ -r "$file" ]] && [[ -f "$file" ]] && source "$file";
done;
unset file;

