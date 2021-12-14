#!/bin/bash

install_brew() {
    if ! command -v "brew" &> /dev/null; then
        printf "Homebrew not found, installing."
        # install homebrew
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        # set path
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi

    sudo softwareupdate --install-rosetta

    printf "Installing homebrew packages..."
    brew bundle
}

create_dirs() {
    declare -a dirs=(
        "$HOME/dev"
        "$HOME/Downloads/torrents"
        "$HOME/Desktop/screenshots"
    )

    for i in "${dirs[@]}"; do
        mkdir "$i"
    done
}

build_xcode() {
    if ! xcode-select --print-path &> /dev/null; then
        xcode-select --install &> /dev/null

        until xcode-select --print-path &> /dev/null; do
            sleep 5
        done
    fi
}

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

printf "== Creating directories\n"
create_dirs

printf "== Installing Xcode Command Line Tools\n"
build_xcode

printf "== Installing Homebrew packages\n"
install_brew

printf "== Installing extra packages\n"
chmod +x extra.sh
./extra.sh

printf "== Set macOS preferences\n"
./macos/.macos

printf "== Set zsh as default shell\n"
chsh -s $(which zsh)

printf "== Set Python to 3.10\n"
# setup pyenv / global python to 3.10.x
pyenv install 3.10 1>/dev/null
pyenv global 3.10 1>/dev/null

printf "==  Set Node to LTS\n"
# install n for version management
yarn global add n 1>/dev/null
# make cache folder (if missing) and take ownership
sudo mkdir -p /usr/local/n
sudo chown -R $(whoami) /usr/local/n
# take ownership of Node.js install destination folders
sudo chown -R $(whoami) /usr/local/bin /usr/local/lib /usr/local/include /usr/local/share
# install and use node lts
n lts

printf "== Installing vim-plug\n"
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

printf "== Stow dotfiles\n"
stow fzf git vim zsh z

printf "!! Done!\n"
