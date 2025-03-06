#!/bin/bash

install_xcode() {
    if ! xcode-select --print-path &> /dev/null; then
        xcode-select --install &> /dev/null
        until xcode-select --print-path &> /dev/null; do
            sleep 5
        done
    fi
}

install_rosetta() {
	softwareupdate --install-rosetta --agree-to-license
}

install_brew() {
    if ! command -v "brew" &> /dev/null; then
        printf "Homebrew not found, installing."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
				echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> "$HOME/.zprofile"
				eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
}

install_brew_packages() {
    brew bundle
    brew cleanup
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

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

printf "== Creating directories \n"
create_dirs

printf "== Installing Xcode Command Line Tools \n"
install_xcode

printf "== Installing Rosetta 2 \n"
install_rosetta

printf "== Installing Homebrew \n"
install_brew

printf "== Installing Homebrew Packages \n"
install_brew_packages

printf "== Stowing dotfiles \n"
stow  git vim zsh

printf "Done!"
