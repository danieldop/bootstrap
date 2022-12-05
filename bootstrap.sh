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

install_rosetta() {
if ! xcode-select --print-path &> /dev/null; then
xcode-select --install &> /dev/null

until xcode-select --print-path &> /dev/null; do
sleep 5
done
fi
}

install_xcode() {
    if ! xcode-select --print-path &> /dev/null; then
        xcode-select --install &> /dev/null

        until xcode-select --print-path &> /dev/null; do
            sleep 5
        done
    fi
}

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

printf "== Creating directories"
printf "\n"
create_dirs

printf "== Installing Xcode Command Line Tools"
printf "\n"
install_xcode

printf "== Installing Homebrew packages"
printf "\n"
install_brew

 printf "== Installing extra packages"
 printf "\n"
 chmod +x extra.sh
 ./extra.sh

 printf "== Setting macOS preferences"
 printf "\n"
 ./macos/.macos

printf "== Stowing dotfiles"
printf "\n"
stow fzf zsh git fleet 

printf "!! Done!"
